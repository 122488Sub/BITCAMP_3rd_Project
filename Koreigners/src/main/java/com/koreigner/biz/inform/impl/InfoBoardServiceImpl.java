package com.koreigner.biz.inform.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.inform.InfoBoardService;
import com.koreigner.biz.inform.InfoBoardVO;

@Service("infoBoardService")
public class InfoBoardServiceImpl implements InfoBoardService {

	@Autowired
	private InfoBoardDAO infoBoardDAO;
	
	public InfoBoardServiceImpl() {
		System.out.println(">> InfoBoardServiceImpl() 실행");	
	}

	@Override
	public void insertInfoBoard(InfoBoardVO vo) {
		infoBoardDAO.insertInfoBoard(vo);		
	}

	@Override
	public void updateInfoBoard(InfoBoardVO vo) {
		infoBoardDAO.updateInfoBoard(vo);		
	}

	@Override
	public void deleteInfoBoard(InfoBoardVO vo) {
		infoBoardDAO.deleteInfoBoard(vo);		
	}

	@Override
	public InfoBoardVO getInfoBoard(InfoBoardVO vo) {
		return infoBoardDAO.getInfoBoard(vo);
	}

	@Override
	public List<InfoBoardVO> getInfoBoardList() {
		return infoBoardDAO.getBoardInfoList();
	}

	@Override
	public List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo) {
		return infoBoardDAO.getInfoBoardList(vo);
	}

	
	

}
