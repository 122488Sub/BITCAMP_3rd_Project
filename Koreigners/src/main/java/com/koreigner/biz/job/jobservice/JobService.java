package com.koreigner.biz.job.jobservice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.common.member.SecurityUtil;

@Service
public class JobService {
	
	// signin Method======================================================================================================
	
	public String saveImg(List<MultipartFile> imgFile) {
		
		System.out.println("JobService 이다-------------");
		String path = "/C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/WEB-INF/views/job/upload/"; 
		String fileName = null;
	    File dir= new File(path);
	    
	    if(!dir.isDirectory()) {
	       dir.mkdirs();
	    }
		
		for(MultipartFile file : imgFile) {
			fileName = "businessImg_"+file.getOriginalFilename();
			System.out.println("fileName : " + fileName);
			
			try {                              //"c:/MyStudy/temp/"
				System.out.println("passing");
				file.transferTo(new File(path + fileName));
			} catch (IOException e) {
				System.out.println("IOException 발생");
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
	
	public String pwEncoder(String pw) {
		SecurityUtil pwEncoder = new SecurityUtil();
		
		return pwEncoder.encryptSHA256(pw);
	}
	
	// signin END =======================================================================================================
	
	
	
	
	
	
	
	
	
	
}
