package com.koreigner.view.house;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.house.House_Service;

@Controller
@SessionAttributes("house") //board 라는 이름의 Model이 있으면 session에 저장
public class House_Controller {
	@Autowired
	private House_Service houseService;
	
	@RequestMapping(value="house_main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseMain_go() {
		System.out.println("controller/houseMain_go");
		
		return "WEB-INF/views/house/house_Main.jsp";
	}
	
	
	
	@RequestMapping(value="getHouseSiList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<HouseAll_VO> ctrl_getSiList(@ModelAttribute HouseAll_VO vo) {
		System.out.println("?원본");
		//for(String s : vo.getGu_gun_eup_engArr()) {
		//	System.out.println("ss: "+s);
		//}
		
		
		List<HouseAll_VO> houseList = houseService.getSiList(vo);
		return houseList;
		
	}
	
	@RequestMapping(value="getHouseDoList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<HouseAll_VO> ctrl_getDoList(HouseAll_VO vo) {
		System.out.println("원본");
		System.out.println(vo);

		
		List<HouseAll_VO> houseList = houseService.getDoList(vo);
		return houseList;
		
		//return null;
	}
	

	@RequestMapping(value="getHouseAllList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	//public List<Room_VO> ctrl_getSiList(@RequestParam(value="siListParam[]") List<String> siList) {
	public List<HouseAll_VO> ctrl_getAllList(
						@RequestParam(value="option[]") List<String> opt
					) {
		//System.out.println("gd");
		
		//map.put("do_en", do_en);
		
		//List<Room_VO> testList = testService.getAllList(map);
		List<HouseAll_VO> houseList = houseService.getAllList();
		//for(HouseAll_VO v : houseList) {
		//	System.out.println(v);
		//}
		return houseList;
		
		//return null;
	}
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="house_insert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseInsert_go() {
		System.out.println("controller/houseInsert_go");
		
		return "WEB-INF/views/house/house_Insert.jsp";
	}
	
	@RequestMapping(value="house_MultiImgUpload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String imgUpload(HttpServletRequest request, MultipartHttpServletRequest multi) { 
		System.out.println("controller/house_MultiImgUpload");
		
		String path = "C:\\Users\\sub\\Documents\\Git\\BITCAMP_3rd_Project\\Koreigners\\src\\main\\webapp\\WEB-INF\\views\\house\\upload\\";
		System.out.println(path);
		//System.out.println(this.getClass().getResource("").getPath());
		//System.out.println(request.getContextPath());
		//System.out.println(request.getRealPath(""));
	//	System.out.println("houseImgUploadPath");
		String fileName="";
		String returnFileName="";
		File dir= new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mFile = multi.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();
			returnFileName += fileName+",";
			System.out.println("실제 파일 이름 : "+ fileName);
			try {
				mFile.transferTo(new File(path + fileName));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		return returnFileName.substring(0, returnFileName.length()-1);
	}
	
	@RequestMapping(value="house_insert_process.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseInsert_process(HouseAll_VO vo, Model model) {
		System.out.println("controller/houseInsert_process");
		
	
		return "WEB-INF/views/house/house_Main.jsp";
	}
	
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="house_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String houseDetail_go(HouseAll_VO vo, Model model) { 
		System.out.println("controller/houseDetail_go");
		System.out.println(vo);
		System.out.println(">>> 글 상세 조회 처리 - getHouse()");
		
		HouseAll_VO house = houseService.getHouse(vo);
		//model.addAttribute(board); //boardVO
		model.addAttribute("house", house); //데이터 저장
		System.out.println("> house : " + house);
		
		return "WEB-INF/views/house/house_Detail.jsp";
	}
	
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	
	
	
}//end class



















