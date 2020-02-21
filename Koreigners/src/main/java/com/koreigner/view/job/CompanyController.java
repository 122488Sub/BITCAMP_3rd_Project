package com.koreigner.view.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.job.jobservice.JobService;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyServiceImpl companyServiceImpl;
	@Autowired
	JobService jobService;
	
	
	
	@RequestMapping(value="job_join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String jobJoin_go() {
		/*
		src/main/resources/tiles/tiles.xml
		
		tiles.xml에서 지정해둔 패턴을 통해
		앞에 prefix로 [/WEB-INF/views]가 추가된다.
		해당 경로 아래 파일명.page를 리턴 하면
		webapp/WEB-INF/tiles/template.jsp
		template.jsp를 상속 받아
		header와 footer가 추가 되어 보여진다.
		
		*참고  : .part는 default 템플릿(아무 설정없음)
		
		*/
		
		//return "WEB-INF/views/job/comp_join.jsp";
		//       /WEB-INF/views
		return "job/signin/comp_join.page"; //.page suffix는 header와 footer를 함께 view 
	}
	
	@RequestMapping(value="join_conf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join_conf(CompanyVO vo, HttpServletRequest request) {
		
		companyServiceImpl.comJoin(vo, request);
		return "login_go.do";
		
	}
	
	@RequestMapping(value="getSiJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> getAddrSiList(@RequestParam("si_kor") String si_kor) {
		
		List<CompanyVO> list = companyServiceImpl.getAddrSiList(si_kor);
		return list;
	}

	@RequestMapping(value="getCateJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> join_put(@RequestParam("cate_prnt_ko") String cate_prnt_ko) {
		List<CompanyVO> list = companyServiceImpl.getCateChild(cate_prnt_ko);
		
		return list;
	}
	
	//페이지 전환 시 jobCateMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("jobCateMap")
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
	
	//페이지 전환 시 addrDoMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("addrDoMap")
	public Map<String, String> searchAddrDoMap() {
		
		List<CompanyVO> list = companyServiceImpl.getAddrDoList();
		//카테고리 대분류 문자 map에 저장
		Map<String, String> addrDoMap = new HashMap<>();
		
		for(CompanyVO vo : list) {
			addrDoMap.put(vo.getDo_kor(), vo.getDo_kor());
		}
			
		return addrDoMap;
	}
	
}
