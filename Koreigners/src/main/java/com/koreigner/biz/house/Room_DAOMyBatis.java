package com.koreigner.biz.house;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Room_DAOMybatis")
public class Room_DAOMyBatis {
	//src/main/resources/mappings/room-mapper.xml
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Room_DAOMyBatis() {
		System.out.println(">> Room_DAOMyBatis 객체 생성");	
	}
	
	//-------------------------------------------------------------------
	public List<RoomAll_VO> myBatis_getSiList_vo(RoomAll_VO vo) {
		System.out.println("===> myBatis_getSiList_vo() 실행");
		List<RoomAll_VO> list=mybatis.selectList("Room_DAO.getSiList_vo", vo);
		return list;
	}

	public List<RoomAll_VO> myBatis_getDoList_vo(RoomAll_VO vo) {
		System.out.println("===> myBatis_getDoList_vo() 실행");
		List<RoomAll_VO> list=mybatis.selectList("Room_DAO.getDoList_vo", vo);
		for(RoomAll_VO v : list) {
			System.out.println(v);
		}
		return list;
	}

	public List<RoomAll_VO> myBatis_getAllList_vo(RoomAll_VO vo) {
		System.out.println("===> myBatis_getAllList_vo() 실행");
		List<RoomAll_VO> list=mybatis.selectList("Room_DAO.getAllList_vo", vo);
		return list;
	}

	public List<RoomAll_VO> myBatis_getAllList_vo() {
		List<RoomAll_VO> list=mybatis.selectList("Room_DAO.getAllList_vo");
		for( RoomAll_VO vo : list) {
			System.out.println(vo);
		}
		return list;
	}
}








