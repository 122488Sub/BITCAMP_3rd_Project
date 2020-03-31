package com.koreigner.view.inform;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.inform.InformService;
import com.koreigner.biz.inform.InformVO;



@Controller
@SessionAttributes("inform")
public class InformController {
	
	@Autowired
	private InformService informService;
	@Autowired
	PagingService paging;
	@ModelAttribute("ccconditionMap")
	public Map<String, String> searchConditionMap() {
		//key: 제목, value: TITLE
		//key: 내용, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "INO_TITLE");
		conditionMap.put("내용", "INO_CONTENT");
		
		return conditionMap;
	}
	

	@RequestMapping(value="InfoList_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String infoList_go(Model model) {
		//System.out.println("controller/houseMain_go");
		
		model.addAttribute("postType", "inform");
		
		return "inform/infoList.page";
	}
	@RequestMapping(value="InfoInsert_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String InfoInsert_go(Model model) {
		//System.out.println("controller/houseMain_go");
		
		model.addAttribute("postType", "inform");
		
		return "inform/infoInsert.page";
	}
	@RequestMapping(value="getInformListData.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> getInformListData(InformVO informVO,HttpServletRequest request, HttpServletResponse response, Model model) {
		
	
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
		System.out.println("==================getInformListData==================");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, informVO);
		
		informVO.setBegin(p.getBegin());
		informVO.setEnd(p.getEnd());

		Map<String,Object> result=new HashMap<String, Object>();
		result.put("inform",informService.getSelectSearchList(informVO));
		
		System.out.println("==================getInformListData END==================");
		//리스트 정보 검색
		//List<HouseAll_VO> list = informService.getSearchList(houseVO);
		//String result = informService.getHouseListJson(list, p);
		request.setAttribute("pvo", p);
		
		model.addAttribute("postType", "inform");
		System.out.println(p);
		return result;
	}
	
	//임시(사진 업로드)
		@RequestMapping(value="uploadSummernoteImageFile.do")
		@ResponseBody
		public String uploadSummernoteImageFile(MultipartHttpServletRequest uploadImg, HttpServletRequest request) throws IllegalStateException, IOException {
			System.out.println("?!?!?!");
			MultiValueMap<String, MultipartFile> multi = uploadImg.getMultiFileMap();
			String path = this.getClass().getResource("").getPath();
			path = path.substring(1, path.indexOf(".metadata")) +  "Koreigners/src/main/webapp/resources/img/inform";
			
			List<MultipartFile> list = multi.get("file");
			MultipartFile multiFile = list.get(0);
			
			String fileName = multiFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String randomName = uuid.toString() + "_" + fileName;
			/*
			ServletContext sc = uploadImg.getServletContext();
			String imgPath = "";
			String folderName = "";
			
			String boardType = request.getParameter("boardType");
			if (boardType == null || boardType == "") {
				imgPath = sc.getRealPath("resources/data/boardImg");
				folderName = "boardImg/";
			} else if (boardType.equals("lectureInfo")){
				imgPath = sc.getRealPath("resources/data/lecture/lectureInfoImg");
				folderName = "lecture/lectureInfoImg/";
			}*/
			
			multiFile.transferTo(new File(path + "/" + randomName));
			
			return "resources/img/inform/" + URLEncoder.encode(randomName, "UTF-8");
		}


}
