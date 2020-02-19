package com.koreigner.biz.inform;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

@XmlAccessorType(XmlAccessType.FIELD)
public class InfoBoardVO {
	/*
INFO_IDX
INFO_TITLE
INFO_CONTENT
INFO_HIT
INFO_INS_DT
INFO_INS_USER
INFO_UPD_DT
INFO_UPD_USER
INFO_CATEGORY
INFO_FILENAME
INFO_FILENAME_ORI
INFO_IP
	 */
	@XmlAttribute
	private int info_idx;
	private String info_title;
	private String info_content;
	private int info_hit;
	private Date info_ins_dt;
	private String info_ins_user;
	private Date info_upd_dt;
	private String info_upd_user;
	private String info_category;//게시판 내 분류(카테고리)
	private String info_filename;
	private String info_filename_ori;
	private String info_ip;
	private String info_board_idx;//전체 게시판 분류
	//좋아요 추가해야함
	
	//검색조건용 필드 추가
	@XmlTransient //XML 변환 제외 처리
	private String searchCondition;
	@XmlTransient //XML 변환 제외 처리
	private String searchKeyword;
	
	//파일업로드
	@XmlTransient //XML 변환 제외 처리
	private MultipartFile uploadFile;
	

	public InfoBoardVO(int info_idx) {
		super();
		this.info_idx = info_idx;
	}
	
		public InfoBoardVO(int info_idx, String info_title, String info_content, int info_hit, Date info_ins_dt,
			String info_ins_user, Date info_upd_dt, String info_upd_user, String info_category, String info_filename,
			String info_filename_ori, String info_ip,String info_board_idx) {
		super();
		this.info_idx = info_idx;
		this.info_title = info_title;
		this.info_content = info_content;
		this.info_hit = info_hit;
		this.info_ins_dt = info_ins_dt;
		this.info_ins_user = info_ins_user;
		this.info_upd_dt = info_upd_dt;
		this.info_upd_user = info_upd_user;
		this.info_category = info_category;
		this.info_filename = info_filename;
		this.info_filename_ori = info_filename_ori;
		this.info_ip = info_ip;
		this.info_board_idx =info_board_idx;
	}




	public InfoBoardVO() {
			// TODO Auto-generated constructor stub
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


	public Date getInfo_ins_dt() {
		return info_ins_dt;
	}


	public void setInfo_ins_dt(Date info_ins_dt) {
		this.info_ins_dt = info_ins_dt;
	}


	public String getInfo_ins_user() {
		return info_ins_user;
	}


	public void setInfo_ins_user(String info_ins_user) {
		this.info_ins_user = info_ins_user;
	}


	public Date getInfo_upd_dt() {
		return info_upd_dt;
	}


	public void setInfo_upd_dt(Date info_upd_dt) {
		this.info_upd_dt = info_upd_dt;
	}


	public String getInfo_upd_user() {
		return info_upd_user;
	}


	public void setInfo_upd_user(String info_upd_user) {
		this.info_upd_user = info_upd_user;
	}


	public String getInfo_category() {
		return info_category;
	}


	public void setInfo_category(String info_category) {
		this.info_category = info_category;
	}


	public String getInfo_filename() {
		return info_filename;
	}


	public void setInfo_filename(String info_filename) {
		this.info_filename = info_filename;
	}


	public String getInfo_filename_ori() {
		return info_filename_ori;
	}


	public void setInfo_filename_ori(String info_filename_ori) {
		this.info_filename_ori = info_filename_ori;
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

	@Override
	public String toString() {
		return "InfoBoardVO [info_idx=" + info_idx + ", info_title=" + info_title + ", info_content=" + info_content
				+ ", info_hit=" + info_hit + ", info_ins_dt=" + info_ins_dt + ", info_ins_user=" + info_ins_user
				+ ", info_upd_dt=" + info_upd_dt + ", info_upd_user=" + info_upd_user + ", info_category="
				+ info_category + ", info_filename=" + info_filename + ", info_filename_ori=" + info_filename_ori
				+ ", info_ip=" + info_ip + ", info_board_idx=" + info_board_idx + "]";
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

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	
	
	
}
