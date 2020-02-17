package com.koreigner.view.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreigner.biz.house.RoomAll_VO;
import com.koreigner.biz.house.Room_Service;

@Controller
@SessionAttributes("room") //board 라는 이름의 Model이 있으면 session에 저장
public class Room_Controller {
	@Autowired
	private Room_Service testService;
	
	@RequestMapping("/getRoomSiList.do")
	@ResponseBody
	public List<RoomAll_VO> ctrl_getSiList(@ModelAttribute RoomAll_VO vo) {
		System.out.println("?원본");
		for(String s : vo.getGu_gun_eup_engArr()) {
			System.out.println("ss: "+s);
		}
		
		
		List<RoomAll_VO> testList = testService.getSiList(vo);
		return testList;
		
	}
	
	@RequestMapping("/getRoomDoList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<RoomAll_VO> ctrl_getDoList(RoomAll_VO vo) {
		System.out.println("원본");
		System.out.println(vo);

		
		List<RoomAll_VO> testList = testService.getDoList(vo);
		return testList;
		
		//return null;
	}
	
	@RequestMapping("/getRoomAllList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<RoomAll_VO> ctrl_getAllList(
						@RequestParam(value="option[]") List<String> opt
					) {
		System.out.println("gd");
		
		//map.put("do_en", do_en);
		
		//List<Room_VO> testList = testService.getAllList(map);
		List<RoomAll_VO> testList = testService.getAllList();
		for(RoomAll_VO v : testList) {
			System.out.println(v);
		}
		return testList;
		
		//return null;
	}
}//end class



















