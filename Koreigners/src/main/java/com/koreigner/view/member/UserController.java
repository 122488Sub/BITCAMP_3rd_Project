package com.koreigner.view.member;

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
		System.out.println("logout: " + logout);
		
		if(logout != null && logout.equals("1")) {
			//로그아웃 후 이동 시
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
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {

		UserVO vo = new UserVO();
		vo.setMem_id(mem_id);

		int idCnt = userService.userIdCheck(vo);

		return idCnt;
	}

	// 닉네임 중복 체크 컨트롤러
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.GET)
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

		return "/member/emailConfirm.page";
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
	 * @param request HttpServletRequest 객체
	 * @param jsonMap HTTP 요청 몸체(JSON)을 Map으로 치환
	 * @return entity 반환
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ResponseEntity<String> postLogin(HttpServletRequest request, @RequestBody Map<String, Object> jsonMap, Model model) {

		ResponseEntity<String> entity = null;
		String resultMsg = "fail";

		String inputId = (String) jsonMap.get("inputId");
		String inputPw = (String) jsonMap.get("inputPw");

		if (userService.checkLogin(inputId, inputPw)) { // 유저가 존재할 경우
			resultMsg = userService.createToken(inputId); // 토큰 생성
		}
		entity = new ResponseEntity<String>(resultMsg, HttpStatus.OK);
		
		return entity;
	}

	//마이페이지로 이동(토큰 가지고)
	@RequestMapping(value = "/myPage_go.do", method = RequestMethod.POST)
	//@ResponseBody
	public String myPage(UserVO vo) {
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

	/*
	 * // 페이스북 oAuth 관련
	 * 
	 * @Autowired private FacebookConnectionFactory connectionFactory;
	 * 
	 * @Autowired private OAuth2Parameters oAuth2Parameters;
	 * 
	 * // 페이스북으로 로그인
	 * 
	 * @RequestMapping(value = "/facebook_join.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String join(HttpServletResponse response, Model
	 * model) {
	 * 
	 * OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	 * String facebook_url =
	 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
	 * oAuth2Parameters);
	 * 
	 * model.addAttribute("facebook_url", facebook_url);
	 * System.out.println("/facebook" + facebook_url);
	 * 
	 * return "member/login.page"; }
	 * 
	 * @RequestMapping(value = "/facebookSignInCallback", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String
	 * facebookSignInCallback(@RequestParam String code) throws Exception {
	 * 
	 * try { String redirectUri = oAuth2Parameters.getRedirectUri();
	 * System.out.println("Redirect URI : " + redirectUri);
	 * System.out.println("Code : " + code);
	 * 
	 * OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	 * AccessGrant accessGrant = oauthOperations.exchangeForAccess(code,
	 * redirectUri, null); String accessToken = accessGrant.getAccessToken();
	 * System.out.println("AccessToken: " + accessToken); Long expireTime =
	 * accessGrant.getExpireTime();
	 * 
	 * 
	 * if (expireTime != null && expireTime < System.currentTimeMillis()) {
	 * accessToken = accessGrant.getRefreshToken();
	 * System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	 * };
	 * 
	 * 
	 * Connection<Facebook> connection =
	 * connectionFactory.createConnection(accessGrant); Facebook facebook =
	 * connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
	 * UserOperations userOperations = facebook.userOperations();
	 * 
	 * try
	 * 
	 * { String [] fields = { "id", "email", "name"}; User userProfile =
	 * facebook.fetchObject("me", User.class, fields); System.out.println("유저이메일 : "
	 * + userProfile.getEmail()); System.out.println("유저 id : " +
	 * userProfile.getId()); System.out.println("유저 name : " +
	 * userProfile.getName());
	 * 
	 * } catch (MissingAuthorizationException e) { e.printStackTrace(); }
	 * 
	 * 
	 * } catch (Exception e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * } return "redirect:/koreigner/index.jsp";
	 * 
	 * }
	 * 
	 */
	 

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

	// =================================================================
	// 토큰 검증과 아이디 출력
	@RequestMapping(value = "/validToken.do")
	@ResponseBody
	public String TokenNId(Model model, @RequestBody Map<String, Object> jsonMap) {

		String tokenStr = (String) jsonMap.get("tokenStr");

		if (tokenStr != null) { // 토큰이 발급되었을 경우(로그인을 한 경우)

			Map<String, Object> tokenPayload = userService.getTokenPayload(tokenStr);

			String memId = (String) tokenPayload.get("aud"); // 토큰대상자의 아이디

			String tokenValidMsg = userService.validToken(tokenStr, memId);

			if (tokenValidMsg.equals("Pass")) { // 토큰 검증을 마친 경우에만 토큰 정보를 출력한다.
				model.addAttribute("tokenAud", memId);
			}
		} else {
			model.addAttribute("loginId", "no-login");
		} // 로그인 되어 있지 않은 경우

		return "index.jsp";
	}
}