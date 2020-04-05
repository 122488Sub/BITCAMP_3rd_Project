package com.koreigner.biz.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService{
	@Autowired
	HomeDAO homeDAO;

	@Override
	public List<Map<String, Object>> getRecentPosts() {
		return homeDAO.dao_getRecentPosts();
	}

	@Override
	public List<Map<String, Object>> getCountPosts() {
		return homeDAO.dao_getCountPosts();
	}
	
}
