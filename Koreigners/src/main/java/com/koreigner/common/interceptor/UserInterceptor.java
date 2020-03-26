package com.koreigner.common.interceptor;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;

public class UserInterceptor extends HandlerInterceptorAdapter {
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("=============== [UserInterceptor 시작]");
		boolean goController = false;
		
		//쿠키 내용 꺼내서
		String userToken = "";
		String autoCookie = "";
		String JSESSIONID = "";
		Cookie[] userCookie = request.getCookies();
		for(int i=0; i<userCookie.length; i++){   
			if(userCookie[i].getName().equals("userToken")){    
				userToken = userCookie[i].getValue(); 
			}else if(userCookie[i].getName().equals("autoCookie")) {
				autoCookie = userCookie[i].getValue();
			}else if(userCookie[i].getName().equals("JSESSIONID")) {
				JSESSIONID = userCookie[i].getValue();
			}
		}
		
		//자동로그인 할 경우
		if(autoCookie != null && !autoCookie.equals("")) {
			
			Map<String, Object> tokenPayload = userService.getTokenPayload(autoCookie); //토큰 정보 추출
			String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
			
			request.setAttribute("mem_id", mem_id);
			UserVO member = userService.getOneMember(mem_id);
			request.setAttribute("user", member);
			
			String auth_status = userService.getAuthStatus(mem_id);
			if(auth_status.equals("0")) { //이메일 인증 안함
				response.sendRedirect("main.do");
				goController = false;
			}
			
			goController = true;
			
		//자동로그인하지 않을 경우
		} else {
			//userToken 검증 통과 시
			if(userToken != null && !userToken.equals("") && userService.validToken(userToken).equals("Pass")) {
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
				String userJsId = (String)tokenPayload.get("jSessionId"); // JSESSIONID 추출
				
				if(userJsId.equals(JSESSIONID)) {
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute("user", member);
					request.setAttribute("mem_id", mem_id);
					String auth_status = userService.getAuthStatus(mem_id);
					if(auth_status.equals("0")) { //이메일 인증 안함
						response.sendRedirect("main.do");
						goController = false;
					}
					goController = true;
				} else {
					System.out.println("//////이번에 로그인한 쿠키가 아님!!!");
					response.sendRedirect("login_go.do");
					goController = false;
				}
				
			//userToken 유효하지 않을 경우
			} else {
				String token_status = userService.validToken(userToken);
				System.out.println("token_status : " + token_status);
				response.sendRedirect("login_go.do");
				goController = false;
			}
		}
		
		return goController;
	}
	
}