package com.koreigner.view.member;

import java.io.File;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;
import com.koreigner.biz.member.resume.ResumeService;
import com.koreigner.common.CommandMap;

@Controller
public class MypageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
	//마이페이지로 이동
	@RequestMapping(value="myPage_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage_go(CommandMap commandMap, HttpServletRequest request, Model model) {
		
		ModelAndView mv = null;
		
		String mem_id = (String)request.getAttribute("mem_id"); //토큰에서 아이디 추출해오기
		System.out.println("컨트롤러에서 mem_id: " + mem_id);
		
		UserVO mvo = userService.getOneMember(mem_id); //회원정보 불러오기
		model.addAttribute("mvo", mvo);
		String mem_cate = mvo.getMem_cate();
		
		String type = request.getParameter("type"); //마이페이지 유형
		//기업회원일 경우
		if(mem_cate.equals("c")) { 
			
			if(type.equals("profile")) {
				mv = new ModelAndView("member/mypage/c_profile.page");
			} else if(type.equals("hire")) {
				mv = new ModelAndView("member/mypage/c_hire.page");
			} else {
				mv = new ModelAndView("member/mypage/c_applier.page");
			}
		//개인회원일 경우	
		} else { 

			if(type.equals("profile")) {
				mv = new ModelAndView("member/mypage/p_profile.page");
			} else if(type.equals("resume")) {
				mv = new ModelAndView("member/mypage/p_resume.page");

				System.out.println("//mypage이동 컨트롤러에서 mem_id : " + mem_id);
				Map<String, Object> map = resumeService.selectResume(mem_id);
				System.out.println("//mypage이동 컨트롤러에서 map : " + map);
				
				if(map != null) {
					mv.addObject("map", map.get("map"));
					mv.addObject("careerList", map.get("careerList"));
					mv.addObject("fileList", map.get("fileList"));					
				}
				
			} else if(type.equals("wishlist")) {
				mv = new ModelAndView("member/mypage/p_wishlist.page");
			} else {
				mv = new ModelAndView("member/mypage/p_ads.page");
			}
			
		}
		
		return mv;
	}

	
	// 회원정보 수정
	@RequestMapping(value="updateMember.do", method= RequestMethod.POST)
	public String updateMember(HttpServletRequest request, UserVO vo, Model model) {
		System.out.println("유저 : " + vo.getMem_id());
		System.out.println("닉네임 : " + vo.getMem_name());
		String mem_cate = vo.getMem_cate();
		
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		vo.setMem_birth(birth1 + "-" + birth2 + "-" + birth3);
		System.out.println("birth: " + vo.getMem_birth());
		
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		vo.setMem_address(address + " " + address_detail);
		System.out.println("address: " + vo.getMem_address());
		
		userService.updateMember(vo);
		
		if(mem_cate.equals("c")) {
			return "member/mypage/c_profile.page";
			
		} else if(mem_cate.equals("p")) {
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
	@RequestMapping(value="insertResume.do", method= RequestMethod.POST)
	public ModelAndView insertResume(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:myPage_go.do?type=resume");
		
		resumeService.insertResume(commandMap.getMap(), request);
		
		return mv;
	}
	
	//파일다운받기
	@RequestMapping(value="downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception {
		Map<String, Object> map = resumeService.selectFileInfo(commandMap.getMap());
		System.out.println("파일다운 컨트롤러 map : " + map);
		String save_file = (String)map.get("SAVE_FILE");
		String ori_file = (String)map.get("ORI_FILE");
		
		byte[] fileByte = FileUtils.readFileToByteArray(new File("D:\\3rdProject\\BITCAMP_3rd_Project\\Koreigners\\src\\main\\webapp\\resources\\common\\resume\\"+save_file));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(ori_file, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	
	// 이력서 수정
	@RequestMapping(value="updateResume.do", method=RequestMethod.POST)
	public ModelAndView updateResume(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:myPage_go.do?type=resume");
				
		resumeService.updateResume(commandMap.getMap(), request);
		
		return mv;
	}

}
