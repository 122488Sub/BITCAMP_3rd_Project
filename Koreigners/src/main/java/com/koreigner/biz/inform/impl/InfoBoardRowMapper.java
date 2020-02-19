package com.koreigner.biz.inform.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.koreigner.biz.inform.InfoBoardVO;


public class InfoBoardRowMapper implements RowMapper<InfoBoardVO>{

	@Override
	public InfoBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		InfoBoardVO infoBoard = new InfoBoardVO();
		infoBoard.setInfo_idx(rs.getInt("info_idx"));
		//infoBoard.setInfo_category(rs.getString("info_category"));
		infoBoard.setInfo_title(rs.getString("INFO_TITLE"));
		infoBoard.setInfo_ins_user(rs.getString("INFO_INS_USER"));
		infoBoard.setInfo_content("INFO_CONTENT");
		infoBoard.setInfo_ins_dt(rs.getDate("INFO_INS_DT"));
		infoBoard.setInfo_hit(rs.getInt("INFO_HIT"));
		//추천수추가
		return infoBoard;
	}

}
