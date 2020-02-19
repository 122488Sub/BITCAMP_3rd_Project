package com.koreigner.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	// 로그인 페이지 이동
		@RequestMapping(value="/login_go.do")
		public String moveToLogin(Model model) {
			
			model.addAttribute("auth_check", "0");
			
			return "WEB-INF/views/member/login.jsp";
		}
	
	//회원가입 이동
	@RequestMapping(value="/join_go.do")
	public String join_go() {
		
		return "WEB-INF/views/member/join.jsp";
	}
	
	//비밀번호 찾기 이동
	@RequestMapping(value="/resetPassword_go.do")
	public String resetPassword_go() {
		
		return "WEB-INF/views/member/resetPassword.jsp";
	}
	
	// 아이디 중복 체크 컨트롤러
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {
				
		UserVO vo = new UserVO();
		vo.setMem_id(mem_id);
		
		int idCnt = userService.userIdCheck(vo);
		
		return idCnt;
	}
	
	// 닉네임 중복 체크 컨트롤러
	@RequestMapping(value="/nickCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("mem_name") String mem_name) {
		
		UserVO vo = new UserVO();
		vo.setMem_name(mem_name);
		
		int nameCnt = userService.userNameCheck(vo);
		System.out.println("nameCnt: " + nameCnt);
		
		return nameCnt;
	}
	
	// 회원 등록
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinUser(UserVO vo) throws Exception {
				
		userService.joinUser(vo);
		
		return "WEB-INF/views/member/emailConfirm.jsp";
	}
	
	
	//이메일 인증
	@RequestMapping(value="/emailConfirm.do", method=RequestMethod.GET)
	public String emailConfirm(UserVO vo, Model model) throws Exception {
		
		vo.setAuth_status("1");	// authStatus를 1로, 권한 업데이트
		userService.updateAuthstatus(vo);
		
		model.addAttribute("auth_check", "1");
		
		return "WEB-INF/views/member/login.jsp";
	}
	
	
	
	// 로그인
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public int loginCheck(UserVO vo) {
		
		int userCnt = userService.userLoginCheck(vo);
		
		return userCnt;
	}
		
	// 비밀번호 재설정 메일보내기
	@RequestMapping(value="/resetPwMail.do", method=RequestMethod.POST)
	public String resetPasswordMail(@RequestParam("email") String email) throws Exception {
		
		userService.resetPasswordMail(email);
		
		return "WEB-INF/views/member/emailConfirm.jsp";
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="/resetPw.do", method=RequestMethod.POST)
	public String resetPassword(UserVO vo) {
		
		userService.resetPassword(vo);
		
		return "WEB-INF/views/member/login.jsp";
	}
}