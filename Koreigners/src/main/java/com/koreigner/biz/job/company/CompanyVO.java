package com.koreigner.biz.job.company;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CompanyVO {
	private int company_idx, employee_num; 
	private String mem_id, mem_pw, ceo_name, company_name, hr_manager, business_num,  business_img,
	               business_info, domitory, meals, company_telephone, ip, manager_email,addr_dt_kor, addr_dt_en;  
	private Date regdate;
	
	
	List<MultipartFile> business_file;
	
	//카테고리 변수
	private int cate_idx;
	private String cate_child_en, cate_child_ko, cate_prnt_en, cate_prnt_ko;
	
	//주소 변수
	private String do_kor, gu_gun_eup_kor, do_en, gu_gun_eup_eng, address, address_en;
	
	//CompanyVO 실행
	public CompanyVO() {}
	
	//파일업로드
	public List<MultipartFile> getBusiness_file() {
		return business_file;
	}
	
	public void setBusiness_file(List<MultipartFile> business_file) {
		this.business_file = business_file;
	}
	
	public String getBusiness_img() {
		return business_img;
	}
	
	public void setBusiness_img(String business_img) {
		this.business_img = business_img;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getCate_child_en() {
		return cate_child_en;
	}

	public void setCate_child_en(String cate_child_en) {
		this.cate_child_en = cate_child_en;
	}

	public String getCate_child_ko() {
		return cate_child_ko;
	}

	public void setCate_child_ko(String cate_child_ko) {
		this.cate_child_ko = cate_child_ko;
	}

	public String getCate_prnt_en() {
		return cate_prnt_en;
	}

	public void setCate_prnt_en(String cate_prnt_en) {
		this.cate_prnt_en = cate_prnt_en;
	}

	public String getCate_prnt_ko() {
		return cate_prnt_ko;
	}

	public void setCate_prnt_ko(String cate_prnt_ko) {
		this.cate_prnt_ko = cate_prnt_ko;
	}

	public String getAddress_en() {
		return address_en;
	}

	public void setAddress_en(String address_en) {
		this.address_en = address_en;
	}

	public String getAddr_dt_kor() {
		return addr_dt_kor;
	}

	public void setAddr_dt_kor(String addr_dt_kor) {
		this.addr_dt_kor = addr_dt_kor;
	}

	public String getAddr_dt_en() {
		return addr_dt_en;
	}



	public void setAddr_dt_en(String addr_dt_en) {
		this.addr_dt_en = addr_dt_en;
	}



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
				+ ", ceo_name=" + ceo_name + ", company_name=" + company_name + ", hr_manager=" + hr_manager
				+ ", business_num=" + business_num + ", business_img=" + business_img + ", business_info="
				+ business_info + ", domitory=" + domitory + ", meals=" + meals + ", company_telephone="
				+ company_telephone + ", ip=" + ip + ", manager_email=" + manager_email + ", addr_dt_kor=" + addr_dt_kor
				+ ", addr_dt_en=" + addr_dt_en + ", regdate=" + regdate + ", cate_idx=" + cate_idx + ", cate_child_en="
				+ cate_child_en + ", cate_child_ko=" + cate_child_ko + ", cate_prnt_en=" + cate_prnt_en
				+ ", cate_prnt_ko=" + cate_prnt_ko + ", do_kor=" + do_kor + ", gu_gun_eup_kor=" + gu_gun_eup_kor
				+ ", do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address=" + address + ", address_en="
				+ address_en + "]";
	}
	public String toStringAddress() {
		return "CompanyVO [do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address=" + address
				+ ", address_en=" + address_en + ", addr_dt_kor=" + addr_dt_kor + ", addr_dt_en=" + addr_dt_en
				+ ", do_kor=" + do_kor + ", gu_gun_eup_kor=" + gu_gun_eup_kor + "]";
	}

	public String toStringCate() {
		return "CompanyVO [cate_child_en=" + cate_child_en + ", cate_child_ko=" + cate_child_ko + ", cate_prnt_en="
				+ cate_prnt_en + ", cate_prnt_ko=" + cate_prnt_ko + "]";
	}



	
	


	

		
	
}
