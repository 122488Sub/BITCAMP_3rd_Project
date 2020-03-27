package com.koreigner.biz.member.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.job.hire.HireVO;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("wishService")
public class WishServiceImpl implements WishService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private WishDAO wishDAO;
	
	public WishServiceImpl() {
		System.out.println(">> WishServiceImpl() 실행");
	}

	@Override
	public List<WishVO> getWishList(WishVO vo) {
		return wishDAO.myBatis_getWishList(vo);
	}

	@Override
	public int getWishTotal(WishVO vo) {
		return wishDAO.myBatis_getWishTotal(vo);
	}

	//집 위시리스트 반환
	@Override
	public List<HouseAll_VO> getHouseWishList(WishVO wishVO) {
		return wishDAO.myBatis_getHouseWishList(wishVO);
	}

	@Override
	public List<HireVO> getHireWishList(WishVO wishVO) {
		return wishDAO.myBatis_getHireWishList(wishVO);
	}

	@Override
	public String togleWish(WishVO wishVO) {
		String result="";
		if(wishDAO.myBatis_isWish(wishVO)>0) {
			wishDAO.myBatis_insertWish(wishVO);
			result="추가";
		}else {
			wishDAO.myBatis_deleteWish(wishVO);
			result="삭제";
		}
		return result;
	}

	
	
	
	

	
	
	
	
}
