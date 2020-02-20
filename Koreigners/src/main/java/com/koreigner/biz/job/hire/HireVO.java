package com.koreigner.biz.job.hire;

import java.util.Date;

public class HireVO {
	int hire_idx; 
	int company_idx; 
	int salary_min;
	int salary_max;
	int hire_number;
	int hire_age_min;
	int hire_age_max;
	String mem_id;
	String work_type;
	String title;
	String do_en;
	String gu_gun_eup_eng;
	String address;
	String payment_detail;
	String payment_codition;
	String education;
	String experience;
	String major;
	String prefer_skills;
	String foreign_language;
	String domitory;
	String meals;
	String work_detail;
	String insurance;
	String apply_way;
	String b_status;
	String prepare_doc;
	String work_time;
	String category;
	String category_child;
	String ip;
	Date regdate;
	
	public HireVO() {}
	
	public int getHire_idx() {
		return hire_idx;
	}
	public void setHire_idx(int hire_idx) {
		this.hire_idx = hire_idx;
	}
	public int getCompany_idx() {
		return company_idx;
	}
	public void setCompany_idx(int company_idx) {
		this.company_idx = company_idx;
	}
	public int getSalary_min() {
		return salary_min;
	}
	public void setSalary_min(int salary_min) {
		this.salary_min = salary_min;
	}
	public int getSalary_max() {
		return salary_max;
	}
	public void setSalary_max(int salary_max) {
		this.salary_max = salary_max;
	}
	public int getHire_number() {
		return hire_number;
	}
	public void setHire_number(int hire_number) {
		this.hire_number = hire_number;
	}
	public int getHire_age_min() {
		return hire_age_min;
	}
	public void setHire_age_min(int hire_age_min) {
		this.hire_age_min = hire_age_min;
	}
	public int getHire_age_max() {
		return hire_age_max;
	}
	public void setHire_age_max(int hire_age_max) {
		this.hire_age_max = hire_age_max;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getPayment_detail() {
		return payment_detail;
	}
	public void setPayment_detail(String payment_detail) {
		this.payment_detail = payment_detail;
	}
	public String getPayment_codition() {
		return payment_codition;
	}
	public void setPayment_codition(String payment_codition) {
		this.payment_codition = payment_codition;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPrefer_skills() {
		return prefer_skills;
	}
	public void setPrefer_skills(String prefer_skills) {
		this.prefer_skills = prefer_skills;
	}
	public String getForeign_language() {
		return foreign_language;
	}
	public void setForeign_language(String foreign_language) {
		this.foreign_language = foreign_language;
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
	public String getWork_detail() {
		return work_detail;
	}
	public void setWork_detail(String work_detail) {
		this.work_detail = work_detail;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getApply_way() {
		return apply_way;
	}
	public void setApply_way(String apply_way) {
		this.apply_way = apply_way;
	}
	public String getB_status() {
		return b_status;
	}
	public void setB_status(String b_status) {
		this.b_status = b_status;
	}
	public String getPrepare_doc() {
		return prepare_doc;
	}
	public void setPrepare_doc(String prepare_doc) {
		this.prepare_doc = prepare_doc;
	}
	public String getWork_time() {
		return work_time;
	}
	public void setWork_time(String work_time) {
		this.work_time = work_time;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategory_child() {
		return category_child;
	}
	public void setCategory_child(String category_child) {
		this.category_child = category_child;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "HireVO [hire_idx=" + hire_idx + ", company_idx=" + company_idx + ", salary_min=" + salary_min
				+ ", salary_max=" + salary_max + ", hire_number=" + hire_number + ", hire_age_min=" + hire_age_min
				+ ", hire_age_max=" + hire_age_max + ", mem_id=" + mem_id + ", work_type=" + work_type + ", title="
				+ title + ", do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address=" + address
				+ ", payment_detail=" + payment_detail + ", payment_codition=" + payment_codition + ", education="
				+ education + ", experience=" + experience + ", major=" + major + ", prefer_skills=" + prefer_skills
				+ ", foreign_language=" + foreign_language + ", domitory=" + domitory + ", meals=" + meals
				+ ", work_detail=" + work_detail + ", insurance=" + insurance + ", apply_way=" + apply_way
				+ ", b_status=" + b_status + ", prepare_doc=" + prepare_doc + ", work_time=" + work_time + ", category="
				+ category + ", category_child=" + category_child + ", ip=" + ip + ", regdate=" + regdate + "]";
	}
	
}
