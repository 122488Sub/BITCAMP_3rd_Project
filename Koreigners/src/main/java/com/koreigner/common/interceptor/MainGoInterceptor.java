package com.koreigner.common.interceptor;

import static org.hamcrest.CoreMatchers.notNullValue;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.koreigner.biz.member.UserService;

public class MainGoInterceptor extends HandlerInterceptorAdapter{
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Autowired
	public UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean goController = false;
		
		String token = "";
		
		Cookie[] cookie = request.getCookies();
		for(int i=0; i<cookie.length; i++){   
			if(cookie[i].getName().equals("userToken")){    
				token = cookie[i].getValue(); 
			}
		}
		System.out.println("메인페이지인터셉터 토큰 : " + token);
		
		// 로그인 전 메인페이지 이동(토큰 없는 상태)
		if(token.equals("") || token == null) {
			request.setAttribute("auth_check", "1");
			goController = true;
			
		// 로그인 후 메인페이지 이동
		} else if(token != null && userService.validToken(token).equals("Pass")) {
			Map<String, Object> tokenPayload = userService.getTokenPayload(token); //토큰 정보 추출
			String mem_id = (String)tokenPayload.get("aud"); //아이디 추출
			String auth_status = userService.getAuthStatus(mem_id);
			System.out.println("메인인터셉터 auth_status: " + auth_status);
			
			if(token != null && auth_status.equals("0")) {//이메일 인증을 하지 않은 회원
				request.setAttribute("auth_check", "0");
				goController = true;
			} else {//이메일 인증을 마친 회원
				request.setAttribute("auth_check", "1");
				goController = true;
			}
		} else {
			String token_status = userService.validToken(token);
			System.out.println("token_status: " + token_status);
		}
		return goController;
	}
}