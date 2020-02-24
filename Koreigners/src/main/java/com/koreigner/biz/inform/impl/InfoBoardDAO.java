package com.koreigner.biz.inform.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.inform.InfoBoardVO;

@Repository("InfoBoardDAO")
public class InfoBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	
	public InfoBoardDAO() {
		System.out.println(">> InfoBoardDAO 객체 생성");
	}


	//글입력
	public void insertInfoBoard(InfoBoardVO vo) {
		System.out.println("===> MyBatis로 insertInfoBoard() 실행");
		mybatis.insert("InfoBoardDAO.insertInfoBoard",vo);
	}

	//글삭제
	public void deleteInfoBoard(InfoBoardVO vo) {
		System.out.println("===> MyBatis로 deleteInfoBoard() 실행");
		mybatis.delete("InfoBoardDAO.deleteInfoBoard",vo);
		
	}

	//글수정
	public void updateInfoBoard(InfoBoardVO vo) {
		System.out.println("===> MyBatis로 updateInfoBoard() 실행");
		mybatis.update("InfoBoardDAO.updateInfoBoard",vo);
		
	}

	//글 상세조회
	public InfoBoardVO getInfoBoard(InfoBoardVO vo) {
		System.out.println("===> MyBatis로 getInfoBoard() 실행");
		return mybatis.selectOne("InfoBoardDAO.getInfoBoard", vo);
	}



	
	//리스트 전체조회
	public List<InfoBoardVO> getBoardInfoList() {
		System.out.println("===> MyBatis로 getBoardInfoList() 실행");
		List<InfoBoardVO> list = mybatis.selectList("InfoBoardDAO.getBoardInfoList");
		return list;
	}
	
	//검색조건 적용조회
	public List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo) {
		System.out.println("===> MyBatis로 getInfoBoardList() 실행");
		
		return mybatis.selectList("InfoBoardDAO.getInfoBoardList", vo);
	}

	

	
	
}
