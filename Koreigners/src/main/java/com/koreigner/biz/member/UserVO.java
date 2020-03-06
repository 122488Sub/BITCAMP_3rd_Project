package com.koreigner.biz.member;

import java.util.Date;

public class UserVO {
	private int mem_idx;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_nick;
	private String mem_cate;
	private String mem_phone;
	private String mem_birth;
	private String mem_gender;
	private Date mem_image;
	private String mem_address;
	private String mem_nationality;
	private String mem_reg_ip;
	private Date mem_reg_dt;
	private Date mem_mod_dt;
	private Date mem_last_login;
	private String mem_leave_fl;
	private Date mem_leave_dt;
	private String mailling_fl;
	private String sms_fl;
	
	//이메일 인증 권한 업데이트
	private String auth_status;
	
	//JWT
	private String secretKey;
	
	
	public UserVO() {
		super();
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
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

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_cate() {
		return mem_cate;
	}

	public void setMem_cate(String mem_cate) {
		this.mem_cate = mem_cate;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public Date getMem_image() {
		return mem_image;
	}

	public void setMem_image(Date mem_image) {
		this.mem_image = mem_image;
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public String getMem_nationality() {
		return mem_nationality;
	}

	public void setMem_nationality(String mem_nationality) {
		this.mem_nationality = mem_nationality;
	}

	public String getMem_reg_ip() {
		return mem_reg_ip;
	}

	public void setMem_reg_ip(String mem_reg_ip) {
		this.mem_reg_ip = mem_reg_ip;
	}

	public Date getMem_reg_dt() {
		return mem_reg_dt;
	}

	public void setMem_reg_dt(Date mem_reg_dt) {
		this.mem_reg_dt = mem_reg_dt;
	}

	public Date getMem_mod_dt() {
		return mem_mod_dt;
	}

	public void setMem_mod_dt(Date mem_mod_dt) {
		this.mem_mod_dt = mem_mod_dt;
	}

	public Date getMem_last_login() {
		return mem_last_login;
	}

	public void setMem_last_login(Date mem_last_login) {
		this.mem_last_login = mem_last_login;
	}

	public String getMem_leave_fl() {
		return mem_leave_fl;
	}

	public void setMem_leave_fl(String mem_leave_fl) {
		this.mem_leave_fl = mem_leave_fl;
	}

	public Date getMem_leave_dt() {
		return mem_leave_dt;
	}

	public void setMem_leave_dt(Date mem_leave_dt) {
		this.mem_leave_dt = mem_leave_dt;
	}

	public String getMailling_fl() {
		return mailling_fl;
	}

	public void setMailling_fl(String mailling_fl) {
		this.mailling_fl = mailling_fl;
	}

	public String getSms_fl() {
		return sms_fl;
	}

	public void setSms_fl(String sms_fl) {
		this.sms_fl = sms_fl;
	}

	public String getSecretKey() {
		return secretKey;
	}

	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}

	public String getAuth_status() {
		return auth_status;
	}

	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}
	
	@Override
	public String toString() {
		return "UserVO [mem_idx=" + mem_idx + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", mem_nick=" + mem_nick + ", mem_cate=" + mem_cate + ", mem_phone=" + mem_phone + ", mem_birth="
				+ mem_birth + ", mem_gender=" + mem_gender + ", mem_image=" + mem_image + ", mem_address=" + mem_address
				+ ", mem_nationality=" + mem_nationality + ", mem_reg_ip=" + mem_reg_ip + ", mem_reg_dt=" + mem_reg_dt
				+ ", mem_mod_dt=" + mem_mod_dt + ", mem_last_login=" + mem_last_login + ", mem_leave_fl=" + mem_leave_fl
				+ ", mem_leave_dt=" + mem_leave_dt + ", mailling_fl=" + mailling_fl + ", sms_fl=" + sms_fl
				+ ", auth_status=" + auth_status + "]";
	}


	
	

	
}
