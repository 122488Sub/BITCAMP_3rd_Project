package com.koreigner.biz.resale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.member.UserVO;

@Service
public class ResaleServiceImpl implements ResaleService{
	@Autowired
	private ResaleDAO resaleDAO;
	
	@Override
	public UserVO getUser(String mem_id) {
		UserVO vo = resaleDAO.getUser(mem_id);
		return vo;
	}
	@Override
	public void writeImg(List<String> originFileList, List<String> saveFileList) {
		resaleDAO.writeImg(originFileList, saveFileList);
		
	}
	
	@Override
	public void writeRs(ResaleVO rsVO) {
		resaleDAO.writeRs(rsVO);
		
	}
}
