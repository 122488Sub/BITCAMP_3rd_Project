package com.koreigner.common.member;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreigner.biz.member.ResumeVO;

@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "C:\\dev\\file\\";

	public List<ResumeVO> 
		parseInsertFileInfo(ResumeVO rvo, HttpServletRequest request) throws Exception{
		
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<ResumeVO> rvolist = new ArrayList<ResumeVO>();
		ResumeVO vo = null;
		int memIdx = rvo.getResume_idx(); 
		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		} 
		
		while(iterator.hasNext()){ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				vo.setResume_idx(memIdx);
				vo.setOri_file(originalFileName);
				vo.setSave_file(storedFileName);
				rvolist.add(vo);
			}
		} 
			
		return rvolist; 
	}
	
	//서버에 저장할 랜덤 파일명 생성
	public static String getRandomString(){ 
		
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}

}
