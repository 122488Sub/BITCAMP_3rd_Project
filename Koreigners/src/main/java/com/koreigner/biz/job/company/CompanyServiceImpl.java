package com.koreigner.biz.job.company;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.job.jobservice.JobService;
import com.koreigner.common.member.MailHandler;
import com.koreigner.common.member.MailUtil;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public List<CompanyVO> getCateList() {
		List<CompanyVO> list = companyDAO.getCateList();
		return list;
	}
	
	@Override
	public List<CompanyVO> getCateChild(String cate_kor) {
		List<CompanyVO> list = companyDAO.getCateChild(cate_kor);
		
		return list;
	}
	
	@Override
	public List<CompanyVO> getAddrDoList() {
		List<CompanyVO> list = companyDAO.getAddrDoList();
				
		return list;
	}
	
	@Override
	public List<CompanyVO> getAddrSiList(String si_kor) {
		List<CompanyVO> list = companyDAO.getAddrSiList(si_kor);
		return list;
	}
	
	@Override
	public CompanyVO getCateEn(Map<String, String> map) {
		CompanyVO outVO = companyDAO.getCateEn(map);
		return outVO;
	}
	
	@Override
	public void comJoin(CompanyVO vo, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		
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
        		.append("<a href='http://localhost:8080/koreigner/emailAuth.do?mem_id=")
        		.append(vo.getMem_id())
        		.append("' target='_blank'>이메일 인증 확인</a>")
        		.toString());
        sendMail.setFrom("jeyi2756@gmail.com", "관리자");

        sendMail.setTo(vo.getMem_id());
        sendMail.send();
		
		Map<String, String> map = new HashMap<>();
		map.put("cate_prnt_ko", vo.getCate_prnt_ko());
		map.put("cate_child_ko", vo.getCate_child_ko());
		
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(map);      //영어 카테고리 vo 생성
		String imgName = jobService.saveImg(vo.getBusiness_file());	  //저장 사업자등록증 이미지 명
		String ip = request.getRemoteAddr();  					      //ip
		String pw = jobService.pwEncoder(vo.getMem_pw());             //비밀번호 바인드 형태로 인코딩
		
		vo.setBusiness_img(imgName);                             	  //저장 사업자등록증 이미지 명 vo에 추가
		vo.setIp(ip);											 	  //ip vo에 추가
		vo.setMem_pw(pw);  											  //바이너리 비밀번호 vo에 추가
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());         	  //영어 카테고리 대분류 vo에 추가
		vo.setCate_child_en(enCate_vo.getCate_child_en());       	  //영어 카테고리 소분류 vo에 추가
		
		companyDAO.comJoin(vo);
	}
	
	
	public String getComName(String mem_id) {
		String companyName = companyDAO.getComName(mem_id);
		return companyName;
	}

	@Override
	public CompanyVO companyDetailOne(String mem_id) {
		CompanyVO companyVO = companyDAO.companyDetailOne(mem_id);
		return companyVO;
	}

	@Override
	public List<CompanyVO> getCateEnChild(String cate_en) {
		List<CompanyVO> list = companyDAO.getCateEnChild(cate_en);
		return list;
	}

	@Override
	public List<CompanyVO> getChildCate(String cate_prnt_en) {
		List<CompanyVO> list = companyDAO.getChildCate(cate_prnt_en);
		
		return list;
	}

	
	
}
