package com.koreigner.biz.member.mypage;

import java.util.Date;

public class p_MyPageVO {
	private int wish_idx;
	private String mem_id;
	private int board_idx;
	private int b_idx;
	private Date regdate;
	
	private int begin;
	private int end;
	
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
	public int getWish_idx() {
		return wish_idx;
	}
	public void setWish_idx(int wish_idx) {
		this.wish_idx = wish_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public p_MyPageVO() {
	
	}
	public p_MyPageVO(int wish_idx, String mem_id, int board_idx, int b_idx, Date regdate) {
		super();
		this.wish_idx = wish_idx;
		this.mem_id = mem_id;
		this.board_idx = board_idx;
		this.b_idx = b_idx;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "wishVO [wish_idx=" + wish_idx + ", mem_id=" + mem_id + ", board_idx=" + board_idx + ", b_idx=" + b_idx
				+ ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
}
