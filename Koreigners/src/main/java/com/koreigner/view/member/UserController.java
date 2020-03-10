package com.koreigner.view.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;
import com.koreigner.biz.member.auth.SNSLogin;
import com.koreigner.biz.member.auth.SnsValue;
import com.koreigner.common.member.SecurityUtil;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private SecurityUtil securityUtil;
	
	@Inject
	private SnsValue naverSns;

	@Inject
	private SnsValue googleSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	// 로그인 페이지 이동
	@RequestMapping(value="login_go.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login_go(HttpServletRequest request, HttpServletResponse response, Model model, UserVO vo) {
		
		//기본 로그인 페이지 이동 시
		model.addAttribute("pw_reset", "0");
		model.addAttribute("logout_check", "0");
						
		return "/member/login.page";
	}
	
	//로그인 처리
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ResponseEntity<String> postLogin(HttpServletResponse response, Model model, @RequestBody Map<String, String> jsonMap) {

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
		
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		System.out.println("===> [LoginPage] - snsLogin Data : " + snsLogin);
		System.out.println("===> [LoginPage] - getNaverAuthURL Data : " + snsLogin.getNaverAuthURL());
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		System.out.println(" ///////////////// google url : " + url );
		
		return entity;
		
		
	}

	//네이버 or 구글 계정으로 로그인 할 때 
	@RequestMapping(value = "/{snsService}/callback", method = {RequestMethod.POST, RequestMethod.GET})
	public String snsLoginCallback(@PathVariable String snsService, 
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		System.out.println("===> [snsLoginCallback] - 진입");
		
		SnsValue sns = null;
		if (StringUtils.equals("naver", snsService)) {
			sns = naverSns;
		} else {
			sns = googleSns;
		}
		System.out.println("sns data : " + sns);
		
		
		//1. code를 이용해서 access_token 받기
		//2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		
		System.out.println("snsLogin : " + snsLogin);

		UserVO snsMemVO = snsLogin.getUserProfile(code); //1, 2번 동시
		System.out.println("profile : " + snsMemVO);
		
		//3. DB 해당 유저가 존재하는지 체크 (googleid, naverid 컬럼 추가)
		//암호화된 비밀번호로 조회
		String securityPW = securityUtil.encryptSHA256(snsMemVO.getMem_pw());
		snsMemVO.setMem_pw(securityPW);
		
		UserVO mvo = userService.getMemberSns(snsMemVO);
		if (mvo == null) { //가입되지 않은 사용자이므로 가입 페이지로 안내해 준다.
			System.out.println("??????????????");
			model.addAttribute("snsMemVO", snsMemVO);
			return "member/oauth2Register.page";
		} else { //가입 된 사용자 
			model.addAttribute("result", mvo.getMem_name() + "님 반갑습니다.^^");
			return "loginResult";
		}
		
		//4. 존재시 강제로그인, 미존재시 가입페이지로!!
	}
	
	// 로그아웃 처리
	@RequestMapping(value="logout.do")
	public String postLogout(HttpServletRequest request, HttpServletResponse response, Model model) {
		Cookie userToken = new Cookie("userToken", null);
		userToken.setMaxAge(0);
	    response.addCookie(userToken);
	    
	    model.addAttribute("logout_check", "1");
	    model.addAttribute("pw_reset", "0");
	    
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

	
}