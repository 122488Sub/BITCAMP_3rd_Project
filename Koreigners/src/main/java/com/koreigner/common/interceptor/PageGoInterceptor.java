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

public class PageGoInterceptor extends HandlerInterceptorAdapter implements SessionNames{
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Autowired
	public UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("=============== [PageGoInterceptor 시작]");
		
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
			System.out.println("==============자동로그인 할 경우");
			
			Map<String, Object> tokenPayload = userService.getTokenPayload(autoCookie); //토큰 정보 추출
			String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
			
			UserVO member = userService.getOneMember(mem_id);
			request.setAttribute(SessionNames.LOGIN, member);
			request.setAttribute("mem_id", mem_id);
			
		//자동로그인하지 않을 경우
		} else {			
			System.out.println("==============자동로그인 하지 않을 경우");

			if(userToken != null && !userToken.equals("") && userService.validToken(userToken).equals("Pass")) {
				System.out.println("==============userToken이 있으면서 토큰 유효기간이 남은경우");
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("mem_id"); //아이디 추출
				String userJsId = (String)tokenPayload.get("jSessionId"); // JSESSIONID 추출
				
				if(userJsId.equals(JSESSIONID)) {
					System.out.println("============== 토큰 jsid와 브라우저 jsid가 같을 경우");
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute(SessionNames.LOGIN, member);
					request.setAttribute("mem_id", mem_id);
				}
			} else if(userToken != null && !userToken.equals("") && !userService.validToken(userToken).equals("Pass")){
				System.out.println("==============userToken이 있으면서 토큰 유효기간이 만료된 경우");
				String token_status = userService.validToken(userToken);
				System.out.println("token_status : " + token_status);
			} else { //첫방문, 비회원인 경우
				System.out.println("================ 아무것도 없는 경우");
			}
		}
		
		return true;
	}
}