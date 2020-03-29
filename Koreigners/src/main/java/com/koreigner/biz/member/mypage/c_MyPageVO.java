package com.koreigner.biz.member.mypage;

import java.util.Date;

public class c_MyPageVO {
	private String category;
	private String mem_id;
	private int apply_idx;
	private int company_idx;
	private int hire_idx;
	private int resume_idx;
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
	
	
	
	public c_MyPageVO(String category, String mem_id, int apply_idx, int company_idx, int hire_idx, int resume_idx,
			Date regdate) {
		super();
		this.category = category;
		this.mem_id = mem_id;
		this.apply_idx = apply_idx;
		this.company_idx = company_idx;
		this.hire_idx = hire_idx;
		this.resume_idx = resume_idx;
		this.regdate = regdate;
	}
	public c_MyPageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getApply_idx() {
		return apply_idx;
	}
	public void setApply_idx(int apply_idx) {
		this.apply_idx = apply_idx;
	}
	public int getCompany_idx() {
		return company_idx;
	}
	public void setCompany_idx(int company_idx) {
		this.company_idx = company_idx;
	}
	public int getHire_idx() {
		return hire_idx;
	}
	public void setHire_idx(int hire_idx) {
		this.hire_idx = hire_idx;
	}
	public int getResume_idx() {
		return resume_idx;
	}
	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "c_MyPageVO [category=" + category + ", mem_id=" + mem_id + ", apply_idx=" + apply_idx + ", company_idx="
				+ company_idx + ", hire_idx=" + hire_idx + ", resume_idx=" + resume_idx + ", regdate=" + regdate + "]";
	}
	
	
	
}
