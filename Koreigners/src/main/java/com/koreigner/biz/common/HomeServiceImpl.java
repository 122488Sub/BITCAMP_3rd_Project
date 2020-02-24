package com.koreigner.biz.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl {
	@Autowired
	HomeDAO homeDAO;
	
}
