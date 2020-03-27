package com.koreigner.view.house;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.house.HouseSearch_VO;
import com.koreigner.biz.house.House_Service;
import com.koreigner.biz.member.wish.WishVO;

@Controller
@SessionAttributes("house") //board 라는 이름의 Model이 있으면 session에 저장
public class House_Controller {
	@Autowired
	private House_Service houseService;
	
	@Autowired
	PagingService paging;
	
	// /WEB-INF/views/
	
	@RequestMapping(value="house_main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseMain_go() {
		//System.out.println("controller/houseMain_go");
		
		return "house/house_Main.page";
	}

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="house_insert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseInsert_go() {
		//System.out.println("controller/houseInsert_go");
		
		return "house/house_Insert.page";
	}
	
	
	@RequestMapping(value="house_insert_process.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseInsert_process(HttpServletRequest request, HouseAll_VO vo, Model model) {
		String mem_id = (String) request.getAttribute("mem_id"); 
		vo.setMem_email(mem_id);
		houseService.insertNewHouse(vo);
		
		return "redirect:house_main.do";
	}
	
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="house_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseDetail_go(HttpServletRequest request,int room_idx, Model model) { 
		System.out.println("detail");
		System.out.println("roomIDX: "+room_idx);
		HouseAll_VO vo=houseService.getHouse(room_idx);
		String mem_id = (String) request.getAttribute("mem_id");
		
		model.addAttribute("house",  vo); //데이터 저장
		model.addAttribute("deposit",  houseService.getHousePrice(vo.getDeposit()) ); //데이터 저장
		model.addAttribute("monthly",  houseService.getHousePrice(vo.getMonthly_rent())); //데이터 저장
		if (vo.getMem_email().equals(mem_id)) {
			model.addAttribute("authentication",  true);
			model.addAttribute("mem_id",  mem_id);
		}else {
			model.addAttribute("authentication",  false);
		}
		
		return "house/house_Detail.page";
	}
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="getHouseListData.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String houseListDate(HouseSearch_VO houseVO,HttpServletRequest request, HttpServletResponse response) {
		
	
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
		//HouseSearch_VO houseVO = new HouseSearch_VO();
	//	System.out.println("==================houseListData==================");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, houseVO);
		
		houseVO.setBegin(p.getBegin());
		houseVO.setEnd(p.getEnd());
		
		
	//	System.out.println("==================houseListData END==================");
		//리스트 정보 검색
		List<HouseAll_VO> list = houseService.getSearchList(houseVO);
		String result = houseService.getHouseListJson(list, p);
		request.setAttribute("pvo", p);
		return result;
	}
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
		
	@RequestMapping(value="house_Modify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseModify(HttpServletRequest request, int room_idx, Model model) {
		if(request.getAttribute("mem_id")==null) {
			return "redirect:house_main.do";
		}
		HouseAll_VO vo=houseService.getHouse(room_idx);
		model.addAttribute("house",  vo); //데이터 저장
		
		return "house/house_Modify.page";
	}
	@RequestMapping(value="house_Update.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseModify_process(HttpServletRequest request, HouseAll_VO vo, Model model) {
		if(request.getAttribute("mem_id")==null) {
			return "redirect:house_main.do";
		}
		
		houseService.updateHouse(vo);
		return "redirect:house_main.do";
	}
	
	
	@RequestMapping(value="house_Delete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseDelete(HttpServletRequest request, int room_idx, Model model) {
		houseService.deleteHouse(room_idx);
		return "redirect:house_main.do";
	}
	

	
}//end class



















