package com.koreigner.biz.job.jobservice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
	
	// hire =============================================================================================================
	
	public String insuranceInfo(List<String> insurance) {
		String insurInfo = "";
		String health = "0";
		String compensation = "0";
		String Employment = "0";
		String national  = "0";
		
		for(String str : insurance) {
			System.out.println(str);
			if (str.equalsIgnoreCase("의료보험")) {health="1";}
			if (str.equalsIgnoreCase("산재보험")) {compensation="1";}
			if (str.equalsIgnoreCase("고용보험")) {Employment="1";}
			if (str.equalsIgnoreCase("국민연금보험")) {national="1";}
			}
		insurInfo = health + compensation + Employment + national;
		//System.out.println(insurInfo);
		
		return insurInfo;
	}
	
	
	public List<String> insurToEn(String insurInfo) {
		insurInfo = "0110";
		List<String> insurance = new ArrayList<String>();
		String health = insurInfo.substring(0,1);
		String compensation = insurInfo.substring(1,2);
		String Employment = insurInfo.substring(2,3);
		String national  = insurInfo.substring(3,4);
		
		if(health.equals("1")) {
			insurance.add("Health Insurance");
		}
		if(compensation.equals("1")) {
			insurance.add("Worker`s compensation");
		}
		if(Employment.equals("1")) {
			insurance.add("Insurance Employment");
		}
		if(national.equals("1")) {
			insurance.add("Insurance National pension");
		}
		
		return insurance;
	}
	
	
	
	// hire END =========================================================================================================
	
	
	
	
	
	
	
	
	
}
