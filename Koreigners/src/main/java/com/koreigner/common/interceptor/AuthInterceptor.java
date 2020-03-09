package com.koreigner.common.interceptor;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionNames{

	@Inject
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("===> [AuthInterCeptor] - preHandle 진입 \n");
		//session은 server에 저장하는 값 (브라우저마다)
		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) == null) { //Login이 안되있을때
			Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
			if (loginCookie != null) {
				UserVO logindUser = userService.checkLoginBefore(loginCookie.getValue());
				if (logindUser != null) { //user가 존재하면
					session.setAttribute(LOGIN, logindUser);
					return true;
				}
			}
			
			saveAttemptedLocation(request, session);
			
			response.sendRedirect("index.jsp");
		}
		
		return true;
	}

	private void saveAttemptedLocation(HttpServletRequest request, HttpSession session) throws IOException {
		String uri = request.getRequestURI(); 
		String query = request.getQueryString();
		if (StringUtils.isNotEmpty(query)) {
			uri += "?" + query;
			
			session.setAttribute(ATTEMPTED, uri);
			
		}
	}
	
	

}
