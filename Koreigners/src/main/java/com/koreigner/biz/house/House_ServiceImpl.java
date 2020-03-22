package com.koreigner.biz.house;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreigner.biz.common.page.PagingVO;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("houseService")
public class House_ServiceImpl implements House_Service {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private House_DAOMyBatis testDAO;
	
	public House_ServiceImpl() {
		System.out.println(">> Room_ServiceImpl() 실행");
	}

	
	


	@Override
	public List<HouseAll_VO> getSearchList(HouseSearch_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getSearchList(vo);
	}






	@Override
	public HouseAll_VO getHouse(int room_idx) {
		
		return testDAO.myBatis_getHouse(room_idx);
	}




	@Override
	public int insertNewHouse(HouseAll_VO vo) {
		
		//임시
		vo.setMem_email("임시");
		System.out.println(vo);
		
		// System.out.println(vo.getAvailable_date());
		String path = this.getClass().getResource("").getPath();
		path = path.substring(1, path.indexOf(".metadata")) + "Koreigners/src/main/webapp/resources/img/house/upload/";
		// System.out.println(path);//workspace가 BITCAMP_3rd_Project일 경우

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd_HHmmss");
		Date time = new Date();
		String sysTime = format1.format(time);
		System.out.println(sysTime);
		
	
		String fileName = "";
		String fileOriName = "";
		List<String> fileOriList = new ArrayList<>();
		List<String> fileList = new ArrayList<>();
		int i = 1;
		for (MultipartFile file : vo.getFile()) {
			if (file.isEmpty()) {
				System.out.println("파일없음");
				break;
			}
			fileOriName = file.getOriginalFilename();
			fileOriList.add(fileOriName);
			System.out.println("실제 파일 이름 : " + fileOriName);
			fileName = sysTime+"_"+ i++ +"."+FilenameUtils.getExtension(fileOriName);
			
			fileList.add(fileName+"/"+fileOriName+"/");
		}
		vo.setImg_nameList(fileList);
		vo.setImg_ori_nameList(fileOriList);
		testDAO.myBatis_insertNewHouse(vo);
		
		i=1;
		for (MultipartFile file : vo.getFile()) {
			if (file.isEmpty()) {
				System.out.println("파일없음");
				break;
			}
			fileOriName = file.getOriginalFilename();
			fileName = "house_"+testDAO.myBatis_getRoom_Sq()+"_" +sysTime+"_"+ i++ +"."+ FilenameUtils.getExtension(fileOriName);
			try {
				file.transferTo(new File(path + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return 1;
	}





	@Override
	public int getHouseTotal(HouseSearch_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getHouseTotal(vo);
		
	}
	
	@Override
	public String getHousePrice(int price) {
		
		return String.format("%,d", price);
	}
	
	
	@Override
	public String getHouseListJson(List<HouseAll_VO> list, PagingVO p) {
		System.out.println(p);
		for(HouseAll_VO v: list) {
		System.out.println(v);
		}
		
		String room_type = "", build_type = "";
		
		
		String result = "{";
		if(!list.isEmpty()) {
			result +=          "\"list\" : [";
			for(HouseAll_VO vo : list) {
				if(vo.getRoom_type()==0) room_type="Studio";
				else if(vo.getRoom_type()==1) room_type="Two";
				else if(vo.getRoom_type()==2) room_type="Three+";
				
				if(vo.getBuild_type()==0) build_type="Villa";
				else if(vo.getBuild_type()==1) build_type="Goshiwon";
				else if(vo.getBuild_type()==2) build_type="Semi-Officetel";
				
				
				result += "{";
				result += "\"room_idx\":\"" + vo.getRoom_idx() + "\","; 
				result += "\"subject\":\"" + vo.getSubject() + "\",";
				result += "\"build_type\":\"" + build_type + "\","; 
				result += "\"room_type\":\"" +room_type+ "\","; 
				result += "\"gu_gun_eup_eng\":\"" + vo.getGu_gun_eup_eng() + "\","; 
				result += "\"do_en\":\"" + vo.getDo_en() + "\","; 
				result += "\"deposit\":\"" + vo.getDeposit() + "\","; 
				result += "\"monthly_rent\":\"" + vo.getMonthly_rent() + "\","; 
				result += "\"address\":\"" + vo.getAddress() + "\","; 
				result += "\"room_reporting_date\":\"" + vo.getRoom_reporting_date() + "\""; 
				result += "},";
				
			}
			
			// {},{},{},{},{}, 형태로 저장 되므로 맨마지막 ,는 제거
			result = result.substring(0,result.length()-1);
			result +="],";
		}
		result += " \"pvo\" : {";
		result += "\"nowPage\" :"+ p.getNowPage() +","; 
		result += "\"nowBlock\":" + p.getNowBlock() + ","; 
		result += "\"pagePerBlock\":" + p.getPagePerBlock() + ","; 
		result += "\"totalRecord\":" + p.getTotalRecord() + ","; 
		result += "\"totalPage\":" + p.getTotalPage() + ","; 
		result += "\"totalBlock\":" + p.getTotalBlock() + ","; 
		result += "\"begin\":" + p.getBegin() + ","; 
		result += "\"end\":" + p.getEnd() + ","; 
		result += "\"beginPage\":" + p.getBeginPage() + ","; 
		result += "\"endPage\":" + p.getEndPage() +"}"; 
		result +="}";
		System.out.println(result);
		return result;
	}

	
	
	
	
}
