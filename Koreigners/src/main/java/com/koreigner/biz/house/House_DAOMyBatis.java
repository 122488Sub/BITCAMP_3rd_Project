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
	
	//-------------------------------------------------------------------
	public List<HouseAll_VO> myBatis_getSiList_vo(HouseAll_VO vo) {
		System.out.println("===> myBatis_getSiList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getSiList_vo", vo);

		for(int i=0;i<list.size();i++) {
			list.get(i).setRoom_img_nameArr(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setRoom_img_ori_nameArr(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}

	public List<HouseAll_VO> myBatis_getDoList_vo(HouseAll_VO vo) {
		System.out.println("===> myBatis_getDoList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getDoList_vo", vo);
		for(int i=0;i<list.size();i++) {
			list.get(i).setRoom_img_nameArr(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setRoom_img_ori_nameArr(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}

	public List<HouseAll_VO> myBatis_getAllList_vo() {
		System.out.println("===> myBatis_getAllList_vo() 실행");
		List<HouseAll_VO> list=mybatis.selectList("House_DAO.getAllList_vo");
		for(int i=0;i<list.size();i++) {
			list.get(i).setRoom_img_nameArr(Arrays.asList(list.get(i).getRoom_img_name().split(",")));
			list.get(i).setRoom_img_ori_nameArr(Arrays.asList(list.get(i).getRoom_img_ori_name().split(",")));
		}
		
		return list;
	}

	public HouseAll_VO myBatis_getHouse_vo(HouseAll_VO vo) {
		HouseAll_VO house=mybatis.selectOne("House_DAO.getHouse_vo",vo);
		
		house.setRoom_img_nameArr(Arrays.asList(house.getRoom_img_name().split(",")));
		house.setRoom_img_ori_nameArr(Arrays.asList(house.getRoom_img_ori_name().split(",")));
		System.out.println(house);
		
		return house;
	}
}








