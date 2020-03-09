package com.koreigner.biz.house;

import java.util.List;

import com.koreigner.biz.common.page.PagingVO;

public interface House_Service {
	//CRUD 기능 구현 메소드 정의

	
	List<HouseAll_VO> getSearchList(HouseSearch_VO vo);

	HouseAll_VO getHouse(int room_idx);
	
	int getHouseTotal(HouseSearch_VO vo);
	int insertNewHouse(HouseAll_VO vo);
	
	String getHouseListJson(List<HouseAll_VO> list, PagingVO p);
	

}
