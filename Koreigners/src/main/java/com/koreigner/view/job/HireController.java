package com.koreigner.view.job;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		System.out.println("p.getEnd() : " + p.getEnd());
		
		List<HireVO> list = hireServiceImpl.getHireList(map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>list : " + list);
		
		String result = "{";
		
		result += "\"list\" : [";
		
		for(HireVO vo : list) {
			System.out.println("result list : " + result);
			result += "{";
			result += "\"hire_idx\":\"" + vo.getHire_idx() + "\","; 
			result += "\"company_name\":\"" + vo.getCompany_name() + "\","; 
			result += "\"gu_gun_eup_eng\":\"" + vo.getGu_gun_eup_eng() + "\","; 
			result += "\"do_en\":\"" + vo.getDo_en() + "\","; 
			result += "\"title\":\"" + vo.getTitle() + "\","; 
			result += "\"salary_min\":\"" + vo.getSalary_min() + "\","; 
			result += "\"salary_max\":\"" + vo.getSalary_max() + "\","; 
			result += "\"regdate\":\"" + vo.getRegdate() + "\""; 
			result += "},";
			
		}
		
		// {},{},{},{},{}, 형태로 저장 되므로 맨마지막 ,는 제거
		result = result.substring(0,result.length()-1);
		result +="],";
		
		System.out.println("result lst : " + result);
		
		result += " \"pvo\" : {";
		 
		result += "\"nowPage\" :"+ p.getNowPage() +","; 
		result += "\"nowBlock\":" + p.getNowBlock() + ","; 
		result += "\"pagePerBlock\":" + p.getPagePerBlock() + ","; 
		result += "\"totalRecord\":" + p.getTotalRecord() + ","; 
		result += "\"totalPage\":" + p.getTotalPage() + ","; 
		result += "\"totalBlock\":" + p.getTotalBlock() + ","; 
		result += "\"begin\":" + p.getBegin() + ","; 
		result += "\"end\":" + p.getEnd() + ","; 
		result += "\"beginPage\":" + p.getBeginPage() + ","; 
		result += "\"endPage\":" + p.getEndPage() +"}"; 
		
		result +="}";
				
		System.out.println("result : " + result);
		
		request.setAttribute("pvo", p);
		
		return result;
	}

	@RequestMapping(value="hireDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hireDetaile(@RequestParam("cPage") int cPage,
							  @RequestParam("hire_idx") int hire_idx) {
		System.out.println("cPage : " + cPage);
		System.out.println("hire_idx : " + hire_idx);
		
		//1. 게시글 조회 수 1 증가 처리(실습)
		//해당 인덱스의 게시글의 hit + 1 
		//resaleDAO.resaleHIT(rs_seq); //id="hit"
		
		//2. 게시글(b_idx) 데이터 조회  후 화면 표시(HTML 작성)
		//ResaleVO rsVO = resaleDAO.resaleDetailOne(rs_seq); //id="one"
		//System.out.println("클릭 후 게시글 데이터 조회 : " + rsVO);
		
		//detail로 ㄱㄱ
		return "hireList_go.do";
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
