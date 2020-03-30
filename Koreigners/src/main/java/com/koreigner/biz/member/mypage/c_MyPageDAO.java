package com.koreigner.biz.member.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.job.hire.HireVO;

@Repository("C_MyPageDAO")
public class c_MyPageDAO {
	//src/main/resources/mappings/house-mapper.xml
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public c_MyPageDAO() {
		System.out.println(">> c_MyPageDAO 객체 생성");	
	}

	public List<HireVO> myBatis_getHireMyAdsList(c_MyPageVO cVO) {
		List<HireVO> hireList =mybatis.selectList("c_MyPage.getHireMyAdsList", cVO);
		return hireList;
	}

	public List<Map<String, Object>> myBatis_getResumeApplyList(c_MyPageVO cVO) {
		List<Map<String, Object>> tmp=mybatis.selectList("c_MyPage.getResumeApplyList",cVO);
		return tmp;
	}

	public int mybatis_getResumeTotal(c_MyPageVO cVO) {
		return mybatis.selectOne("c_MyPage.getResumeApplyTotal",cVO);
	}

	public int mybatis_getHireTotal(c_MyPageVO cVO) {
	
		return  mybatis.selectOne("c_MyPage.getHireMyAdsTotal",cVO);
	}

	

	
	
}







