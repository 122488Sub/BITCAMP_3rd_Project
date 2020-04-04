package com.koreigner.biz.member.mypage;

import java.util.List;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.inform.InformVO;
import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.resale.ResaleImgVO;
import com.koreigner.biz.resale.ResaleVO;

public interface p_MyPageService {
	//CRUD 기능 구현 메소드 정의
	
	List<p_MyPageVO> getWishList(p_MyPageVO vo);

	int getWishTotal(p_MyPageVO vo);

	List<HouseAll_VO> getHouseWishList(p_MyPageVO wishVO);

	List<HireVO> getHireWishList(p_MyPageVO wishVO);

	String togleWish(p_MyPageVO wishVO);

	List<ResaleVO> getResaleWishList(p_MyPageVO wishVO);

	List<ResaleImgVO> getResaleImgWishList(p_MyPageVO wishVO);

	List<HouseAll_VO> getHouseMyAdsList(p_MyPageVO wishVO);

	List<HireVO> getHireMyAdsList(p_MyPageVO wishVO); //사용안함
	List<HireVO> getHireMyApplyList(p_MyPageVO wishVO);

	List<ResaleVO> getResaleMyAdsList(p_MyPageVO wishVO);

	int getAdsTotal(p_MyPageVO pVO);

	boolean isWish(p_MyPageVO pVO);

	List<InformVO> getInformWishList(p_MyPageVO wishVO);

	List<InformVO> getInformMyAdsList(p_MyPageVO wishVO);

	
}
