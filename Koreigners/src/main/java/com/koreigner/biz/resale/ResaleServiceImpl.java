package com.koreigner.biz.resale;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public int resaleTotal() {
		int cnt = resaleDAO.resaleTotal();
		return cnt;
	}
	
	@Override
	public List<ResaleVO> getResaleList(Map<String, Integer> map) {
		List<ResaleVO> list = resaleDAO.getResaleList(map);
		return list;
	}
	
	@Override
	public List<ResaleImgVO> getResaleImgList(Map<String, Integer> map) {
		List<ResaleImgVO> list = resaleDAO.getResaleImgList(map);
		return list;
	}
	
	@Override
	public ResaleVO getRsDetail(int rs_idx) {
		ResaleVO rsVO = resaleDAO.getRsDetail(rs_idx);
		return rsVO;
	}
	
	@Override
	public List<ResaleImgVO> resaleDetailImg(int rs_idx) {
		List<ResaleImgVO> imgList = resaleDAO.resaleDetailImg(rs_idx);
		return imgList;
	}
}
