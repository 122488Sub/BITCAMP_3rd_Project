package com.koreigner.biz.resale;

import java.sql.Date;

public class ResaleCommVO {
 int rs_idx, c_idx, groups, step, lev;
 String mem_id, mem_pw, mem_name, content, ip;
 Date write_date, regdate;
 
 
 	public ResaleCommVO() {}

	
	public int getRs_idx() {
		return rs_idx;
	}
	
	
	public void setRs_idx(int rs_idx) {
		this.rs_idx = rs_idx;
	}
	
	
	public int getC_idx() {
		return c_idx;
	}
	
	
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	
	
	public int getGroups() {
		return groups;
	}
	
	
	public void setGroups(int groups) {
		this.groups = groups;
	}
	
	
	public int getStep() {
		return step;
	}
	
	
	public void setStep(int step) {
		this.step = step;
	}
	
	
	public int getLev() {
		return lev;
	}
	
	
	public void setLev(int lev) {
		this.lev = lev;
	}
	
	
	public String getMem_id() {
		return mem_id;
	}
	
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	public String getMem_pw() {
		return mem_pw;
	}
	
	
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	
	
	public String getMem_name() {
		return mem_name;
	}
	
	
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	
	public String getContent() {
		return content;
	}
	
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getIp() {
		return ip;
	}
	
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	public Date getWrite_date() {
		return write_date;
	}
	
	
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	public Date getRegdate() {
		return regdate;
	}
	
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "ResaleCommVO [rs_idx=" + rs_idx + ", c_idx=" + c_idx + ", groups=" + groups + ", step=" + step + ", lev="
				+ lev + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", content=" + content
				+ ", ip=" + ip + ", write_date=" + write_date + ", regdate=" + regdate + "]";
	}
	 

 
}
