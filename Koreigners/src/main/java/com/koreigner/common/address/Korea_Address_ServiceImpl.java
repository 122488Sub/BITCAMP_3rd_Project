package com.koreigner.common.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("testService")
public class Korea_Address_ServiceImpl implements Korea_Address_Service {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private Korea_Address_DAOMyBatis testDAO;
	
	public Korea_Address_ServiceImpl() {
		System.out.println(">> Korea_Address_ServiceImpl() 실행");
	}
	
	@Override
	public List<Korea_Address_VO> getTestList(Korea_Address_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.getTestList(vo);
	}

}
