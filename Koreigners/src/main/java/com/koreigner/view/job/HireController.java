package com.koreigner.view.job;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//채용 게시판으로 이동
	@RequestMapping(value="hireList_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hireList() {
		
		
		return "job/hire/hireList.page";
	}

	@RequestMapping(value="hireListData.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<HireVO> hireListDate() {
		
		List<HireVO> hireList = hireServiceImpl.getHireList(); 
		
		System.out.println("hireList : " + hireList);
		return hireList;
	}
	
	
	//채용 게시글쓰기로 이동
	@RequestMapping(value="hireWrite_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hireWrite() {
		return "job/hire/hireWrite.page";
	}
	
	@RequestMapping(value="hirePost.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hirePost(HireVO vo, HttpServletRequest request) {
		
		hireServiceImpl.insertHire(vo, request);
		
		System.out.println("vo.toStringAddr() : " + vo.toStringAddr());
		System.out.println("vo.toStringCate() : " + vo.toStringCate());
		System.out.println("vo.toString() : " + vo.toString());
		
		return "job/hire/hireWrite.page";
	}
	
	
	//페이지 전환 시 jobCateMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("jobWriteCate")
	public Map<String, String> searchJobCateMap() {
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
