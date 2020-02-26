package com.koreigner.biz.house;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
	public List<HouseAll_VO> getSiList(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getSiList_vo(vo);
	}


	@Override
	public List<HouseAll_VO> getDoList(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getDoList_vo(vo);
	}



	@Override
	public List<HouseAll_VO> getAllList() {
		// TODO Auto-generated method stub
		return testDAO.myBatis_getAllList_vo();
	}




	@Override
	public HouseAll_VO getHouse(HouseAll_VO vo) {
		// TODO Auto-generated method stub
		System.out.println("impl vo"+vo);
		return testDAO.myBatis_getHouse_vo(vo);
	}




	@Override
	public int insertNewHouse(HouseAll_VO vo) {
		// System.out.println(vo.getAvailable_date());
		String path = this.getClass().getResource("").getPath();
		path = path.substring(1, path.indexOf(".metadata")) + "Koreigners/src/main/webapp/WEB-INF/views/house/upload/";
		// System.out.println(path);//workspace가 BITCAMP_3rd_Project일 경우

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		String fileName = "";
		String fileOriName = "";
		List<String> fileOriList = new ArrayList<>();
		List<String> fileList = new ArrayList<>();
		int i = 1;
		for (MultipartFile file : vo.getFile()) {
			if (file.isEmpty()) {
				System.out.println("zz");
				break;
			}
			fileOriName = file.getOriginalFilename();
			fileOriList.add(fileOriName);
			System.out.println("실제 파일 이름 : " + fileOriName);

			fileName = "house_" + vo.getMem_email() + fileOriName;
			try {
				file.transferTo(new File(path + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		vo.setRoom_img_nameArr(fileList);
		vo.setRoom_img_ori_nameArr(fileOriList);
		return testDAO.myBatis_insertNewHouse(vo);
	}

}
