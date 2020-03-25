package com.koreigner.view.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.house.House_Service;
import com.koreigner.biz.job.hire.HireServiceImpl;
import com.koreigner.biz.member.wish.WishService;
import com.koreigner.biz.member.wish.WishVO;

@Controller
public class WishController {

	@Autowired
	private WishService wishService;
	@Autowired
	private House_Service houseService;
	@Autowired
	HireServiceImpl hireServiceImpl;
	@Autowired
	PagingService paging;
	
	@RequestMapping(value="getWishList.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String wishListData(WishVO wishVO,HttpServletRequest request, HttpServletResponse response) {
		
		//리스트 정보 검색
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
	
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, wishVO);
		
		wishVO.setBegin(p.getBegin());
		wishVO.setEnd(p.getEnd());
	
		String result="" ;
		
		switch (wishVO.getBoard_idx()) {
		case 1://하우스
			result = houseService.getHouseListJson(wishService.getHouseWishList(wishVO),p);
			break;
		case 2://일자리
			result = hireServiceImpl.getHireListJson(wishService.getHireWishList(wishVO), p);
			break;
		case 3://중고
			
			break;
		case 4://자유
			
			break;
		default:
			break;
		}
		request.setAttribute("pvo", p);
		return result;
	}
	
	
}