package com.koreigner.biz.house;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("House_DAOMybatis")
public class House_DAOMyBatis {
	//src/main/resources/mappings/house-mapper.xml
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public House_DAOMyBatis() {
		System.out.println(">> House_DAOMyBatis 객체 생성");	
	}
	
	//-------------------------------------------------------------------
	public List<HouseAll_VO> myBatis_getSiList_vo(HouseAll_VO vo) {
		System.out.println("===> myBatis_getSiList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getSiList_vo", vo);
		return list;
	}

	public List<HouseAll_VO> myBatis_getDoList_vo(HouseAll_VO vo) {
		System.out.println("===> myBatis_getDoList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getDoList_vo", vo);
		for(HouseAll_VO v : list) {
			System.out.println(v);
		}
		return list;
	}

	public List<HouseAll_VO> myBatis_getAllList_vo(HouseAll_VO vo) {
		System.out.println("===> myBatis_getAllList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getAllList_vo", vo);
		return list;
	}

	public List<HouseAll_VO> myBatis_getAllList_vo() {
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getAllList_vo");
		for( HouseAll_VO vo : list) {
			System.out.println(vo);
		}
		return list;
	}
}








