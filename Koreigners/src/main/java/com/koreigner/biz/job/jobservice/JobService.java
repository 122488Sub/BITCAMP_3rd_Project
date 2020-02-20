package com.koreigner.biz.job.jobservice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.job.company.CompanyVO;

public class JobService {
	public String saveImg(CompanyVO vo) {
		
		System.out.println("JobService 이다-------------");
		String path = "/C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/WEB-INF/views/job/upload/"; 
		String fileName = null;
	    File dir= new File(path);
	    List<MultipartFile> imgFile = vo.getBusiness_file();
	    
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
}
