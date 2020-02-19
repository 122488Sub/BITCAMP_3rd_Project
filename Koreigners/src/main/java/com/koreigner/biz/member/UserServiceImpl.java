package com.koreigner.biz.member;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koreigner.common.member.MailHandler;
import com.koreigner.common.member.MailUtil;
import com.koreigner.common.member.SecurityUtil;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SecurityUtil securityUtil; 

	// 중복 아이디(이메일) 체크
	@Override
	public int userIdCheck(UserVO vo) {
		
		int idCnt = userDAO.userIdCheck(vo);
		System.out.println("idCnt: " + idCnt);

		return idCnt;
	}
	
	// 중복 닉네임 체크
	@Override
	public int userNameCheck(UserVO vo) {
		
		int nameCnt = userDAO.userNameCheck(vo);
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
        sendMail.setSubject("[회원가입 이메일 인증]");
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
	
	// 권한 업데이트(가입승인)
	@Override
	public void updateAuthstatus(UserVO vo) {
		userDAO.updateAuthstatus(vo);		
	}

	// 로그인
	@Override
	@Transactional
	public int userLoginCheck(UserVO vo) {
		
		// 암호화된 비밀번호로 조회
		String securedPw = securityUtil.encryptSHA256(vo.getMem_pw());
		vo.setMem_pw(securedPw);
		
		int userCnt = userDAO.userLoginCheck(vo);
		System.out.println("userCnt: " + userCnt);

		return userCnt;
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
        sendMail.setSubject("[비밀번호 재설정 안내]");
        sendMail.setText(new StringBuffer()
        		.append("<h1>비밀번호 재설정</h1>")
        		.append("<a href='http://localhost:8080/biz/resetPassword_2.jsp?mem_id=")
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
	
}