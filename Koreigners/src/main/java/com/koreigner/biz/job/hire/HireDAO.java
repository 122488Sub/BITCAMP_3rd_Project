package com.koreigner.biz.job.hire;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HireDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	void insertHire(HireVO vo) {
		mybatis.insert("insertHire", vo);
	}
	
	
	List<HireVO> getHireList(){
		List<HireVO> hireList = mybatis.selectList("getHireList");
		return hireList;
	}
}
