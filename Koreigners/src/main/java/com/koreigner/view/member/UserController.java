package com.koreigner.view.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@RequestMapping(value = "/login_go.do")
	public String moveToLogin(Model model, UserVO vo) {
		
		//기본 로그인 페이지 이동 시
		model.addAttribute("auth_check", "0");
		
		String logout = vo.getLogout();
		if(logout != null && logout.equals("1")) {//로그아웃 후 이동 시
			model.addAttribute("logout_check", "1");
		} else { //처음 페이지 이동 시
			model.addAttribute("logout_check", "0");
		}
		
		return "/member/login.page";
	}

	// 회원가입 이동
	@RequestMapping(value = "/join_go.do")
	public String join_go() {

		return "/member/join.page";
	}

	// 비밀번호 찾기 이동
	@RequestMapping(value = "/resetPassword_go.do")
	public String resetPassword_go() {

		return "/member/resetPassword.page";
	}

	// 아이디 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {

		UserVO vo = new UserVO();
		vo.setMem_id(mem_id);

		int idCnt = userService.userIdCheck(vo);

		return idCnt;
	}

	// 닉네임 중복 체크 컨트롤러
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int nickCheck(@RequestParam("mem_name") String mem_name) {

		UserVO vo = new UserVO();
		vo.setMem_name(mem_name);

		int nameCnt = userService.userNickCheck(vo);
		System.out.println("nameCnt: " + nameCnt);

		return nameCnt;
	}

	// 회원 등록
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinUser(UserVO vo) throws Exception {

		userService.joinUser(vo);

		return "member/emailAuth.page";
	}

	// 이메일 인증
	@RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(UserVO vo, Model model) throws Exception {

		vo.setAuth_status("1"); // authStatus를 1로, 권한 업데이트
		userService.updateAuthstatus(vo);

		model.addAttribute("auth_check", "1");

		return "/member/login.page";
	}

	/**
	 * 로그인 처리
	 * 
	 * @param jsonMap HTTP 요청 몸체(JSON)을 Map으로 치환
	 * @return entity 반환
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ResponseEntity<String> postLogin(HttpServletResponse response, @RequestBody Map<String, String> jsonMap) {

		ResponseEntity<String> entity = null;
		String tokenStr = "fail";

		String inputId = jsonMap.get("inputId");
		String inputPw = jsonMap.get("inputPw");
		String inputCate = jsonMap.get("inputCate");
		

		if (userService.checkLogin(inputId, inputPw, inputCate)) { // 유저가 존재할 경우
			tokenStr = userService.createToken(inputId); // 토큰 생성
			response.setHeader("tokenStr", tokenStr); //Header에 토큰 실어 보내기 -> 인터셉터에서 토큰 검증  
		} 
		entity = new ResponseEntity<String>(tokenStr, HttpStatus.OK); //토큰!
		
		return entity;
	}

	//마이페이지로 이동(토큰 가지고)
	@RequestMapping(value = "/myPage_go.do", method = RequestMethod.POST)
	public String myPage(HttpServletRequest request, Model model, UserVO vo) {
		
		
		
		
		
		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		//vo.getTokenStr()으로 받느냐 Header에서 받느냐...
		//마이페이지로 넘어가면서 인증여부 알림창은 어떻게 띄우느냐....
		
		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		
		
		
		String auth_status = request.getHeader("auth_status");
		String mem_id = request.getHeader("mem_id");
		
		if(auth_status != null && auth_status.equals("0")) {//이메일 인증을 하지 않은 유저
			model.addAttribute("auth_check", "0");
			return "/koreigner/index.jsp";
		}
		
		/*
		String tokenStr = vo.getTokenStr();
		
		if(tokenStr!= null){ //토큰이 발급되었을 경우(로그인을 한 경우)
		Map<String, Object> tokenPayload = userService.getTokenPayload(tokenStr);
		  
		String memId = (String)tokenPayload.get("aud"); //토큰대상자의 아이디
		 
		String tokenValidMsg = userService.validToken(tokenStr, memId);
		 
			if(tokenValidMsg.equals("Pass")) { //토큰 검증을 마친 경우에만 작업 진행
				//model.addAttribute("tokenAud", memId);
				
				// 기업회원/개인회원 구분해서 정보 가져오기
				
			}
			
		} else { //로그인 되어 있지 않은 경우
			//model.addAttribute("loginId", "no-login");
		} 
		*/ 
		return "member/mypage/p_profile.page";
	}


	// 비밀번호 재설정 메일보내기
	@RequestMapping(value = "/resetPwMail.do", method = RequestMethod.POST)
	public String resetPasswordMail(@RequestParam("email") String email) throws Exception {

		userService.resetPasswordMail(email);

		return "/member/emailConfirm.page";
	}

	// 비밀번호 재설정
	@RequestMapping(value = "/resetPw.do", method = RequestMethod.POST)
	public String resetPassword(UserVO vo) {

		userService.resetPassword(vo);

		return "/member/login.page";
	}
	
}