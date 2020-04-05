package com.koreigner.view.inform;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.koreigner.biz.member.mypage.p_MyPageService;
import com.koreigner.biz.member.mypage.p_MyPageVO;



@Controller
@SessionAttributes("inform")
public class InformController {
	
	@Autowired
	private InformService informService;
	@Autowired
	PagingService paging;
	@Autowired
	private p_MyPageService pService;
	
	@ModelAttribute("ccconditionMap")
	public Map<String, String> searchConditionMap() {
		//key: 제목, value: TITLE
		//key: 내용, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "INO_TITLE");
		conditionMap.put("내용", "INO_CONTENT");
		
		return conditionMap;
	}
	@RequestMapping(value="InformDetail_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String informDetail_go(HttpServletRequest request,Model model, int info_idx) {
		System.out.println("controller/informDetail_go");
		System.out.println(info_idx);
		informService.increaseHit(info_idx);
		InformVO informVO= informService.getInform(info_idx);
		
		model.addAttribute("inform",  informVO); //데이터 저장
		String mem_id = (String) request.getAttribute("mem_id");
		if(mem_id!=null)
			model.addAttribute("isWish",  pService.isWish(new p_MyPageVO(mem_id,4,informVO.getInfo_idx())));
		model.addAttribute("postType", "inform");
		
		return "inform/infoDetail.page";
	}
	
	@RequestMapping(value="InfoList_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String infoList_go(Model model) {
		
		
		model.addAttribute("postType", "inform");
		
		return "inform/infoList.page";
	}
	
	@RequestMapping(value="getInformListData.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> getInformListData(InformVO informVO,HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println(informVO);
	
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// 리스트 VO 생성
	
		System.out.println("==================getInformListData==================");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage, informVO);
		System.out.println("------------------------------------------------------");
		informVO.setBegin(p.getBegin());
		informVO.setEnd(p.getEnd());
		System.out.println("=====================================================");
		Map<String,Object> result=new HashMap<String, Object>();
		result.put("inform",informService.getSelectSearchList(informVO));
		
		//각 카테고리별 글 수 조회
		System.out.println(informVO);
		result.put("categoryCount", informService.getInformCategoryCount(informVO));
				//model.addAttribute("categoryCount", informService.getInformCategoryCount());
		System.out.println("?");
		String mem_id = (String) request.getAttribute("mem_id");
		if(mem_id!=null)
			result.put("informWish", informService.informWish(mem_id) );
		
		System.out.println("==================getInformListData END==================");
		//리스트 정보 검색
		
		
		
		request.setAttribute("pvo", p);
		result.put("pvo",p);
		model.addAttribute("postType", "inform");
		System.out.println(p);
		return result;
	}
	
	
	
	
	
	@RequestMapping(value="uploadSummernoteImageFile.do")
	@ResponseBody
	public String uploadSummernoteImageFile(MultipartHttpServletRequest uploadImg, HttpServletRequest request) throws IllegalStateException, IOException {
		String mem_id=(String)request.getAttribute("mem_id");
		MultiValueMap<String, MultipartFile> multi = uploadImg.getMultiFileMap();
		
		List<MultipartFile> list = multi.get("file");
		MultipartFile multiFile = list.get(0);
	
		String fileName = multiFile.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String randomName = uuid.toString() + "_" + fileName;
	
		String imgPath =  request.getSession().getServletContext().getRealPath("/resources/img/inform/"+mem_id);
		
		System.out.println(imgPath);
		multiFile.transferTo(new File(imgPath + "/" + randomName));
		
		
		String imgPath2 = imgPath.substring(0, imgPath.indexOf(".metadata")) + "Koreigners\\src\\main\\webapp\\resources\\img\\inform\\"+mem_id;
		System.out.println(imgPath2);

		//inFileName: 원본 경로포함 이름 / outFileName:목적위치 경로포함 파일이름
		//informService.nioFileCopy(inFileName, outFileName)
		informService.nioFileCopy((imgPath + "\\" + randomName), (imgPath2 + "\\" + randomName));
		
		
		
		return "resources/img/inform/"+mem_id+"/" + URLEncoder.encode(randomName, "UTF-8");
	}
	
	@RequestMapping(value="InfoInsert_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String InfoInsert_go(Model model) {
		//System.out.println("controller/houseMain_go");
		
		model.addAttribute("postType", "inform");
		
		return "inform/infoInsert.page";
	}
	
	@RequestMapping(value="InfoInsert_process.do", method={RequestMethod.GET, RequestMethod.POST})
	public String InfoInsert_process(InformVO informVO,HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("infoInsert_process");
		informVO.setInfo_mem_id((String)request.getAttribute("mem_id"));
		System.out.println(informVO);
		informService.insertInform(informVO);
		return "redirect:InfoList_go.do";
	}
	
	@RequestMapping(value="InfoModify_go.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String InfoModify_go(HttpServletRequest request, int info_idx, Model model) {
		System.out.println("InfoModify_go.do");
		model.addAttribute("postType", "inform");
		
		if(request.getAttribute("mem_id")==null) {
			return "redirect:InfoList_go.do";
		}
		
		InformVO informVO= informService.getInform(info_idx);
		if( ! ((String)request.getAttribute("mem_id")).equals(informVO.getInfo_mem_id())) {
			
			return "redirect:InfoList_go.do";
		}
		
		model.addAttribute("inform",  informVO); //데이터 저장
		
		return "inform/infoModify.page";
	}
	
	@RequestMapping(value="InfoModify_process.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String InfoModify_process(HttpServletRequest request, InformVO informVO, Model model) {
		System.out.println("InfoModify_process.do");
		
		model.addAttribute("postType", "inform");
		
		if(request.getAttribute("mem_id")==null) {
			return "redirect:InfoList_go.do";
		}
		if( ! ((String)request.getAttribute("mem_id")).equals(informVO.getInfo_mem_id())) {
			System.out.println(request.getAttribute("mem_id"));
			System.out.println(informVO.getInfo_mem_id());
			return "redirect:InfoList_go.do";
		}
		System.out.println(informVO);
		informService.updateInform(informVO);
		
		return "redirect:InfoList_go.do";
	}
	

	@RequestMapping(value="InfoDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String InfoDelete(HttpServletRequest request, int info_idx, Model model) {
		informService.deleteInform(info_idx);
		model.addAttribute("postType", "inform");
		
		return "redirect:InfoList_go.do";
	}
}
