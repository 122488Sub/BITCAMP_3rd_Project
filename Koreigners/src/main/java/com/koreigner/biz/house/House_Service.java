package com.koreigner.biz.house;

import java.util.List;

public interface House_Service {
	//CRUD 기능 구현 메소드 정의

	
	List<HouseAll_VO> getSearchList(HouseSearch_VO vo);
	List<HouseAll_VO> getAllList();
	HouseAll_VO getHouse(int room_idx);
	

	int insertNewHouse(HouseAll_VO vo);
}
