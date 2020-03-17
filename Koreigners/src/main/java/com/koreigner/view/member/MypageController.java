package com.koreigner.view.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.member.ResumeVO;
import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;

@Controller
public class MypageController {

	@Autowired
	private UserService userService;
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
	//마이페이지로 이동
	@RequestMapping(value="myPage_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myPage_go(HttpServletRequest request, Model model) {
		
		String mem_id = (String)request.getAttribute("mem_id"); //토큰에서 아이디 추출해오기
		System.out.println("컨트롤러에서 mem_id: " + mem_id);
		
		UserVO mvo = userService.getOneMember(mem_id); //회원정보 불러오기
		model.addAttribute("mvo", mvo);
		String mem_cate = mvo.getMem_cate();
		
		String type = request.getParameter("type"); //마이페이지 유형
		//기업회원일 경우
		if(mem_cate.equals("c")) { 
			
			if(type.equals("profile")) {
				return "member/mypage/c_profile.page";
			} else if(type.equals("hire")) {
				return "member/mypage/c_hire.page";
			} else {
				return "member/mypage/c_applier.page";
			}
		//개인회원일 경우	
		} else { 

			if(type.equals("profile")) {
				return "member/mypage/p_profile.page";
			} else if(type.equals("resume")) {
				return "member/mypage/p_resume.page";
			} else if(type.equals("wishlist")) {
				return "member/mypage/p_wishlist.page";
			} else {
				return "member/mypage/p_ads.page";
			}
			
		}
	}

	
	// 회원정보 수정
	@RequestMapping(value="updateMember.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String updateMember(HttpServletRequest request, UserVO vo, Model model) {
		String mem_cate = vo.getMem_cate();
		
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		vo.setMem_birth(birth1 + "-" + birth2 + "-" + birth3);
		
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		vo.setMem_address(address + " " + address_detail);
		
		if(mem_cate.equals("c")) {
			return "member/mypage/c_profile.page";
			
		} else if(mem_cate.equals("p")) {
			userService.updateMember(vo);
			UserVO mvo = userService.getOneMember(vo.getMem_id());
			model.addAttribute("mvo", mvo);
			return "member/mypage/p_profile.page";
			
		} else {
			return "common/main.page";
		}
	}
	
	// 비밀번호 확인
	@RequestMapping(value="pwCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int pwCheck(@RequestBody Map<String, String> jsonMap) {
		
		int userCnt = userService.userPwCheck(jsonMap);
		
		return userCnt;
	}
	
	
	// 이력서 직무 카테고리
	@ModelAttribute("mpCateMap")
	public Map<String, String> searchJobCateMap() {
		List<CompanyVO> list = companyServiceImpl.getCateList();
		//카테고리 대분류 문자 map에 저장
		Map<String, String> jobCateMap = new HashMap<>();
		
		int i = 1;
		for(CompanyVO vo : list) {
			jobCateMap.put(Integer.toString(i), vo.getCate_prnt_en());
			i++;
		}
		
		return jobCateMap;
	}
	
	// 이력서 입력
	@RequestMapping(value="/insertResume.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertResume(ResumeVO rvo) {
		
		System.out.println("ResumeVO : " + rvo.toString());
		/*
		 ********* 파일 업로드처리 **********
		 * MultipartFile 인터페이스 주요 메소드
		 * String getOriginalFilename() : 업로드한 파일명 찾기
		 * void transferTo(대상위치) : 업로드한  파일을 destFile(위치)에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 
		MultipartFile uploadFile = rvo.getOri_file();
		System.out.println("uploadFile: " + uploadFile);
		
		if(!uploadFile.isEmpty()) { //파일이 있으면 지정한 경로에 저장해라 
			String fileName = uploadFile.getOriginalFilename(); //실제 업로드되는 파일명
			uploadFile.transferTo(new File("c:/Mystudy/temp/" + fileName)); //데이터 저장 메소드(transferTo())
		}
		
		userService.insertResume(rvo);
		if(cvo != null) {
					
			userService.insertCareer(cvo);
		}*/
		
		return "common/main.page"; //getOne
	}
}
