package com.koreigner.biz.resale;

import java.util.List;

import com.koreigner.biz.member.UserVO;

public interface ResaleService {
	UserVO getUser(String mem_id);
	void writeRs(ResaleVO rsVO);
	void writeImg(List<String> originFileList, List<String> saveFileList);
	
}
