package com.koreigner.biz.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("houseService")
public class House_ServiceImpl implements House_Service {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private House_DAOMyBatis testDAO;
	
	public House_ServiceImpl() {
		System.out.println(">> Room_ServiceImpl() 실행");
	}

	
	

	@Override
	public List<HouseAll_VO> getSiList(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getSiList_vo(vo);
	}


	@Override
	public List<HouseAll_VO> getDoList(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getDoList_vo(vo);
	}



	@Override
	public List<HouseAll_VO> getAllList() {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getAllList_vo();
	}




	@Override
	public HouseAll_VO getHouse(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		System.out.println("impl vo"+vo);
		return testDAO.myBatis_getHouse_vo(vo);
	}

}
