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
	
	//채용 게시판 리스트 객체 검색
	public List<HireVO> getHireList(JobVO jobVO){
		
		List<HireVO> hireList = mybatis.selectList("getHireList", jobVO);
		return hireList;
	}
	//채용 게시판 리스트 검색 갯수
	public int hireListTotal(JobVO jobVO) {
		
		if(jobVO.getDo_en().size() > 1 || jobVO.getGu_gun_eup_en().size() > 1){
			jobVO.setAddrFilter(true);
		}else {jobVO.setAddrFilter(false);}
		
		System.out.println();
		System.out.println("do_en : " + jobVO.getDo_en());
		System.out.println("getGu_gun_eup_en : " + jobVO.getGu_gun_eup_en());
		System.out.println("getCate_prnt_en" + jobVO.getCate_prnt_en());
		System.out.println("getCate_child_en : " + jobVO.getCate_child_en());
		System.out.println("getPayCondition : " + jobVO.getPayCondition());
		System.out.println("isAddrFilter : " + jobVO.isAddrFilter());
		System.out.println("isCateFilter : " + jobVO.isCateFilter());
		System.out.println("isCateChildFilter : " + jobVO.isCateChildFilter());
		System.out.println("isPayFilter : " + jobVO.isPayFilter());
		System.out.println("isSearchFilter : " + jobVO.isSearchFilter());
		System.out.println();
		
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
