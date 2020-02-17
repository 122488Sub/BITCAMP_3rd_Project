package com.koreigner.biz.house;

import java.util.List;

public interface Room_Service {
	//CRUD 기능 구현 메소드 정의

	List<RoomAll_VO> getSiList(RoomAll_VO vo);
	List<RoomAll_VO> getDoList(RoomAll_VO vo);
	List<RoomAll_VO> getAllList(RoomAll_VO vo);
	List<RoomAll_VO> getAllList();
}
