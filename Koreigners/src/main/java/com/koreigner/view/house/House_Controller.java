package com.koreigner.view.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.house.House_Service;

@Controller
@SessionAttributes("house") //board 라는 이름의 Model이 있으면 session에 저장
public class House_Controller {
	@Autowired
	private House_Service houseService;
	
	@RequestMapping("/getHouseSiList.do")
	@ResponseBody
	public List<HouseAll_VO> ctrl_getSiList(@ModelAttribute HouseAll_VO vo) {
		System.out.println("?원본");
		for(String s : vo.getGu_gun_eup_engArr()) {
			System.out.println("ss: "+s);
		}
		
		
		List<HouseAll_VO> houseList = houseService.getSiList(vo);
		return houseList;
		
	}
	
	@RequestMapping("/getHouseDoList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<HouseAll_VO> ctrl_getDoList(HouseAll_VO vo) {
		System.out.println("원본");
		System.out.println(vo);

		
		List<HouseAll_VO> houseList = houseService.getDoList(vo);
		return houseList;
		
		//return null;
	}
	
	@RequestMapping("/getHouseAllList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<HouseAll_VO> ctrl_getAllList(
						@RequestParam(value="option[]") List<String> opt
					) {
		System.out.println("gd");
		
		//map.put("do_en", do_en);
		
		//List<Room_VO> testList = testService.getAllList(map);
		List<HouseAll_VO> houseList = houseService.getAllList();
		for(HouseAll_VO v : houseList) {
			System.out.println(v);
		}
		return houseList;
		
		//return null;
	}
}//end class



















