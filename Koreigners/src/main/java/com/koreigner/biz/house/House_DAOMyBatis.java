package com.koreigner.biz.house;

import java.util.Arrays;
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


	
	public List<HouseAll_VO> myBatis_getAllList() {
		//System.out.println("===> myBatis_getAllList() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getAllList");
		for(int i=0;i<list.size();i++) {
			list.get(i).setImg_nameList(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setImg_ori_nameList(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}

	public HouseAll_VO myBatis_getHouse(int room_idx) {
		HouseAll_VO house=mybatis.selectOne("House_DAO.getHouse",room_idx);
		
		house.setImg_nameList(Arrays.asList(house.getRoom_img_name().split(",")));
		house.setImg_ori_nameList(Arrays.asList(house.getRoom_img_ori_name().split(",")));
		return house;
	}

	public int myBatis_insertNewHouse(HouseAll_VO vo) {
		
		return mybatis.insert("House_DAO.insertNewHouse", vo);
	}

	public int myBatis_getRoom_Sq() {
		
		return mybatis.selectOne("House_DAO.getRoom_Sq");
	}

	public List<HouseAll_VO> myBatis_getSearchList(HouseSearch_VO vo) {
		
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getSearchList", vo);
		for(int i=0;i<list.size();i++) {
			list.get(i).setImg_nameList(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setImg_ori_nameList(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}
}








