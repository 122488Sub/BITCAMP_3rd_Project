package com.koreigner.view.common;


import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreigner.biz.common.HomeServiceImpl;
import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;
import com.koreigner.common.interceptor.SessionNames;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main_go(HttpServletRequest request, Model model) {
		System.out.println("main.do");
		
		String auth_status = (String)request.getAttribute("auth_status");

		//쿠키 내용 꺼내서
		String userToken = "";
		String autoCookie = "";
		String JSESSIONID = "";
		Cookie[] userCookie = request.getCookies();
		for(int i=0; i<userCookie.length; i++){   
			if(userCookie[i].getName().equals("userToken")){    
				userToken = userCookie[i].getValue(); 
			} 
			else if(userCookie[i].getName().equals("autoCookie")) {
				autoCookie = userCookie[i].getValue();
			}
			else if(userCookie[i].getName().equals("JSESSIONID")) {
				JSESSIONID = userCookie[i].getValue();
			}
		}
		
		//자동로그인 할 경우
		if(autoCookie != null && !autoCookie.equals("")) {
			
			Map<String, Object> tokenPayload = userService.getTokenPayload(autoCookie); //토큰 정보 추출
			String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
			
			UserVO member = userService.getOneMember(mem_id);
			request.setAttribute(SessionNames.LOGIN, member);
			checkEmail(auth_status, model);
			
		//자동로그인하지 않을 경우
		} else {
			
			if(userToken != null && !userToken.equals("") && userService.validToken(userToken).equals("Pass")) {
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
				String userJsId = (String)tokenPayload.get("jSessionId"); // JSESSIONID 추출
				
				if(userJsId.equals(JSESSIONID)) {
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute(SessionNames.LOGIN, member);
					checkEmail(auth_status, model);
				}
			} else {
				String token_status = userService.validToken(userToken);
				System.out.println("token_status : " + token_status);
			}
			
		}
		return "/common/main.page";
	}
	
	
	private void checkEmail(String auth_status, Model model) {

		if(auth_status != null && auth_status.equals("0")) { //이메일 인증을 완료하지 못한 경우
			model.addAttribute("auth_check", "0");
		} else { //이메일 인증 환료 또는 비회원 메인페이지 이동
			model.addAttribute("auth_check", "1");			
		}
	}
}
