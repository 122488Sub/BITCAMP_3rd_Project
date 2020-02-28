package com.koreigner.view.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
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
	@RequestMapping(value="login_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login_go(HttpServletRequest request, HttpServletResponse response, Model model, UserVO vo) {
		
		//기본 로그인 페이지 이동 시
		model.addAttribute("pw_reset", "0");
		model.addAttribute("logout_check", "0");
						
		return "/member/login.page";
	}
	
	// 로그아웃 처리
	@RequestMapping(value="logout.do")
	public String postLogout(HttpServletRequest request, HttpServletResponse response, Model model) {
		Cookie userToken = new Cookie("userToken", null);
		userToken.setMaxAge(0);
	    response.addCookie(userToken);
	    
	    model.addAttribute("logout_check", "1");
	    
	    return "/member/login.page";
	}

	// 비밀번호 찾기 이동
	@RequestMapping(value="resetPwMail_go.do")
	public String resetPassword_go() {

		return "/member/resetPwMail.page";
	}
	
	// 비밀번호 재설정 메일보내기
	@RequestMapping(value="resetPwMail.do", method=RequestMethod.POST)
	public String resetPwMail(@RequestParam("email") String email, Model model) throws Exception {
		
		int idCnt = userService.userIdCheck(email);
		
		if(idCnt > 0) { //해당 아이디가 DB에 있으면 메일보내기
			userService.resetPasswordMail(email);			
		}
		
		// 메일 보낸 뒤 안내문 나오는 로그인 화면
		model.addAttribute("pw_reset", "1");
		
		// 로그인페이지 이동 시 기본 세팅
		model.addAttribute("logout_check", "0");

		return "/member/login.page";
	}
	
	// 비밀번호 재설정 페이지로 이동
	@RequestMapping(value="resetPw_go.do", method=RequestMethod.GET)
	public String resetPw_go(HttpServletRequest request, Model model) {
		String mem_id = request.getParameter("mem_id");
		String mem_cate = request.getParameter("mem_cate");
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("mem_cate", mem_cate);
		
		return "/member/resetPw.page";
	}

	// 비밀번호 재설정
	@RequestMapping(value="resetPw.do", method=RequestMethod.POST)
	public String resetPw(HttpServletRequest request, UserVO vo, Model model) {

		userService.updateMember(vo);
		String mem_cate = vo.getMem_cate();
		
		String resetPwType = request.getParameter("resetPwType");
		if(resetPwType.equals("forgot")) {
			return "/member/resetPwSuccess.page";
		} else if(mem_cate.equals("p")) {
			return "/member/mypage/p_profile.page";
		} else if(mem_cate.equals("c")) {
			return "/member/mypage/c_profile.page";
		} else {
			System.out.println("페이지 이동시 에러발생");
			return "/common/main.page";
		}
	}
	
	
	// 회원가입 이동
	@RequestMapping(value="register_go.do")
	public String register_go() {

		return "/member/register.page";
	}

	// 아이디 중복 체크
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {

		int idCnt = userService.userIdCheck(mem_id);

		return idCnt;
	}

	// 닉네임 중복 체크
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int nickCheck(@RequestParam("mem_name") String mem_name) {

		int nameCnt = userService.userNickCheck(mem_name);
		System.out.println("nameCnt: " + nameCnt);

		return nameCnt;
	}

	// 회원 등록 + 이메일 인증 메일 보내기
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public String joinUser(UserVO vo) throws Exception {

		userService.joinUser(vo);

		return "member/emailAuth.page";
	}

	// 이메일 인증완료 후
	@RequestMapping(value="emailAuth.do", method=RequestMethod.GET)
	public String emailConfirm(UserVO vo, Model model) throws Exception {

		vo.setAuth_status("1"); // authStatus를 1로, 권한 업데이트
		userService.updateMember(vo);

		return "/member/emailAuthSuccess.page";
	}

	//로그인 처리
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ResponseEntity<String> postLogin(HttpServletResponse response, @RequestBody Map<String, String> jsonMap) {

		ResponseEntity<String> entity = null;
		String tokenStr = "fail";

		String inputId = jsonMap.get("inputId");
		String inputPw = jsonMap.get("inputPw");
		String inputCate = jsonMap.get("inputCate");
		

		if (userService.checkLogin(inputId, inputPw, inputCate)) { // 유저가 존재할 경우
			tokenStr = userService.createToken(inputId); // 토큰 생성
		}
		
		Cookie userToken = new Cookie("userToken", tokenStr); //쿠키에 저장
		userToken.setMaxAge(60*60*24); //쿠키의 유효기간(1일)
		response.addCookie(userToken);
		
		entity = new ResponseEntity<String>(tokenStr, HttpStatus.OK); //토큰!
		
		return entity;
	}

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
	@RequestMapping(value="/updateMember.do", method=RequestMethod.POST)
	public String updateMember(HttpServletRequest request, UserVO vo) {
		
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
			return "member/mypage/p_profile.page";
			
		} else {
			return "common/main.page";
		}
	}
	
	// 비밀번호 확인
	@RequestMapping(value="pwCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int pwCheck(@RequestBody Map<String, String> jsonMap) {
				
		String pw = jsonMap.get("mem_pw");
		System.out.println("pw: " + pw);
		
		int userCnt = userService.userPwCheck(jsonMap);
		
		return userCnt;
	}
}