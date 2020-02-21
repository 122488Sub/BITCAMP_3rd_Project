package com.koreigner.view.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.job.hire.HireServiceImpl;
import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.job.jobservice.JobService;

@Controller
public class HireController {
	@Autowired
	HireServiceImpl hireServiceImpl;
	@Autowired
	CompanyServiceImpl companyServiceImpl;
	@Autowired
	JobService jobService;
	
	
	@RequestMapping(value="hireWrite_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hireWrite() {
		return "job/hire/hireWrite.page";
	}
	
	@RequestMapping(value="hirePost.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hirePost(HireVO vo, HttpServletRequest request) {
		
		String ip = request.getRemoteAddr();  					 //ip
		Map<String, String> map = new HashMap<>();
		System.out.println("vo.getCate_prnt_ko() : " + vo.getCate_prnt_ko()) ;
		map.put(vo.getCate_prnt_ko(), vo.getCate_child_ko());
		
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(map); //영어 카테고리 vo 생성
		
		vo.setIp(ip);											 //ip vo에 추가
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());         //영어 카테고리 대분류 vo에 추가
		vo.setCate_child_en(enCate_vo.getCate_child_en());       //영어 카테고리 소분류 vo에 추가
		
		System.out.println("vo.toStringAddr() : " + vo.toStringAddr());
		System.out.println("vo.toStringCate() : " + vo.toStringCate());
		System.out.println("vo.toString() : " + vo.toString());
		
		return "job/hire/hireWrite.page";
	}
	
	@RequestMapping(value="checkbox.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkBox(HireVO vo) {
		List<String> insurance = vo.getInsurance();
		
		for(String ins : insurance) {
			System.out.println("ins : " + ins);
		}
		return "";
	}
	
	
	//페이지 전환 시 jobCateMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("jobWriteCate")
	public Map<String, String> searchJobCateMap() {
		System.out.println("여기옴?");
		List<CompanyVO> list = companyServiceImpl.getCateList();
		//카테고리 대분류 문자 map에 저장
		Map<String, String> jobCateMap = new HashMap<>();
		
		int i = 1;
		for(CompanyVO vo : list) {
			jobCateMap.put(Integer.toString(i), vo.getCate_prnt_ko());
			i++;
		}
		return jobCateMap;
		
	}
	
}
