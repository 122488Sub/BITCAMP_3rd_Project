package com.koreigner.biz.job.hire;

import java.util.List;
import java.util.Map;

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
	
	
	List<HireVO> getHireList(Map<String, Integer> map){
		List<HireVO> hireList = mybatis.selectList("getHireList", map);
		return hireList;
	}
	
	int hireListTotal() {
		int total = mybatis.selectOne("hireListTotal");
		return total;
		
	}
}
