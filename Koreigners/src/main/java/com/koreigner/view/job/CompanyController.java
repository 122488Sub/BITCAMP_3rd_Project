package com.koreigner.view.job;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.job.company.CompanyService;
import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyServiceImpl companyServiceImpl;
	
	@RequestMapping(value="job_join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String jobJoin_go() {
		
		return "WEB-INF/views/job/comp_join.jsp";
	}
	
	@RequestMapping(value="join_conf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join_conf(CompanyVO vo) {
		
		/* *** 파일 업로드 처리 ***
		 * MultipartFile 인터페이스 주요 메소드
		 * String fileName = uploadFile.getOriginalFilename(); : 업로드한 파일명 찾기
		 * void transferTo(File desFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일에 존재 여부
		 * 
		 
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile : " + uploadFile);
		if(!uploadFile.isEmpty()) {//파일이 있으면(비어있지 않으면)
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("c:/MyStudy/temp/" + fileName));
			} catch (IllegalStateException e) {
				System.out.println("IllegalStateException 발생");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("IOException 발생");
				e.printStackTrace();
			}
		}
		*/
		
		
		
		//영어 카테고리 vo에 추가
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(vo);
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());
		vo.setCate_child_en(enCate_vo.getCate_child_en());
		
		System.out.println("vo.toString() : " + vo.toString());
		System.out.println("vo.toStringAddress() : " + vo.toStringAddress());
		System.out.println("vo.toStringCate() : " + vo.toStringCate());
		
		return "WEB-INF/views/job/comp_join.jsp";
	}

	
	
	
	@RequestMapping(value="getSiJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> getAddrSiList(@RequestParam("si_kor") String si_kor) {
		
		List<CompanyVO> list = companyServiceImpl.getAddrSiList(si_kor);
		for(CompanyVO vo : list) {
			System.out.println(vo.getGu_gun_eup_kor());
		}
		return list;
	}

	@RequestMapping(value="getCateJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> join_put(@RequestParam("cate_prnt_ko") String cate_prnt_ko) {
		System.out.println("cate_prnt_ko : " + cate_prnt_ko);
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
			System.out.println("vo.getCate_prnt_ko() : " + vo.getCate_prnt_ko());
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
