package com.koreigner.view.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.house.House_Service;
import com.koreigner.biz.job.hire.HireServiceImpl;
import com.koreigner.biz.member.mypage.p_MyPageService;
import com.koreigner.biz.member.mypage.p_MyPageVO;
import com.koreigner.biz.resale.ResaleServiceImpl;
import com.koreigner.biz.resale.ResaleVO;

@Controller
public class c_MyPageController {

	@Autowired
	private p_MyPageService wishService;
	
	@Autowired
	PagingService paging;
	
	@RequestMapping(value="getCompanyHireList.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object>  wishListData(p_MyPageVO wishVO,HttpServletRequest request, HttpServletResponse response) {
		
		//리스트 정보 검색
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
	
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, wishVO);
		
		wishVO.setBegin(p.getBegin());
		wishVO.setEnd(p.getEnd());
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("house",wishService.getHouseWishList(wishVO));
		
		result.put("pvo",p);
		request.setAttribute("pvo", p);
		return result;
		
	}
	
	@RequestMapping(value="getCompanyApply.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object>  myAdsListData(p_MyPageVO wishVO,HttpServletRequest request, HttpServletResponse response) {
		
		//리스트 정보 검색
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
	
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, wishVO);
		
		wishVO.setBegin(p.getBegin());
		wishVO.setEnd(p.getEnd());
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		switch (wishVO.getBoard_idx()) {
		case 1://하우스
			result.put("house",wishService.getHouseMyAdsList(wishVO));
			break;
		case 2://일자리
		//	result.put("hire",wishService.getHireMyAdsList(wishVO));
			break;
		case 3://중고
			List<ResaleVO> resaleList=wishService.getResaleMyAdsList(wishVO);
			result.put("list",resaleList);
			break;
		case 4://자유
			
			break;
		default:
			break;
		}
		result.put("pvo",p);
		request.setAttribute("pvo", p);
		return result;
		
	}
	
	
	
	
	
	@RequestMapping(value="togleWish.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String houseWish(HttpServletRequest request, p_MyPageVO wishVO, Model model) {
		System.out.println("houseWish");
		String result="";
		
		result=wishService.togleWish(wishVO);
		
		return result;
	}
	
	
	
}