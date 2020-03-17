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
		boolean goController = false;
		
		Cookie loginCookie = WebUtils.getCookie(request, "userToken");
		System.out.println("userToken : " + loginCookie);
		
		if(loginCookie == null) {//쿠키없음, 로그인하지 않음
			System.out.println("===> [MainGoInterceptor] - 쿠키없음, 로그인하지 않음");
			goController = true; //메인페이지 간다, 잡페이지 간다, ... 페이지이동/리스트/상세보기 .do에 쓰임
						
		} else {//쿠키존재, 로그인 했을수도/ 안했을수도
			System.out.println("===> [MainGoInterceptor] - 쿠키존재, 로그인 했을수도/안했을 수도");
			
			//쿠키 내용 꺼내서
			String userToken = "";
			String autoCookie = "";
			Cookie[] userCookie = request.getCookies();
			for(int i=0; i<userCookie.length; i++){   
				if(userCookie[i].getName().equals("userToken")){    
					userToken = userCookie[i].getValue(); 
				} 
				else if(userCookie[i].getName().equals("autoCookie")) {
					autoCookie = userCookie[i].getValue();
				}
			}
			System.out.println("autoCookie: " + autoCookie);
			//토큰 유효할 경우
			if(userToken != null && userService.validToken(userToken).equals("Pass")) {
				System.out.println("===> [MainGoInterceptor] - 토큰 유효할때");
				Map<String, Object> tokenPayload = userService.getTokenPayload(userToken); //토큰 정보 추출
				String mem_id = (String)tokenPayload.get("aud"); //아이디 추출
//					String autoLogin = userService.getAutoLogin(mem_id); //자동로그인 유무
				
				if(autoCookie != null && !autoCookie.equals("")) {
					UserVO member = userService.getOneMember(mem_id);
					request.setAttribute(LOGIN, member);
				}
					
				//main.do를 간다면??
				String auth_status = userService.getAuthStatus(mem_id);
				
				if(userToken != null && auth_status.equals("0")) {//이메일 인증을 하지 않은 회원
					request.setAttribute("auth_check", "0");
					goController = true;
				} else {//이메일 인증을 마친 회원
					request.setAttribute("auth_check", "1");
					goController = true;
				}
				
			} else  {
			//토큰 유효하지 않을 경우 또는 userToken이 없는경우
				String token_status = userService.validToken(userToken); 
				System.out.println("token_status: " + token_status); 
				goController = true; 
			}
			
		}			
		return goController;
	}
}