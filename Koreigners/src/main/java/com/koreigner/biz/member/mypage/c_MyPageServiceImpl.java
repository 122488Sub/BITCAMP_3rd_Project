package com.koreigner.biz.member.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("c_MyPageService")
public class c_MyPageServiceImpl implements c_MyPageService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	
	private c_MyPageDAO cDAO;

	@Override
	public Map<String, Object> getHireMyAdsList(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return cDAO.myBatis_getHireMyAdsList(cVO);
	}

	@Override
	public List<Map<String, Object>> getResumeApplyList(c_MyPageVO cVO) {
		
		return cDAO.myBatis_getResumeApplyList(cVO);
	}

	@Override
	public int getResumeTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return cDAO.mybatis_getResumeTotal(cVO);
	}
	
	@Override
	public int getHireTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return cDAO.mybatis_getHireTotal(cVO);
	}
	
	
	

	
	
	
	
}
