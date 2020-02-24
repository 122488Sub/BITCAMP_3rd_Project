package com.koreigner.biz.job.company;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.job.hire.HireVO;

@Repository
public class CompanyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	List<CompanyVO> getCateList(){
		List<CompanyVO> list = mybatis.selectList("getCateList");
		return list;
	}
	
	List<CompanyVO> getCateChild(String cate_kor){
		List<CompanyVO> list = mybatis.selectList("getCateChild", cate_kor);
		System.out.println("list : " + list);
		return list;
	}
	
	List<CompanyVO> getAddrDoList(){
		List<CompanyVO> list = mybatis.selectList("getAddrDoList");
		return list;
	}
	
	List<CompanyVO> getAddrSiList(String si_kor){
		List<CompanyVO> list = mybatis.selectList("getAddrSiList", si_kor);
		return list;
	}
	
	CompanyVO getCateEn(Map<String, String> map) {
		CompanyVO outVO = mybatis.selectOne("getCateEn", map);
		System.out.println(outVO.toStringCate());
		return outVO;
	}
	
	void comJoin(CompanyVO vo) {
		System.out.println("dao : " + vo.toString());
		mybatis.insert("comJoin", vo);
	}

	
	
	
}
