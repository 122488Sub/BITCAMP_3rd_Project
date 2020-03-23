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

	public int myBatis_getHouseTotal(HouseSearch_VO vo) {
		
		return mybatis.selectOne("House_DAO.getHouseTotal",vo);
	}
	
	public List<HouseAll_VO> myBatis_getSearchList(HouseSearch_VO vo) {
		System.out.println(vo.getDosiFilter());
		System.out.println(vo.isBuildFilter());
		System.out.println(vo.isRoomFilter());
		
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getSearchList", vo);
		
		for(HouseAll_VO voo : list)
			System.out.println(voo);
		
		for(int i=0;i<list.size();i++) {
			list.get(i).setImg_nameList(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setImg_ori_nameList(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}

	public int myBatis_deleteHouse(int room_idx) {
		return mybatis.update("House_DAO.deleteHouse", room_idx);
		
	}

	public int myBatis_updateHouse(HouseAll_VO vo) {
		
		return mybatis.update("House_DAO.updateHouse", vo);
	}
}








