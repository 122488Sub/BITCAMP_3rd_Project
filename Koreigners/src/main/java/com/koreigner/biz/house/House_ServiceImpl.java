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
	public List<HouseAll_VO> getAllList() {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getAllList();
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
		path = path.substring(1, path.indexOf(".metadata")) + "Koreigners/src/main/webapp/WEB-INF/views/house/upload/";
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

}
