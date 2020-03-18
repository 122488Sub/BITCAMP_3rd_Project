package com.koreigner.biz.resale;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.member.UserVO;
@Repository
public class ResaleDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	UserVO getUser(String mem_id){
		UserVO vo = mybatis.selectOne("getRsUser", mem_id);
		return vo;
	}
	
	void writeImg(List<String> originFileList, List<String> saveFileList) {
		int cnt = 0;
		int insertImg=0;
		for (String origin : originFileList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("originFile", origin);
			map.put("saveFile", saveFileList.get(cnt));
			cnt++;
			
			insertImg = mybatis.insert("writeImg", map);
		}
	}
	
	void writeRs(ResaleVO rsVO) {
		mybatis.insert("writeRs", rsVO);
		
	}
	
	int resaleTotal() {
		int cnt = mybatis.selectOne("resaleTotal");
		return cnt;
	}
	
	List<ResaleVO> getResaleList(Map<String, Integer> map){
		List<ResaleVO> list = mybatis.selectList("getResaleList", map);
		return list;
		
	}
	
	List<ResaleImgVO> getResaleImgList(Map<String, Integer> map){
		List<ResaleImgVO> list = mybatis.selectList("getResaleImgList", map);
		return list;
		
	}
	
	ResaleVO getRsDetail(int rs_idx) {
		ResaleVO rsVO = mybatis.selectOne("getRsDetail", rs_idx);
		return rsVO;
	}
	
	List<ResaleImgVO> resaleDetailImg(int rs_idx) {
		List<ResaleImgVO> imgList = mybatis.selectList("resaleDetailImg", rs_idx);
		return imgList;
	}
	
	void insertComm(ResaleCommVO commVO) {
		mybatis.insert("insertComm",commVO);
		
	}
	
	List<ResaleCommVO> resaleCommList(int rs_idx) {
		System.out.println("rs_idx : ===================================" + rs_idx);
		List<ResaleCommVO> c_list = mybatis.selectList("resaleCommList", rs_idx);
		System.out.println("c_list DAO : =======================================" + c_list);
		return c_list;
	}
	
	void deleteResale(int rs_idx) {
		mybatis.delete("deleteResale", rs_idx);
		
	}
}
