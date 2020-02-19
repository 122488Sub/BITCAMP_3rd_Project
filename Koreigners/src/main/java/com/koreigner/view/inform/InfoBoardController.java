package com.koreigner.view.inform;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.inform.InfoBoardService;
import com.koreigner.biz.inform.InfoBoardVO;


@Controller
@SessionAttributes("infoBoard")
public class InfoBoardController {
	
	@Autowired
	private InfoBoardService infoBoardService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		//key: 제목, value: TITLE
		//key: 내용, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	@RequestMapping("/getInfoBoardList.do")
	public String getInfoBoardList(InfoBoardVO vo, Model model) {
		System.out.println(">>> 글 전체 목록 조회 처리-getInfoBoardList()");
		System.out.println("condition : " +vo.getSearchCondition());
		System.out.println("keyword : " + vo.getSearchKeyword());
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("INFO_TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리후 condition : " + vo.getSearchCondition());
		System.out.println("null처리후 keyword : -" + vo.getSearchKeyword() + "-");
		
		List<InfoBoardVO> infoBoardList = infoBoardService.getInfoBoardList(vo);
		model.addAttribute("infoBoardList",infoBoardList);
	
		return "/getInfoBoardList.jsp";
	}
	
	@RequestMapping("/getInfoBoard.do")
	public String getInfoBoard (InfoBoardVO vo, Model model) {
		System.out.println(">>> 글 상세 조회 처리 - getInfoBoard()");
		
		InfoBoardVO infoBoard = infoBoardService.getInfoBoard(vo);
		model.addAttribute("infoBoard",infoBoard);
		System.out.println("> board : " + infoBoard);
		
		return "getInfoBoard.jsp";
	}
	
	@RequestMapping("/insertInfoBoard.do")
	public String insertBoard(InfoBoardVO vo) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertInfoBoard()");
		
	
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile : " + uploadFile);
		
		if (!uploadFile.isEmpty()) {//파일이 있으면(비어있지 않으면)
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("c:/MyStudy/temp/" + fileName));
		}
		
		infoBoardService.insertInfoBoard(vo);
		return "getInfoBoardList.do";
	}
	
	@RequestMapping("/updateInfoBoard.do")
	public String updateBoard(@ModelAttribute("board") InfoBoardVO vo) {
		System.out.println(">>> 글 수정 처리 - updateInfoBoard()");
		System.out.println("> board vo : " + vo);
		
		infoBoardService.updateInfoBoard(vo);
		return "getInfoBoardList.do";
	}
	
	@RequestMapping("/deleteInfoBoard.do")
	public String deleteBoard(InfoBoardVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteInfoBoard()");
		
		infoBoardService.deleteInfoBoard(vo);
		return "getInfoBoardList.do";
	}
}
