package com.koreigner.biz.job.hire;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.job.jobservice.JobVO;
@Repository
public class HireDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertHire(HireVO vo) {
		mybatis.insert("insertHire", vo);
	}
	
	public List<HireVO> getHireList(JobVO jobVO){
		List<HireVO> hireList = mybatis.selectList("getHireList", jobVO);
		return hireList;
	}
	
	public int hireListTotal(JobVO jobVO) {
		int total = mybatis.selectOne("hireListTotal", jobVO);
		return total;
	}
	
	public void hireHIT(int hire_idx) {
		mybatis.update("hireHIT", hire_idx);
	}
	
	public HireVO hireDetailOne(int hire_idx) {
		
		HireVO hireVO = mybatis.selectOne("hireDetailOne", hire_idx);
		return hireVO;
	}
	
	public void wishInsert(HireVO hireVO) {
		int res = mybatis.insert("wishInsert", hireVO);
		System.out.println(res);
	}
}
