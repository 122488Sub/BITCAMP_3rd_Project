package com.koreigner.biz.member.wish;

import java.util.List;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.job.hire.HireVO;

public interface WishService {
	//CRUD 기능 구현 메소드 정의
	
	List<WishVO> getWishList(WishVO vo);

	int getWishTotal(WishVO vo);

	List<HouseAll_VO> getHouseWishList(WishVO wishVO);

	List<HireVO> getHireWishList(WishVO wishVO);
}
