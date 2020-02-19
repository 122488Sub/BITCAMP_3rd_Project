package com.koreigner.view.job;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.job.company.CompanyService;
import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyServiceImpl companyServiceImpl;
	
	@RequestMapping(value="job_join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String jobJoin_go() {
		/*
		src/main/resources/tiles/tiles.xml
		
		tiles.xml에서 지정해둔 패턴을 통해
		앞에 prefix로 [/WEB-INF/views]가 추가된다.
		해당 경로 아래 파일명.page를 리턴 하면
		webapp/WEB-INF/tiles/template.jsp
		template.jsp를 상속 받아
		header와 footer가 추가 되어 보여진다.
		
		*참고  : .part는 default 템플릿(아무 설정없음)
		
		*/
		
		//return "WEB-INF/views/job/comp_join.jsp";
		//       /WEB-INF/views
		return "job/comp_join.page"; //.page suffix는 header와 footer를 함께 view 
	}
	
	
	
	@RequestMapping(value="join_conf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join_conf(CompanyVO vo) {
			//Iterator<MultipartFile> itr = uploadFile.iterator();
			//if(itr.hasNext()) {
			//	MultipartFile file = itr.next();
		System.out.println("111111111111111111");
			System.out.println(vo);
			
			
			 String path = "C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/WEB-INF/views/job/upload/"; 

		     

		      File dir= new File(path);
		      if(!dir.isDirectory()) {
		         dir.mkdirs();
		      }

			
			//if(vo.getBusiness_img() !=null) {
			for(MultipartFile file : vo.getBusiness_img()) {
				String fileName = file.getOriginalFilename();
				System.out.println("fileName : " + fileName);
				
				
				try {                              //"c:/MyStudy/temp/"
					System.out.println("passing");
					file.transferTo(new File("C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/WEB-INF/views/job/upload/" + fileName));
				} catch (IOException e) {
					System.out.println("IOException 발생");
					e.printStackTrace();
				}
			}
	
		
		System.out.println("here");
		//영어 카테고리 vo에 추가
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(vo);
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());
		vo.setCate_child_en(enCate_vo.getCate_child_en());
		
		System.out.println("vo.toStringAddress() : " + vo.toStringAddress());
		System.out.println("vo.toStringCate() : " + vo.toStringCate());
		System.out.println("vo.toString() : " + vo.toString());
		
		
		
		
		
		return "WEB-INF/views/job/comp_join.jsp";
		
		
		/* *** 파일 업로드 처리 ***
		 * MultipartFile 인터페이스 주요 메소드
		 * String fileName = uploadFile.getOriginalFilename(); : 업로드한 파일명 찾기
		 * void transferTo(File desFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일에 존재 여부
		 * 
		 		
		System.out.println("hi");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items;
		List<String> originFileList = new ArrayList<String>();
		List<String> saveFileList = new ArrayList<String>();
		
		
		
		try {
			items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			
			 while(iter.hasNext()){
			        FileItem item = iter.next();
			        
		            if (!item.isFormField()) {
		            	String name = item.getFieldName(); //필드이름
		                String originFileName = item.getName();  //원본 파일 명
		            	
		                String imgName = "job_" + originFileName; //저장 이름 
		                
		                //String dir = "C:/MyStudy/BITBANG/-BitCamp_Project02/Code/WebContent/images/resale"; //저장 경로
		                String dir = "C:/MyStudy/Final_Project/BITCAMP_3rd_Project/Koreigners/src/main/webapp/WEB-INF/views/job/upload"; //저장 경로
		                originFileList.add(originFileName);
		                saveFileList.add(imgName);
		                try {
							item.write(new File(dir, imgName));
						} catch (Exception e) {
							e.printStackTrace();
						}
		                
		            }
			    }//while End
			} catch (FileUploadException e1) {
				e1.printStackTrace();
			}
		
			for(int i = 0; i<originFileList.size(); i++) {
				System.out.println("originFileList.get(" + i + "); : "  +  originFileList.get(i));
				System.out.println("saveFileList.get(" + i + "); : "  +  saveFileList.get(i));
			}
			if(vo.getBusiness_img() != null) {
			System.out.println("이미지 있음");
			*/
	}

	
	
	
	@RequestMapping(value="getSiJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> getAddrSiList(@RequestParam("si_kor") String si_kor) {
		
		List<CompanyVO> list = companyServiceImpl.getAddrSiList(si_kor);
		return list;
	}

	@RequestMapping(value="getCateJson.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CompanyVO> join_put(@RequestParam("cate_prnt_ko") String cate_prnt_ko) {
		List<CompanyVO> list = companyServiceImpl.getCateChild(cate_prnt_ko);
		
		return list;
	}
	
	//페이지 전환 시 jobCateMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("jobCateMap")
	public Map<String, String> searchJobCateMap() {
		
		List<CompanyVO> list = companyServiceImpl.getCateList();
		//카테고리 대분류 문자 map에 저장
		Map<String, String> jobCateMap = new HashMap<>();
		
		int i = 1;
		for(CompanyVO vo : list) {
			jobCateMap.put(Integer.toString(i), vo.getCate_prnt_ko());
			i++;
		}
		return jobCateMap;
		
	}
	
	//페이지 전환 시 addrDoMap 맵 객체 전달 > 직무 카테고리
	@ModelAttribute("addrDoMap")
	public Map<String, String> searchAddrDoMap() {
		
		List<CompanyVO> list = companyServiceImpl.getAddrDoList();
		//카테고리 대분류 문자 map에 저장
		Map<String, String> addrDoMap = new HashMap<>();
		
		for(CompanyVO vo : list) {
			addrDoMap.put(vo.getDo_kor(), vo.getDo_kor());
		}
			
		return addrDoMap;
	}
	
	@RequestMapping("testPage.do")
	public String test() {
		return "test.page";
	}
	
	@RequestMapping("testPart.do")
	public String testPart() {
		return "test.part";
	}
	
}
