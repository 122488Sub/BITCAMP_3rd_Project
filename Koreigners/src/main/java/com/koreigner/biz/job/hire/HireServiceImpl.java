package com.koreigner.biz.job.hire;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.job.jobservice.JobService;

@Service
public class HireServiceImpl implements HireService {

	@Autowired
	private HireDAO hireDAO;
	@Autowired
	private JobService jobService;
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
	
	
	@Override
	public void insertHire(HireVO vo, HttpServletRequest reqeust) {
		
		String ip = reqeust.getRemoteAddr();  	//ip
		String insurance = jobService.insuranceInfo(vo.getInsuranceInfo()); //보험 유무 데이터 ex) 0111
		
		Map<String, String> map = new HashMap<>();
		map.put("cate_prnt_ko", vo.getCate_prnt_ko());
		map.put("cate_child_ko", vo.getCate_child_ko());
		
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(map); //영어 카테고리 vo 생성
		vo.setInsurance(insurance);                              //보험정보 vo에 추가
		vo.setIp(ip);											 //ip vo에 추가
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());         //영어 카테고리 대분류 vo에 추가
		vo.setCate_child_en(enCate_vo.getCate_child_en());       //영어 카테고리 소분류 vo에 추가
		vo.setMem_id("rex");
		
		System.out.println("vo.toString() : " + vo.toString());
		
		hireDAO.insertHire(vo);
	}
	
	
	public List<HireVO> getHireList() {
		
		List<HireVO> hireList = hireDAO.getHireList();
		return hireList;
	}
}
