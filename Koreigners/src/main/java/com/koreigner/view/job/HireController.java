package com.koreigner.view.job;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
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
	@Autowired
	PagingService paging;
	
	//채용 게시판으로 이동
	@RequestMapping(value="hireList_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hireList(HttpServletRequest request, HttpServletResponse response) {
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage);
		
		//EL, JSTL 사용을 위한 속성 등록
		request.setAttribute("pvo", p);
		
		return "job/hire/hireList.page";
	}

	
	@RequestMapping(value="hireListData.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String hireListDate(HttpServletRequest request, 
							   HttpServletResponse response) {
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage);
		
		// 여러개의 파라미터값을 vo와 상관없이 매개변수로 사용하는 방법 :map형식 
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		//리스트 정보 검색
		List<HireVO> list = hireServiceImpl.getHireList(map);
		String result = hireServiceImpl.getHireListJson(list, p);
		request.setAttribute("pvo", p);
		
		return result;
	}

	@RequestMapping(value="hireDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView hireDetaile(HttpServletRequest request, 
									HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		int hire_idx = Integer.parseInt(request.getParameter("hire_idx"));
		System.out.println("hire_idx : " + hire_idx);
		ModelAndView mav = new ModelAndView();
		
		//1. 게시글 조회 수 1 증가 처리
		hireServiceImpl.hireHIT(hire_idx);
		
		//2. 게시글(hire_idx) 데이터 조회 
		HireVO hireVO = hireServiceImpl.hireDetailOne(hire_idx);
		CompanyVO companyVO = companyServiceImpl.companyDetailOne("rex");
		
		mav.addObject("hireVO", hireVO);
		mav.addObject("companyVO", companyVO);
		mav.setViewName("job/hire/hireDetail.page");
		
		return mav;
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
	
	//채용게시글 위시리스트 추가
	@RequestMapping(value="hireWishList.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int hireWishList(@RequestParam("hire_idx")int hire_idx,
							@RequestParam("mem_id")String mem_id) {
		HireVO hireVO = new HireVO();
		hireVO.setHire_idx(hire_idx);
		hireVO.setMem_id(mem_id);
		
		hireServiceImpl.wishInsert(hireVO);
		
		return 1;
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
