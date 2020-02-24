package com.koreigner.biz.member;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.koreigner.common.member.MailHandler;
import com.koreigner.common.member.MailUtil;
import com.koreigner.common.member.SecurityUtil;
import com.koreigner.common.member.SupportUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.impl.crypto.MacProvider;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SecurityUtil securityUtil;
	
	
	
	//회원가입중 client가 입력한 email이 db에 이미 등록되어 있는지 중복 체크 한다.
	@Override
	public int userIdCheck(UserVO vo) {
		
		int idCnt = userDAO.userIdCheck(vo);
		System.out.println("idCnt: " + idCnt);

		return idCnt;
	}
	
	//회원가입중 client가 입력한 NickName이 db에 이미 등록되어 있는지 중복 체크 한다.
	@Override
	public int userNickCheck(UserVO vo) {
		
		int nameCnt = userDAO.userNickCheck(vo);
		System.out.println("nameCnt: " + nameCnt);

		return nameCnt;
	}
	
	// 회원 등록
	@Override
	public void joinUser(UserVO vo) throws Exception {
		
		//인증 메일 보내기
		Properties prop = System.getProperties();
		 prop.put("mail.smtp.starttls.enable", "true");
	     prop.put("mail.smtp.host", "smtp.gmail.com");
	     prop.put("mail.smtp.auth", "true");
	     prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailUtil(); // google 인증
        
        Session session = Session.getDefaultInstance(prop, auth); //session에 담기
        
        MimeMessage msg = new MimeMessage(session);
        MimeMessageHelper helper = new MimeMessageHelper(msg);
        
        helper.setSentDate(new Date());
        
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[KOREIGNERS 회원가입 이메일 인증]");
        sendMail.setText(new StringBuffer()
        		.append("<h1>메일인증</h1>")
        		.append("<a href='http://localhost:8080/biz/emailConfirm.do?mem_id=")
        		.append(vo.getMem_id())
        		.append("' target='_blank'>이메일 인증 확인</a>")
        		.toString());
        sendMail.setFrom("jeyi2756@gmail.com", "관리자");

        sendMail.setTo(vo.getMem_id());
        sendMail.send();

        
		// 비밀번호 암호화
		String securedPw = securityUtil.encryptSHA256(vo.getMem_pw());
		vo.setMem_pw(securedPw);
		
		
		userDAO.joinUser(vo);		
	}
	
	//회원가입 후 이메일인증 완료하면 auth 권한 상승
	@Override
	public void updateAuthstatus(UserVO vo) {
		userDAO.updateAuthstatus(vo);		
	}
	
	// 비밀번호 재설정 메일 보내기
	@Override
	public void resetPasswordMail(String email) throws Exception  {
		
		Properties prop = System.getProperties();
		 prop.put("mail.smtp.starttls.enable", "true");
	     prop.put("mail.smtp.host", "smtp.gmail.com");
	     prop.put("mail.smtp.auth", "true");
	     prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailUtil();
        
        Session session = Session.getDefaultInstance(prop, auth);

        MimeMessage msg = new MimeMessage(session);
        MimeMessageHelper helper = new MimeMessageHelper(msg);
        
        helper.setSentDate(new Date());
        
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[KOREIGNERS 비밀번호 재설정 안내]");
        sendMail.setText(new StringBuffer()
        		.append("<h1>비밀번호 재설정</h1>")
        		.append("<a href='http://localhost:8080/biz/resetPassword_2.do?mem_id=")
        		.append(email)
        		.append("' target='_blank'>비밀번호 변경</a>")
        		.toString());
        sendMail.setFrom("jeyi2756@gmail.com", "관리자");

        sendMail.setTo(email);
        sendMail.send();
		
	}
	
	//비밀번호 재설정
	@Override
	public void resetPassword(UserVO vo) {
		
		// 비밀번호 암호화
		String securedPw = securityUtil.encryptSHA256(vo.getMem_pw());
		vo.setMem_pw(securedPw);
		
		userDAO.updatePassword(vo);		
	}

	//로그인 처리
	@Override
	public boolean checkLogin(String inputId, String inputPw) {
		boolean isSuccess =false;
		try {
			//암호화된 비밀번호 추출
			String securedPw = securityUtil.encryptSHA256(inputPw);
			if(userDAO.userLoginCheck(inputId, securedPw) != null) {
				isSuccess=true;
			}
		} catch(Exception e){
			System.out.println("[registerAccount] : " + e.getMessage());
		}	
		return isSuccess;
	}


	//=========================== JWT Token ===============================
	
	private final String TOKEN_FILE_NAME = "token_key"; //토큰 파일 이름
	
	@Resource(name="baseSecretPath") //기본 토큰파일이 저장될 경로(applicationContext.xml에 빈 설정함)
	private String baseSecretPath;

	/**
	 * 토큰을 생성하는 메서드
	 * @param tokenUserId 토큰 생성을 요청한 사용자 id
	 * @return 토큰값을 반환한다.
	 */
	@Override
	public String createToken(String tokenUserId) {
		String tokenStr = ""; //토큰 값이 저장될 변수
		
		String issure = "Jeyi"; //토큰 발급자
		String subject = "tokenData"; //토큰의 주제 (즉 토큰에 담길 내용)
		Date exDate = new Date(System.currentTimeMillis() + 60000*60); //토큰 만료 시간 (1시간)
		Key tokenKey = MacProvider.generateKey(SignatureAlgorithm.HS256); //토큰의 서명 알고리즘
		tokenStr = Jwts.builder()
				.setIssuer(issure)
				.setSubject(subject)
				.setAudience(tokenUserId)
				.setId(SupportUtil.makeUUID2String())
				.setExpiration(exDate)
				.setIssuedAt(new Date()) //토큰 발행 시점(토큰 유효기간 검사에 활용)
				.signWith(SignatureAlgorithm.HS256, tokenKey)
				.compact(); //토큰 생성 
		makeHS512KeyFile(tokenKey, tokenUserId); //토큰 검증을 위해 키를 파일로 생성하고 저장한다.
		return tokenStr;
	}

	/**
	 * 토큰에 사용되는 Key 객체를 파일로 만들어주는 메서드
	 * @param keyObject 키 객체
	 * @param userId 키를 생성하게 된 사용자 ID
	 */
	private void makeHS512KeyFile(Key keyObject, String userId) {
		FileChannel fileChannel;
		String separatorStr = FileSystems.getDefault().getSeparator();
		String tokenDir = baseSecretPath+separatorStr+userId;
		String tokenPath = tokenDir+separatorStr+TOKEN_FILE_NAME;
		String keyObjStr= Base64Utils.encodeToString(keyObject.getEncoded());
		
		//토큰파일이 존재하는 경우 삭제해준다.
		if(Files.exists(Paths.get(tokenPath))) {
			try{Files.delete(Paths.get(tokenPath));}
			catch(Exception e){System.out.println("makeHS512KeyFile = " + e.getMessage());}
		}
		
		try {
			Files.createDirectories(Paths.get(tokenDir)); //디렉토리 생성
			Files.createFile(Paths.get(tokenPath)); //토큰 디렉토리에 토큰 키 파일을 생성
			fileChannel = FileChannel.open(Paths.get(tokenPath), StandardOpenOption.WRITE); //파일 쓰기
			
			ByteBuffer buffer = ByteBuffer.allocateDirect(keyObjStr.length());
			Charset charset = Charset.forName("UTF-8");
			buffer = charset.encode(keyObjStr);
			
			fileChannel.write(buffer);
			fileChannel.close();
		}
		catch(IOException e) {System.out.println("makeHS512KeyFile = " + e.getMessage());}
	}
	
	/**
	 * 전달받은 토큰을 검증하는 메서드
	 * @param tokenStr 토큰값
	 * @param userId 토큰을 발급받은 사용자 id
	 * @return 결과를 String으로 반환
	 */
	@Override
	public String validToken(String tokenStr, String userId) {
		String resultMsg = "";
		try {
			Jwts.parser().setSigningKey(getKeyObject4File(userId)).parseClaimsJws(tokenStr).getBody();
			resultMsg="Pass";
		}
		catch(ExpiredJwtException eje) { //토큰의 만료시간이 지난 경우
			resultMsg = "expiredTokenDate";
		}
		catch(SignatureException se) { //토큰의 서명 검증이 위조되거나 문제가 생긴 경우
			resultMsg = "wrongSign";
		}
		return resultMsg;
	}
	
	/**
	 * 토큰의 정보를 뽑아내는 메서드 
	 * @param tokenStr 토큰
	 * @return 토큰의 정보가 담긴 Map 객체를 반환
	 */
	@Override
	public Map<String, Object> getTokenPayload(String tokenStr) {
		
		Map<String, Object> payloadMap = new HashMap<>();
		
		ObjectMapper om = new ObjectMapper();
		
		String encodedTokenPayload = tokenStr.split("\\.")[1]; //토큰의 바디 부분을 추린다. 
		
		String tokenPayload = new String(new Base64(true).decode(encodedTokenPayload)); //토큰의 바디를 디코딩한다.
		
		try {
			payloadMap = om.readValue(tokenPayload, new TypeReference<Map<String, Object>>(){});
		//토큰의 값을 Map으로 객체화 시킨다.	
		} catch(Exception e) {
			System.out.println("[getTokenPayload] + " + e.getMessage());
		}
		
		return payloadMap;
	}
	
	/**
	 * 저장된 파일에서 Key 객체를 가져오는 메서드
	 * @param userID 사용자 Id
	 * @return 파일에서 받아온 키 객체를 반환한다.
	 */
	private Key getKeyObject4File(String userID) {
		FileChannel fileChannel;
		String keyStr = "";
		String separatorStr = FileSystems.getDefault().getSeparator();
		String tokenDir = baseSecretPath+separatorStr+userID;
		String tokenPath = tokenDir+separatorStr+TOKEN_FILE_NAME;
		try {
			fileChannel = FileChannel.open(Paths.get(tokenPath));
			ByteBuffer buffers = ByteBuffer.allocateDirect(100);
			Charset charset = Charset.forName("UTF-8");
			
			int byteCnt = 0;
			while(true){
				byteCnt=fileChannel.read(buffers);
				if(byteCnt==-1)break;
				buffers.flip();
				keyStr += charset.decode(buffers).toString();
				buffers.clear();
			}
			fileChannel.close();

		}
		catch(IOException e) {
			System.out.println("getKeyObject4File = " + e.getMessage());
		}
		return new SecretKeySpec(Base64Utils.decodeFromString(keyStr), "HmacSHA256");
	}
}