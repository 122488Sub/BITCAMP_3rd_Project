package com.koreigner.view.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.member.mypage.c_MyPageService;
import com.koreigner.biz.member.mypage.c_MyPageVO;
import com.koreigner.biz.member.mypage.p_MyPageVO;
import com.koreigner.biz.member.resume.ResumeService;

@Controller
public class c_MyPageController {

	@Autowired
	private c_MyPageService cService;
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	PagingService paging;
	
	@RequestMapping(value="getCompanyHireList.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> companyHireListData(c_MyPageVO cVO,HttpServletRequest request, HttpServletResponse response) {
		
		//리스트 정보 검색
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
	
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, cVO);
		
		cVO.setBegin(p.getBegin());
		cVO.setEnd(p.getEnd());
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("cHire",cService.getHireMyAdsList(cVO));
		result.put("pvo",p);
		request.setAttribute("pvo", p);
		return result;
		
	}
	
	@RequestMapping(value="getCompanyApply.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object>  companyApplyListData(c_MyPageVO cVO,HttpServletRequest request, HttpServletResponse response) {
		
		//리스트 정보 검색
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
	
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, cVO);
		
		cVO.setBegin(p.getBegin());
		cVO.setEnd(p.getEnd());
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("cResume",cService.getResumeApplyList(cVO));
		
		
		result.put("pvo",p);
		request.setAttribute("pvo", p);
		return result;
		
	}
	
	@RequestMapping(value="resumePage_go.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView  resumePage_go(c_MyPageVO cVO,HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView("member/mypage/p_resume.page");

		System.out.println("//mypage이동 컨트롤러에서 mem_id : " + cVO.getMem_id());
		Map<String, Object> map = resumeService.selectResume(cVO.getMem_id());
		System.out.println("//mypage이동 컨트롤러에서 map : " + map);
		
		if(map != null) {
			mv.addObject("map", map.get("map"));
			mv.addObject("careerList", map.get("careerList"));
			mv.addObject("fileList", map.get("fileList"));					
		}
		return mv;
		
	}
	
	@RequestMapping(value="togleApply.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> togleApply(HttpServletRequest request, c_MyPageVO cVO, Model model) {
		System.out.println("togleApply");
		
		
		Map<String,Object> map=new HashMap<String, Object>();
		map=cService.togleApply(cVO);
		
		return map;
	}
	
	
}