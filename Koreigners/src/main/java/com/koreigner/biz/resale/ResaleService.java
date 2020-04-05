package com.koreigner.biz.resale;

import java.util.List;
import java.util.Map;

import com.koreigner.biz.member.UserVO;

public interface ResaleService {
	UserVO getUser(String mem_id);
	void writeRs(ResaleVO rsVO);
	void writeImg(List<String> originFileList, List<String> saveFileList);
	int resaleTotal();
	List<ResaleVO> getResaleList(Map<String, Integer> map);
	List<ResaleImgVO> getResaleImgList(Map<String, Integer> map);
	ResaleVO getRsDetail(int rs_idx);
	List<ResaleImgVO> resaleDetailImg(int rs_idx);
	void insertComm(ResaleCommVO commVO);
	List<ResaleCommVO> resaleCommList(int rs_idx);
	void deleteResale(int rs_idx);
	
	List<Map<String, Object>> resaleWish(String mem_id);
	int resaleSearchTotal(ResaleVO resaleVO);
	List<Map<String, Object>> getSelectSearchList(ResaleVO resaleVO);
	List<Map<String, Object>> getResaleCategoryCount(ResaleVO resaleVO);
}
