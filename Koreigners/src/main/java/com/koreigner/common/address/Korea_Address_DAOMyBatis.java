package com.koreigner.common.address;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Korea_Address_DAOMybatis")
public class Korea_Address_DAOMyBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Korea_Address_DAOMyBatis() {
		System.out.println(">> Korea_Address_DAOMyBatis 객체 생성");	
	}
	
	//글 입력
	public void insertTest(Korea_Address_VO vo) {
		System.out.println("===> MyBatis로 insertTest() 실행");
		mybatis.insert("Korea_Address_DAO.insert", vo);
	}
	
	//글 수정
	public void updateTest(Korea_Address_VO vo) {
		System.out.println("===> MyBatis로 updateTest() 실행");
		mybatis.update("Korea_Address_DAO.update", vo);
	}
	
	//글 삭제
	public void deleteTest(Korea_Address_VO vo) {
		System.out.println("===> MyBatis로 deleteTest() 실행");
		mybatis.delete("Korea_Address_DAO.delete", vo);
	}
	
	//글 상세 조회
	public Korea_Address_VO getTest(Korea_Address_VO vo) {
		System.out.println("===> MyBatis로 getTest() 실행");
		return mybatis.selectOne("Korea_Address_DAO.get", vo);
	}
	
	//전체 데이터 조회
	public List<Korea_Address_VO> getTestList() {
		System.out.println("===> MyBatis로 getList() 실행");
		return null;
	}
	
	//검색조건 적용해서 조회
	public List<Korea_Address_VO> getTestList(Korea_Address_VO vo) {
		System.out.println("===> MyBatis로 getList() 실행");
		
		return mybatis.selectList("Korea_Address_DAO.getList", vo);
	}
}








