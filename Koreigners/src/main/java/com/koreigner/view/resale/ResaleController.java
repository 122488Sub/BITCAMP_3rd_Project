package com.koreigner.view.resale;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreigner.biz.common.page.PagingService;
import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.job.jobservice.JobService;
import com.koreigner.biz.member.UserService;
import com.koreigner.biz.member.UserVO;
import com.koreigner.biz.resale.ResaleCommVO;
import com.koreigner.biz.resale.ResaleDAO;
import com.koreigner.biz.resale.ResaleImgVO;
import com.koreigner.biz.resale.ResaleServiceImpl;
import com.koreigner.biz.resale.ResaleVO;

@Controller
public class ResaleController {

	@Autowired
	ResaleServiceImpl resaleServiceImpl;
	@Autowired
	JobService jobService;
	@Autowired
	PagingService paging;
	
	@RequestMapping(value="resaleList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resaleList(HttpServletRequest request, 
		     				 HttpServletResponse response, 
		     				 Model model) {
		
		String cPage = request.getParameter("cPage");
		// 페이지 처리
		PagingVO p =  paging.paging(cPage);
		
		System.out.println("resale list p : " + p);
		// 리스트 VO 생성
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<ResaleVO> list = resaleServiceImpl.getResaleList(map);
		List<ResaleImgVO> imgList = resaleServiceImpl.getResaleImgList(map);
		System.out.println("resaleList list : " + list);
		System.out.println("resaleList imgList : " + imgList);
		
		request.setAttribute("list", list);
		request.setAttribute("imgList", imgList);
		request.setAttribute("pvo", p);
		
		return "resale/resaleList2.page";
	}
	
	
	
	@RequestMapping(value="resale_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resale_go(HttpServletRequest request, 
						    HttpServletResponse response, 
						    Model model) {
		System.out.println("리세일이다");
		
		return "resale/resaleWrite.page";
	}
	
	@RequestMapping(value="resalePost.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resale_post(HttpServletRequest request, Model model, ResaleVO rsVO) {
		System.out.println("=============resalewrite start================");
		
		
		String mem_id = (String)request.getAttribute("mem_id");
		System.out.println("mem_id : 리세일포스트점두ㅜㅜㅜㅜㅜㅜㅜㅜㅜ" + mem_id);
		
		UserVO userVO = resaleServiceImpl.getUser(mem_id);
		
		rsVO.setMem_id(userVO.getMem_id());
		rsVO.setMem_pw(userVO.getMem_pw());
		rsVO.setMem_name(userVO.getMem_name());

		rsVO.setIp(request.getRemoteAddr());
		List<String> saveFileList = jobService.getFileList(rsVO.getFilename(), request);
		List<String> originFileList = saveFileList;
		
		String file_name = saveFileList.get(0);
		String file_ori_name = saveFileList.get(0);
		
		rsVO.setFileStr(file_name);
		rsVO.setFile_ori_name(file_ori_name);
		
		System.out.println("rsVO : " + rsVO.toString());
		System.out.println("=============resalewrite start================");
		
		resaleServiceImpl.writeRs(rsVO);
		resaleServiceImpl.writeImg(originFileList, saveFileList);
		
		return "resale/resaleWrite.page";
	}
	
	@RequestMapping(value="resaleDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resaleDetail(HttpServletRequest request, 
			 			  	   HttpServletResponse response, 
			 				   Model model) {
		System.out.println("resaleDetail.do 다");
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int rs_idx = Integer.parseInt(request.getParameter("rs_idx"));
		
		ResaleVO rsVO = resaleServiceImpl.getRsDetail(rs_idx);
		System.out.println("resaleDetail list : " + rsVO.toString());
		System.out.println("resaleDetail.do 다2");
		List<ResaleImgVO> imgList = resaleServiceImpl.resaleDetailImg(rs_idx);
		System.out.println("resaleDetail imgList : " + imgList);
		
		
		List<ResaleCommVO> c_list = resaleServiceImpl.resaleCommList(rs_idx); // id="comm"
		
		System.out.println("resaleDetail c_list : " + c_list);
		System.out.println("resaleDetail.do 다3");
		request.setAttribute("rsVO", rsVO);
		request.setAttribute("imgList", imgList);
		request.setAttribute("cPage", cPage);
		request.setAttribute("c_list", c_list);
		
		return "resale/resaleDetail.page";
	}	
	
	@RequestMapping(value="commWrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView commWrite(HttpServletRequest request, 
					  	    HttpServletResponse response, 
						    ModelAndView mav,
						    ResaleCommVO commVO) {
		System.out.println("commWrite.do 다====================================================");
		/*
		  int rs_idx, c_idx, groups, step, lev;
		 String mem_id, mem_pw, mem_name, content, ip;
		 Date write_date, regdate;
		 * */
		
		String mem_id = (String)request.getAttribute("mem_id");
		
		UserVO user = jobService.getUserInfo(mem_id);
		String cPage = request.getParameter("cPage");
		String ip = request.getRemoteAddr();
		System.out.println("comment : " + commVO.getContent());
		
		
		commVO.setMem_id(mem_id);
		commVO.setMem_pw(user.getMem_pw());
		commVO.setMem_name(user.getMem_name());
		commVO.setIp(ip);
		
		System.out.println("commWrite.do commVO : " + commVO.toString());
		
		
		resaleServiceImpl.insertComm(commVO);
		mav.addObject("cPage", cPage);
		mav.addObject("rs_idx", commVO.getRs_idx());
		mav.setViewName("redirect:resaleDetail.do");
		return mav;
	}
}
