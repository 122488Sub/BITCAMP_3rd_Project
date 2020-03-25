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


@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "/C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/resources/resume/";
	
	public List<Map<String, Object>> 
		parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		String resume_idx = (String)map.get("RESUME_IDX");
		System.out.println(">>>>> fileUtils의 resume_idx : " + resume_idx);
						
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
				
				listMap = new HashMap<String, Object>();
				listMap.put("RESUME_IDX", resume_idx);
				listMap.put("ORI_FILE", originalFileName);
				listMap.put("SAVE_FILE", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		} 
			
		return list; 
	}
	
	//서버에 저장할 랜덤 파일명 생성
	public static String getRandomString(){ 
		
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}

}
