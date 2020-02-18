package com.koreigner.view.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreigner.common.address.Korea_Address_Service;
import com.koreigner.common.address.Korea_Address_VO;

@Controller
@SessionAttributes("test") //board 라는 이름의 Model이 있으면 session에 저장
public class Korea_Address_Controller {
	@Autowired
	private Korea_Address_Service testService;
	
	@RequestMapping("getKoreaAddressList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이터 전달
	public List<Korea_Address_VO> getTestList(Korea_Address_VO vo) {
		List<Korea_Address_VO> testList = testService.getTestList(vo);
		return testList;
	}
	
	
	
}//end class



















