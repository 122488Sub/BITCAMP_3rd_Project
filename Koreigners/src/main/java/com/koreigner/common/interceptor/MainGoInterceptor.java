package com.koreigner.common.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;

public class MainGoInterceptor extends HandlerInterceptorAdapter implements SessionNames{
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Autowired
	public UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("===> [MainGoInterceptor]");
				
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
		
		
		if(userToken == null || userToken.equals("")) {//쿠키없음, 로그인하지 않음
						
		} else {//쿠키존재
			
			//토큰 유효할 경우
			if(userToken != null && userService.validToken(userToken).equals("Pass")) {
				System.out.println("===> [MainGoInterceptor] - 토큰 유효할때");
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
				String userJsId = (String)tokenPayload.get("jSessionId"); // JSESSIONID 추출
				
				if(userJsId.equals(JSESSIONID)) {
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute(LOGIN, member);					
				}
				
				if(autoCookie != null && !autoCookie.equals("")) {
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute(LOGIN, member);
				}
					
				//main.do를 간다면??
				String auth_status = userService.getAuthStatus(mem_id);
				
				if(userToken != null && auth_status.equals("0")) {//이메일 인증을 하지 않은 회원
					request.setAttribute("auth_check", "0");
				} else {//이메일 인증을 마친 회원
					request.setAttribute("auth_check", "1");
				}
				
			} else  {
			//토큰 유효하지 않을 경우 또는 userToken이 없는경우
				String token_status = userService.validToken(userToken); 
				System.out.println("token_status: " + token_status); 
			}
			
		}			
		return true;
	}
}