package com.koreigner.common.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
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
		
		Cookie loginCookie = WebUtils.getCookie(request, "userToken");
		
		if(loginCookie == null) {
			System.out.println("///////////쿠키없음, 로그인 하지 않음");
			goController = true;
						
		} else {
			System.out.println("///////////쿠키존재");
			
			String userToken = "";
			Cookie[] cookie = request.getCookies();
			for(int i=0; i<cookie.length; i++){   
				if(cookie[i].getName().equals("userToken")){    
					userToken = cookie[i].getValue(); 
				}
			}
			
			if(userToken != null && userService.validToken(userToken).equals("Pass")) {
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("aud"); //아이디 추출
				String auth_status = userService.getAuthStatus(mem_id);
				
				if(userToken != null && auth_status.equals("0")) {//이메일 인증을 하지 않은 회원
					request.setAttribute("auth_check", "0");
					goController = true;
				} else {//이메일 인증을 마친 회원
					request.setAttribute("auth_check", "1");
					goController = true;
				}
			}
			goController = true;
		}			
		return goController;
	}
}