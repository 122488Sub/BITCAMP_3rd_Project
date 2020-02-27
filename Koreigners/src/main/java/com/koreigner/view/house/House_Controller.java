package com.koreigner.view.house;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.house.HouseSearch_VO;
import com.koreigner.biz.house.House_Service;

@Controller
@SessionAttributes("house") //board 라는 이름의 Model이 있으면 session에 저장
public class House_Controller {
	@Autowired
	private House_Service houseService;
	
	// /WEB-INF/views/
	
	@RequestMapping(value="house_main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseMain_go() {
		//System.out.println("controller/houseMain_go");
		return "house/house_Main.page";
	}
	
	@RequestMapping(value="getHouseSearchList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	public List<HouseAll_VO> ctrl_getHouseSearchList(HouseSearch_VO vo) {
		return houseService.getSearchList(vo);
	}
	
	@RequestMapping(value="getHouseAllList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	public List<HouseAll_VO> ctrl_getAllList() {
		return  houseService.getAllList();
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
	public String houseInsert_process(HouseAll_VO vo, Model model) {
		houseService.insertNewHouse(vo);
		
		return "redirect:house_main.do";
	}
	
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="house_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseDetail_go(int room_idx, Model model) { 
	
		model.addAttribute("house",  houseService.getHouse(room_idx)); //데이터 저장
		return "house/house_Detail.page";
	}
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	
	
}//end class



















