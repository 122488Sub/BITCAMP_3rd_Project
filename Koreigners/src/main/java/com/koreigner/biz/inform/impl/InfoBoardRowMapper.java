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
		infoBoard.setInfo_category(rs.getString("info_category"));
		infoBoard.setInfo_ins_user(rs.getString("info_ins_user"));
		infoBoard.setInfo_title(rs.getString("info_title"));
		infoBoard.setInfo_ins_dt(rs.getDate("info_ins_dt"));
		infoBoard.setInfo_hit(rs.getInt("info_hit"));
		
		return infoBoard;
	}

}
