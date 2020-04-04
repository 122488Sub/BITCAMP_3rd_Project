package com.koreigner.biz.inform;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

@XmlAccessorType(XmlAccessType.FIELD)
public class InformVO {

	@XmlAttribute
	private int info_idx;
	private String info_title;
	private String info_content;
	private int info_hit;
	private String info_ins_dt;
	private String info_mem_id;
	private String info_upd_dt;
	
	private String info_category;//게시판 내 분류(카테고리)
	
	private String info_ip;
	private String info_board_idx;//전체 게시판 분류
	
	private String info_file_name;
	//좋아요 추가해야함
	
	//검색조건용 필드 추가
	@XmlTransient //XML 변환 제외 처리
	private String searchCondition;
	@XmlTransient //XML 변환 제외 처리
	private String searchKeyword;
	
	
	private int begin;
	private int end;
	
	public InformVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InformVO(int info_idx, String info_title, String info_content, int info_hit, String info_ins_dt,
			String info_mem_id, String info_upd_dt, String info_category, String info_ip, String info_board_idx,
			String searchCondition, String searchKeyword, int begin, int end) {
		super();
		this.info_idx = info_idx;
		this.info_title = info_title;
		this.info_content = info_content;
		this.info_hit = info_hit;
		this.info_ins_dt = info_ins_dt;
		this.info_mem_id = info_mem_id;
		this.info_upd_dt = info_upd_dt;
		this.info_category = info_category;
		this.info_ip = info_ip;
		this.info_board_idx = info_board_idx;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
		this.begin = begin;
		this.end = end;
	}

	public int getInfo_idx() {
		return info_idx;
	}

	public void setInfo_idx(int info_idx) {
		this.info_idx = info_idx;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}

	public int getInfo_hit() {
		return info_hit;
	}

	public void setInfo_hit(int info_hit) {
		this.info_hit = info_hit;
	}

	public String getInfo_ins_dt() {
		return info_ins_dt;
	}

	public void setInfo_ins_dt(String info_ins_dt) {
		this.info_ins_dt = info_ins_dt;
	}

	public String getInfo_mem_id() {
		return info_mem_id;
	}

	public void setInfo_mem_id(String info_mem_id) {
		this.info_mem_id = info_mem_id;
	}

	public String getInfo_upd_dt() {
		return info_upd_dt;
	}

	public void setInfo_upd_dt(String info_upd_dt) {
		this.info_upd_dt = info_upd_dt;
	}

	public String getInfo_category() {
		return info_category;
	}

	public void setInfo_category(String info_category) {
		this.info_category = info_category;
	}

	public String getInfo_ip() {
		return info_ip;
	}

	public void setInfo_ip(String info_ip) {
		this.info_ip = info_ip;
	}

	public String getInfo_board_idx() {
		return info_board_idx;
	}

	public void setInfo_board_idx(String info_board_idx) {
		this.info_board_idx = info_board_idx;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getInfo_file_name() {
		return info_file_name;
	}

	public void setInfo_file_name(String info_file_name) {
		this.info_file_name = info_file_name;
	}

	@Override
	public String toString() {
		return "InformVO [info_idx=" + info_idx + ", info_title=" + info_title + ", info_content=" + info_content
				+ ", info_hit=" + info_hit + ", info_ins_dt=" + info_ins_dt + ", info_mem_id=" + info_mem_id
				+ ", info_upd_dt=" + info_upd_dt + ", info_category=" + info_category + ", info_ip=" + info_ip
				+ ", info_board_idx=" + info_board_idx + ", info_file_name=" + info_file_name + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", begin=" + begin + ", end=" + end + "]";
	}

	
	
	
	
	
	
	
}
