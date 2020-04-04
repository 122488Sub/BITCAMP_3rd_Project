package com.koreigner.biz.member.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.inform.InformVO;
import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.resale.ResaleImgVO;
import com.koreigner.biz.resale.ResaleVO;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("p_MyPageService")
public class p_MyPageServiceImpl implements p_MyPageService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private p_MyPageDAO pDAO;
	
	public p_MyPageServiceImpl() {
		System.out.println(">> WishServiceImpl() 실행");
	}

	@Override
	public List<p_MyPageVO> getWishList(p_MyPageVO vo) {
		return pDAO.myBatis_getWishList(vo);
	}

	@Override
	public int getWishTotal(p_MyPageVO vo) {
		return pDAO.myBatis_getWishTotal(vo);
	}

	//집 위시리스트 반환
	@Override
	public List<HouseAll_VO> getHouseWishList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getHouseWishList(wishVO);
	}

	@Override
	public List<HireVO> getHireWishList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getHireWishList(wishVO);
	}
	@Override
	public List<ResaleVO> getResaleWishList(p_MyPageVO wishVO) {
		// TODO Auto-generated method stub
		return pDAO.myBatis_getResaleWishList(wishVO);
	}

	@Override
	public List<ResaleImgVO> getResaleImgWishList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getResaleImgWishList(wishVO);
	}

	@Override
	public String togleWish(p_MyPageVO wishVO) {
		String result = "";
		if(pDAO.myBatis_isWish(wishVO)) {
			pDAO.myBatis_deleteWish(wishVO);
			result="You have been removed from your Wish List.";
		}else {
			pDAO.myBatis_insertWish(wishVO);
			result="You have been registered on your Wish List.";
			
		}
	
		return result;
	}

	@Override
	public List<HouseAll_VO> getHouseMyAdsList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getHouseMyAdsList(wishVO);
	}

	@Override  //사용안함
	public List<HireVO> getHireMyAdsList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getHireMyAdsList(wishVO);
	}

	@Override
	public List<HireVO> getHireMyApplyList(p_MyPageVO wishVO) {
		List<HireVO> list=pDAO.myBatis_getHireMyApplyList(wishVO);
		System.out.println(">>");
		for(HireVO v : list)
			System.out.println(v);
		return list;
	}
	
	@Override
	public List<ResaleVO> getResaleMyAdsList(p_MyPageVO wishVO) {
		return pDAO.myBatis_getResaleMyAdsList(wishVO);
	}

	@Override
	public int getAdsTotal(p_MyPageVO pVO) {
		// TODO Auto-generated method stub
		return pDAO.myBatis_getAdsTotal(pVO);
	}

	@Override
	public boolean isWish(p_MyPageVO pVO) {
		return pDAO.myBatis_isWish(pVO);
	}

	@Override
	public List<InformVO> getInformWishList(p_MyPageVO wishVO) {
	
		return pDAO.myBatis_getInformWishList(wishVO);
	}

	@Override
	public List<InformVO> getInformMyAdsList(p_MyPageVO wishVO) {
		
		return pDAO.myBatis_getInformMyAdsList(wishVO);
	}

	

	
	
	
	
	

	
	
	
	
}
