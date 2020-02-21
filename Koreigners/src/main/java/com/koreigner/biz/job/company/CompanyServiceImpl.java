package com.koreigner.biz.job.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.job.jobservice.JobService;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
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
	public void comJoin(CompanyVO vo, HttpServletRequest request) {
		
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
		
		
		System.out.println("vo.toStringAddress() : " + vo.toStringAddress());
		System.out.println("vo.toStringCate() : " + vo.toStringCate());
		System.out.println("vo.toString() : " + vo.toString());
		
		
		companyDAO.comJoin(vo);
	}

}
