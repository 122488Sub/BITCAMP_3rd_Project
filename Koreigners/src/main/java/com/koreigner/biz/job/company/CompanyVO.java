package com.koreigner.biz.job.company;

import java.util.Date;

public class CompanyVO {
	private int company_idx, employee_num; 
	private String mem_id, ceo_name, company_name, company_cate, hr_manager, 
	               do_en, gu_gun_eup_eng, address, business_num, business_img, 
	               business_info, domitory, meals, company_telephone, ip, manager_email;  
	private Date regdate;
	
	
	//카테고리 변수
	private int cate_idx;
	private String cate_kor, cate_prnt,  cate_child, cate_child_ko;
	
	//지역 변수
	private String do_kor, gu_gun_eup_kor;
	
	
	public CompanyVO() {}

	

	public String getDo_kor() {
		return do_kor;
	}


	public void setDo_kor(String do_kor) {
		this.do_kor = do_kor;
	}

	public String getGu_gun_eup_kor() {
		return gu_gun_eup_kor;
	}


	public void setGu_gun_eup_kor(String gu_gun_eup_kor) {
		this.gu_gun_eup_kor = gu_gun_eup_kor;
	}



	public int getCate_idx() {
		return cate_idx;
	}


	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}


	public String getCate_child_ko() {
		return cate_child_ko;
	}


	public void setCate_child_ko(String cate_child_ko) {
		this.cate_child_ko = cate_child_ko;
	}


	public String getCate_kor() {
		return cate_kor;
	}


	public void setCate_kor(String cate_kor) {
		this.cate_kor = cate_kor;
	}


	public String getCate_prnt() {
		return cate_prnt;
	}


	public void setCate_prnt(String cate_prnt) {
		this.cate_prnt = cate_prnt;
	}


	public String getCate_child() {
		return cate_child;
	}


	public void setCate_child(String cate_child) {
		this.cate_child = cate_child;
	}


	public int getCompany_idx() {
		return company_idx;
	}


	public void setCompany_idx(int company_idx) {
		this.company_idx = company_idx;
	}


	public int getEmployee_num() {
		return employee_num;
	}


	public void setEmployee_num(int employee_num) {
		this.employee_num = employee_num;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getCeo_name() {
		return ceo_name;
	}


	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}


	public String getCompany_name() {
		return company_name;
	}


	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}


	public String getCompany_cate() {
		return company_cate;
	}


	public void setCompany_cate(String company_cate) {
		this.company_cate = company_cate;
	}


	public String getHr_manager() {
		return hr_manager;
	}


	public void setHr_manager(String hr_manager) {
		this.hr_manager = hr_manager;
	}


	public String getDo_en() {
		return do_en;
	}


	public void setDo_en(String do_en) {
		this.do_en = do_en;
	}


	public String getGu_gun_eup_eng() {
		return gu_gun_eup_eng;
	}


	public void setGu_gun_eup_eng(String gu_gun_eup_eng) {
		this.gu_gun_eup_eng = gu_gun_eup_eng;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getBusiness_num() {
		return business_num;
	}


	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}


	public String getBusiness_img() {
		return business_img;
	}


	public void setBusiness_img(String business_img) {
		this.business_img = business_img;
	}


	public String getBusiness_info() {
		return business_info;
	}


	public void setBusiness_info(String business_info) {
		this.business_info = business_info;
	}


	public String getDomitory() {
		return domitory;
	}


	public void setDomitory(String domitory) {
		this.domitory = domitory;
	}


	public String getMeals() {
		return meals;
	}


	public void setMeals(String meals) {
		this.meals = meals;
	}


	public String getCompany_telephone() {
		return company_telephone;
	}


	public void setCompany_telephone(String company_telephone) {
		this.company_telephone = company_telephone;
	}


	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public String getManager_email() {
		return manager_email;
	}


	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "CompanyVO [company_idx=" + company_idx + ", employee_num=" + employee_num + ", mem_id=" + mem_id
				+ ", ceo_name=" + ceo_name + ", company_name=" + company_name + ", company_cate=" + company_cate
				+ ", hr_manager=" + hr_manager + ", do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng
				+ ", address=" + address + ", business_num=" + business_num + ", business_img=" + business_img
				+ ", business_info=" + business_info + ", domitory=" + domitory + ", meals=" + meals
				+ ", company_telephone=" + company_telephone + ", ip=" + ip + ", manager_email=" + manager_email
				+ ", regdate=" + regdate + "]";
	}

	

		
	
}
