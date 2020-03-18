package com.koreigner.biz.job.jobservice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.member.UserVO;

@Repository
public class JobServiceDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public UserVO getUserInfo(String mem_id) {
		UserVO user = mybatis.selectOne("getUserInfo", mem_id);
		return user;
	}
}
