package com.koreigner.biz.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("roomService")
public class Room_ServiceImpl implements Room_Service {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private Room_DAOMyBatis testDAO;
	
	public Room_ServiceImpl() {
		System.out.println(">> Room_ServiceImpl() 실행");
	}

	
	

	@Override
	public List<RoomAll_VO> getSiList(RoomAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getSiList_vo(vo);
	}


	@Override
	public List<RoomAll_VO> getDoList(RoomAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getDoList_vo(vo);
	}


	@Override
	public List<RoomAll_VO> getAllList(RoomAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getAllList_vo(vo);
	}


	@Override
	public List<RoomAll_VO> getAllList() {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getAllList_vo();
	}

}
