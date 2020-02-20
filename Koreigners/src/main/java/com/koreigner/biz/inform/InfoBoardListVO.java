package com.koreigner.biz.inform;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="infoBoardList")
@XmlAccessorType(XmlAccessType.FIELD) 
public class InfoBoardListVO {
	@XmlElement(name="infoBoard") 
	private List<InfoBoardVO> infoBoardList;

	public List<InfoBoardVO> getBoardList() {
		return infoBoardList;
	}

	public void setBoardList(List<InfoBoardVO> infoBoardList) {
		this.infoBoardList = infoBoardList;
	}
}
