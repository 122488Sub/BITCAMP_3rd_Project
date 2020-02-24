package com.koreigner.view.common;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreigner.biz.common.HomeServiceImpl;

@Controller
public class HomeController {
	@Autowired
	private HomeServiceImpl homeServiceImpl;

	@RequestMapping("main.do")
	public String main_go() {

		return "index.jsp";
	}
	
}
