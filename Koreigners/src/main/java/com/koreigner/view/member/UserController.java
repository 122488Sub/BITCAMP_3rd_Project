package com.koreigner.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
			
			return "/member/login.page";
		}
	
	//회원가입 이동
	@RequestMapping(value="/join_go.do")
	public String join_go() {
		
		return "/member/join.page";
	}
	
	//비밀번호 찾기 이동
	@RequestMapping(value="/resetPassword_go.do")
	public String resetPassword_go() {
		
		return "/member/resetPassword.page";
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
		
		return "/member/emailConfirm.page";
	}
	
	
	//이메일 인증
	@RequestMapping(value="/emailConfirm.do", method=RequestMethod.GET)
	public String emailConfirm(UserVO vo, Model model) throws Exception {
		
		vo.setAuth_status("1");	// authStatus를 1로, 권한 업데이트
		userService.updateAuthstatus(vo);
		
		model.addAttribute("auth_check", "1");
		
		return "/member/login.page";
	}
	
	/**
	 * 로그인을 처리
	 * @param request HttpServletRequest 객체
	 * @param jsonMap HTTP 요청 몸체(JSON)을 Map으로 치환
	 * @return entity 반환
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> postLogin(HttpServletRequest request, @RequestBody Map<String, Object> jsonMap){
		ResponseEntity<String> entity = null;
		String resultMsg= "fail";
		if(userService.checkLogin((String)jsonMap.get("inputId"), (String)jsonMap.get("inputPw"))){
			resultMsg= (String)userService.createToken((String)jsonMap.get("inputId"));
		}
		entity = new ResponseEntity<String>(resultMsg, HttpStatus.OK);
		return entity;
	}
	
	/**
	 * 로그아웃 메서드
	 * @param request HttpServletRequest 객체 
	 * @return entity 반환
	 */
	@RequestMapping(value="/logout.do", method=RequestMethod.POST)
	public ResponseEntity<String> postLogout(HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		
		//세션을 삭제해준다.
		request.removeAttribute("loginId");
		request.removeAttribute("tokenStr");
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK); 
		return entity;
	}
		
	// 비밀번호 재설정 메일보내기
	@RequestMapping(value="/resetPwMail.do", method=RequestMethod.POST)
	public String resetPasswordMail(@RequestParam("email") String email) throws Exception {
		
		userService.resetPasswordMail(email);
		
		return "/member/emailConfirm.page";
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="/resetPw.do", method=RequestMethod.POST)
	public String resetPassword(UserVO vo) {
		
		userService.resetPassword(vo);
		
		return "/member/login.page";
	}
}