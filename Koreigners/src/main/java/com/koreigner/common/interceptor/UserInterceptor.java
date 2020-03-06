package com.koreigner.common.interceptor;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.koreigner.biz.member.UserService;

public class UserInterceptor extends HandlerInterceptorAdapter{
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 

	@Autowired
	private UserService userService;
	
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
		System.out.println("권한인터셉터 토큰 : " + token);
		
		if(token != null && userService.validToken(token).equals("Pass")) {//토큰 검증 통과 시
			Map<String, Object> tokenPayload = userService.getTokenPayload(token);
			String mem_id = (String)tokenPayload.get("aud"); //아이디 추출
			System.out.println("인터셉터id: " + mem_id);
			request.setAttribute("mem_id", mem_id);
			
			String auth_status = userService.getAuthStatus(mem_id); //이메일인증여부 가져오기
			System.out.println("auth_status: " + auth_status);
			
			if(auth_status != null && auth_status.equals("1")) {//이메일 인증을 완료한 유저
				goController = true;
				
			} else if(auth_status.equals("0")) { //이메일 인증을 완료하지 못한 유저
				request.setAttribute("auth_status", "0");
				RequestDispatcher dispatcher = request.getRequestDispatcher("main.do");
				dispatcher.forward(request, response);
				goController = false;
			}
			
		} else {//토큰 검증 통과 못함
			response.sendRedirect("login_go.do");
			goController = false;
		}
			
		
		return goController;
	}
}