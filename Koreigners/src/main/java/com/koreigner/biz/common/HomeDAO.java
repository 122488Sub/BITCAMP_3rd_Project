package com.koreigner.biz.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("HomeDAO")
public class HomeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map<String, Object>> dao_getRecentPosts() {
		// TODO Auto-generated method stub
		return mybatis.selectList("getRecentPosts");
	}

}
