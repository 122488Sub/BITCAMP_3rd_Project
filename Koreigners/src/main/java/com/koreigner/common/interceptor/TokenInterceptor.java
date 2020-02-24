package com.koreigner.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.koreigner.biz.member.UserService;

public class TokenInterceptor extends HandlerInterceptorAdapter{
	
	// controller로 보내기 전(preHandle)에 토큰 검증 및 유저 이메일 추출하는 인터셉터
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 

	@Autowired
	private UserService userService;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean goCont = false;

		final String token = request.getHeader("tokenStr");

		if(token != null && userService.validToken(token).equals("Pass")) {//토큰 검증 통과 시
			Map<String, Object> tokenPayload = userService.getTokenPayload(token); //토큰 내용 추출
			String mem_id = (String)tokenPayload.get("aud"); //유저이메일 추출
			response.setHeader("mem_id", mem_id); //이메일 헤더로 전송
			goCont = true;
		}
		
		return goCont;
	}
}