package com.koreigner.biz.inform;

import java.util.List;
import java.util.Map;

public interface InformService {

	int informSearchTotal(InformVO informVO);
  /*
	void insertInfoBoard(InfoBoardVO vo);
	void updateInfoBoard(InfoBoardVO vo);
	void deleteInfoBoard(InfoBoardVO vo);
	InfoBoardVO getInfoBoard(InfoBoardVO vo);
	List<InfoBoardVO> getInfoBoardList();
	List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo);*/

	List<Map<String, Object>> getSelectSearchList(InformVO informVO);

	boolean nioFileCopy(String inFileName, String outFileName);

	int insertInform(InformVO informVO);

	InformVO getInform(int info_idx);

	int updateInform(InformVO informVO);

	int increaseHit(int info_idx);

	int deleteInform(int info_idx);
	
}
