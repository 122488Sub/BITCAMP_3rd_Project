package com.koreigner.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.koreigner.biz.member.UserService;

public class EmailAuthInterceptor extends HandlerInterceptorAdapter{
	
	// controller로 보내기 전에 처리하는 인터셉터(preHandle)
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 

	@Autowired
	private UserService userService;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean goCont = false;
		
		String token = request.getHeader("tokenStr"); //헤더에서 정보 가져오기
		
		Map<String, Object> tokenPayload = userService.getTokenPayload(token);
		String mem_id = (String)tokenPayload.get("aud");
		String auth_status = userService.getAuthStatus(mem_id);
		
		response.setHeader("authStatus", auth_status); //헤더에 정보 담기
		
		if(auth_status.equals("1")) {//이메일 인증을 완료한 유저
			goCont = true;
		}
		return goCont;
	}
}