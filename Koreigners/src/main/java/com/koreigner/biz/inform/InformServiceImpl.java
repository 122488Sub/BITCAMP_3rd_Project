package com.koreigner.biz.inform;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("informService")
public class InformServiceImpl implements InformService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private InformDAO informDAO;

	@Override
	public int informSearchTotal(InformVO informVO) {
		return informDAO.dao_informSearchTotal(informVO);
	}

	@Override
	public List<Map<String, Object>> getSelectSearchList(InformVO informVO) {
		// TODO Auto-generated method stub
		return informDAO.dao_getSelectSearchList(informVO);
	}
	
	
	
	
}