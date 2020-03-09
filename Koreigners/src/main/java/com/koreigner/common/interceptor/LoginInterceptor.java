package com.koreigner.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("===> [LoginInterCeptor] - preHandle 진입 \n");
		//session은 server에 저장하는 값 (브라우저마다)
		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) != null) { //Login 객체가 있는지 확인한다.
			session.removeAttribute(LOGIN); //있으면 삭제한다.
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("===> [LoginInterCeptor] - postHandle 진입 \n");
		//postHandler에서는 로그인한 결과를 cookie로 굽는다.
		
		HandlerMethod method = (HandlerMethod) handler;
		System.out.println("MMMM>> Bean: " + method.getBean() + ", Method: " + method.getMethod());
		System.out.println("MMMM>> Model: " + modelAndView);
		
		//session에 cookie를 적용하기 위해 HttpSession 선언
		HttpSession session = request.getSession();
		
		Object user = modelAndView.getModelMap().get("user");
		System.out.println("===> [postHandle] - user data : " + user);
		
		if (user != null) { //LoginController로 부터 
			session.setAttribute(LOGIN, user);
			
			if (StringUtils.isNotEmpty(request.getParameter("useCookie"))) { //login.jsp의 Remember Me check여부 확인
				Cookie loginCookie = new Cookie(LOGIN_COOKIE, session.getId());
				loginCookie.setPath("/"); //dyson.com/ (도메인별로 key가 생긴다)
				loginCookie.setMaxAge(EXPIRE); //7일선언
				
				response.addCookie(loginCookie);
			}
			
			String attempted = (String)session.getAttribute(ATTEMPTED);
			if (StringUtils.isNotEmpty(attempted)) {
				response.sendRedirect(attempted); //
				session.removeAttribute(ATTEMPTED);
			} else {
				
				response.sendRedirect("index.jsp");
			}
			
		}
		
	}
}
