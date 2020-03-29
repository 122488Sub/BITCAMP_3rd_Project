package com.koreigner.biz.member.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.resale.ResaleImgVO;
import com.koreigner.biz.resale.ResaleVO;

@Repository("C_MyPageDAO")
public class c_MyPageDAO {
	//src/main/resources/mappings/house-mapper.xml
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public c_MyPageDAO() {
		System.out.println(">> c_MyPageDAO 객체 생성");	
	}

	public Map<String, Object> myBatis_getHireMyAdsList(c_MyPageVO cVO) {
		
		return null;
	}

	public List<Map<String, Object>> myBatis_getResumeApplyList(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> tmp=mybatis.selectList("getResumeApplyList",cVO);
		//System.out.println("s:"+tmp.get(0));
		//System.out.println("s:"+tmp.get(1));
		return tmp;
	}

	public int mybatis_getResumeTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int mybatis_getHireTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}








