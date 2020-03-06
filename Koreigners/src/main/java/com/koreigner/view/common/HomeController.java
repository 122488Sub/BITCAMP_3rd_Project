package com.koreigner.view.common;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreigner.biz.common.HomeServiceImpl;

@Controller
public class HomeController {
	@Autowired
	private HomeServiceImpl homeServiceImpl;

	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main_go(HttpServletRequest request, Model model) {
		System.out.println("main.do");
		
		String auth_status = (String)request.getAttribute("auth_status");
		
		if(auth_status != null && auth_status.equals("0")) { //이메일 인증을 완료하지 못한 경우
			model.addAttribute("auth_check", "0");
		} else { //이메일 인증 환료 또는 비회원 메인페이지 이동
			model.addAttribute("auth_check", "1");			
		}
		
		return "/common/main.page";
	}
	
}
