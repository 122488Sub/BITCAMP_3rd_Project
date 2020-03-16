package com.koreigner.view.resale;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreigner.biz.job.jobservice.JobService;
import com.koreigner.biz.member.UserVO;
import com.koreigner.biz.resale.ResaleDAO;
import com.koreigner.biz.resale.ResaleServiceImpl;
import com.koreigner.biz.resale.ResaleVO;

@Controller
public class ResaleController {

	@Autowired
	ResaleServiceImpl resaleServiceImpl;
	@Autowired
	JobService jobService;
	
	@RequestMapping(value="resale_go.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resale_go(HttpServletRequest request, Model model) {
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
		List<String> saveFileList = jobService.getFileList(rsVO.getFilename());
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
	
	
	
}
