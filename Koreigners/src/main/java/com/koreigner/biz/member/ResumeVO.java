package com.koreigner.biz.member;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ResumeVO {

	private int resume_idx;
	private String mem_id;
	private String mem_name;
	private String wish_do;
	private String wish_si;
	private String job_cate;
	private String job_cate_child;
	private int req_salary_min;
	private int req_salary_max;
	private String salary_type;
	private String work_time;
	private String work_time_start;
	private String work_time_end;
	private String work_time_isweek;
	private String work_time_week;
	private String dormitory;
	private String introduce;
	private String graduate_sch;
	private String dep;
	private String lang_learn;
	private String lang_sch;
	private String final_a_m;
	private String final_a_y;
	private String final_g_m;
	private String final_g_y;
	private String final_region;
	private String final_sch;
	private String final_major;
	private String ko_spk_abil;
	private String ko_doc_abil;
	private String ch_spk_abil;
	private String ch_doc_abil;
	private String en_spk_abil;
	private String en_doc_abil;
	private String vt_spk_abil;
	private String vt_doc_abil;
	private String regdate;
	private Date ip;
	private String other_lang;
	
	//파일 업로드용 필드 추가
	private MultipartFile ori_file;
	private MultipartFile save_file;
	
	//커리어
	private int join_year;
	private int join_month;
	private int resign_year;
	private int resign_month;
	private String region;
	private String company;
	private String task;


	public int getJoin_year() {
		return join_year;
	}


	public void setJoin_year(int join_year) {
		this.join_year = join_year;
	}


	public int getJoin_month() {
		return join_month;
	}


	public void setJoin_month(int join_month) {
		this.join_month = join_month;
	}


	public int getResign_year() {
		return resign_year;
	}


	public void setResign_year(int resign_year) {
		this.resign_year = resign_year;
	}


	public int getResign_month() {
		return resign_month;
	}


	public void setResign_month(int resign_month) {
		this.resign_month = resign_month;
	}


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getTask() {
		return task;
	}


	public void setTask(String task) {
		this.task = task;
	}
	
	
	
	public ResumeVO() {
		super();
	}

	public int getResume_idx() {
		return resume_idx;
	}

	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getWish_do() {
		return wish_do;
	}

	public void setWish_do(String wish_do) {
		this.wish_do = wish_do;
	}

	public String getWish_si() {
		return wish_si;
	}

	public void setWish_si(String wish_si) {
		this.wish_si = wish_si;
	}

	public String getJob_cate() {
		return job_cate;
	}

	public void setJob_cate(String job_cate) {
		this.job_cate = job_cate;
	}

	public String getJob_cate_child() {
		return job_cate_child;
	}

	public void setJob_cate_child(String job_cate_child) {
		this.job_cate_child = job_cate_child;
	}

	public int getReq_salary_min() {
		return req_salary_min;
	}

	public void setReq_salary_min(int req_salary_min) {
		this.req_salary_min = req_salary_min;
	}

	public int getReq_salary_max() {
		return req_salary_max;
	}

	public void setReq_salary_max(int req_salary_max) {
		this.req_salary_max = req_salary_max;
	}

	public String getSalary_type() {
		return salary_type;
	}

	public void setSalary_type(String salary_type) {
		this.salary_type = salary_type;
	}

	public String getWork_time() {
		return work_time;
	}

	public void setWork_time(String work_time) {
		this.work_time = work_time;
	}

	public String getWork_time_start() {
		return work_time_start;
	}

	public void setWork_time_start(String work_time_start) {
		this.work_time_start = work_time_start;
	}

	public String getWork_time_end() {
		return work_time_end;
	}

	public void setWork_time_end(String work_time_end) {
		this.work_time_end = work_time_end;
	}

	public String getWork_time_isweek() {
		return work_time_isweek;
	}

	public void setWork_time_isweek(String work_time_isweek) {
		this.work_time_isweek = work_time_isweek;
	}

	public String getWork_time_week() {
		return work_time_week;
	}

	public void setWork_time_week(String work_time_week) {
		this.work_time_week = work_time_week;
	}

	public String getDormitory() {
		return dormitory;
	}

	public void setDormitory(String dormitory) {
		this.dormitory = dormitory;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getGraduate_sch() {
		return graduate_sch;
	}

	public void setGraduate_sch(String graduate_sch) {
		this.graduate_sch = graduate_sch;
	}

	public String getDep() {
		return dep;
	}

	public void setDep(String dep) {
		this.dep = dep;
	}

	public String getLang_learn() {
		return lang_learn;
	}

	public void setLang_learn(String lang_learn) {
		this.lang_learn = lang_learn;
	}

	public String getLang_sch() {
		return lang_sch;
	}

	public void setLang_sch(String lang_sch) {
		this.lang_sch = lang_sch;
	}

	public String getFinal_a_m() {
		return final_a_m;
	}

	public void setFinal_a_m(String final_a_m) {
		this.final_a_m = final_a_m;
	}

	public String getFinal_a_y() {
		return final_a_y;
	}

	public void setFinal_a_y(String final_a_y) {
		this.final_a_y = final_a_y;
	}

	public String getFinal_g_m() {
		return final_g_m;
	}

	public void setFinal_g_m(String final_g_m) {
		this.final_g_m = final_g_m;
	}

	public String getFinal_g_y() {
		return final_g_y;
	}

	public void setFinal_g_y(String final_g_y) {
		this.final_g_y = final_g_y;
	}

	public String getFinal_region() {
		return final_region;
	}

	public void setFinal_region(String final_region) {
		this.final_region = final_region;
	}

	public String getFinal_sch() {
		return final_sch;
	}

	public void setFinal_sch(String final_sch) {
		this.final_sch = final_sch;
	}

	public String getFinal_major() {
		return final_major;
	}

	public void setFinal_major(String final_major) {
		this.final_major = final_major;
	}

	public String getKo_spk_abil() {
		return ko_spk_abil;
	}

	public void setKo_spk_abil(String ko_spk_abil) {
		this.ko_spk_abil = ko_spk_abil;
	}

	public String getKo_doc_abil() {
		return ko_doc_abil;
	}

	public void setKo_doc_abil(String ko_doc_abil) {
		this.ko_doc_abil = ko_doc_abil;
	}

	public String getCh_spk_abil() {
		return ch_spk_abil;
	}

	public void setCh_spk_abil(String ch_spk_abil) {
		this.ch_spk_abil = ch_spk_abil;
	}

	public String getCh_doc_abil() {
		return ch_doc_abil;
	}

	public void setCh_doc_abil(String ch_doc_abil) {
		this.ch_doc_abil = ch_doc_abil;
	}

	public String getEn_spk_abil() {
		return en_spk_abil;
	}

	public void setEn_spk_abil(String en_spk_abil) {
		this.en_spk_abil = en_spk_abil;
	}

	public String getEn_doc_abil() {
		return en_doc_abil;
	}

	public void setEn_doc_abil(String en_doc_abil) {
		this.en_doc_abil = en_doc_abil;
	}

	public String getVt_spk_abil() {
		return vt_spk_abil;
	}

	public void setVt_spk_abil(String vt_spk_abil) {
		this.vt_spk_abil = vt_spk_abil;
	}

	public String getVt_doc_abil() {
		return vt_doc_abil;
	}

	public void setVt_doc_abil(String vt_doc_abil) {
		this.vt_doc_abil = vt_doc_abil;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public Date getIp() {
		return ip;
	}

	public void setIp(Date ip) {
		this.ip = ip;
	}

	public String getOther_lang() {
		return other_lang;
	}

	public void setOther_lang(String other_lang) {
		this.other_lang = other_lang;
	}
	
	// 파일업로드 용
	public MultipartFile getOri_file() {
		return ori_file;
	}

	public void setOri_file(MultipartFile ori_file) {
		this.ori_file = ori_file;
	}

	public MultipartFile getSave_file() {
		return save_file;
	}

	public void setSave_file(MultipartFile save_file) {
		this.save_file = save_file;
	}

	@Override
	public String toString() {
		return "ResumeVO [resume_idx=" + resume_idx + ", mem_id=" + mem_id + ", mem_name=" + mem_name + ", wish_do="
				+ wish_do + ", wish_si=" + wish_si + ", job_cate=" + job_cate + ", job_cate_child=" + job_cate_child
				+ ", req_salary_min=" + req_salary_min + ", req_salary_max=" + req_salary_max + ", salary_type="
				+ salary_type + ", work_time=" + work_time + ", work_time_start=" + work_time_start + ", work_time_end="
				+ work_time_end + ", work_time_isweek=" + work_time_isweek + ", work_time_week=" + work_time_week
				+ ", dormitory=" + dormitory + ", introduce=" + introduce + ", graduate_sch=" + graduate_sch + ", dep="
				+ dep + ", lang_learn=" + lang_learn + ", lang_sch=" + lang_sch + ", final_a_m=" + final_a_m
				+ ", final_a_y=" + final_a_y + ", final_g_m=" + final_g_m + ", final_g_y=" + final_g_y
				+ ", final_region=" + final_region + ", final_sch=" + final_sch + ", final_major=" + final_major
				+ ", ko_spk_abil=" + ko_spk_abil + ", ko_doc_abil=" + ko_doc_abil + ", ch_spk_abil=" + ch_spk_abil
				+ ", ch_doc_abil=" + ch_doc_abil + ", en_spk_abil=" + en_spk_abil + ", en_doc_abil=" + en_doc_abil
				+ ", vt_spk_abil=" + vt_spk_abil + ", vt_doc_abil=" + vt_doc_abil + ", regdate=" + regdate + ", ip="
				+ ip + ", other_lang=" + other_lang + ", join_year=" + join_year + ", join_month=" + join_month
				+ ", resign_year=" + resign_year + ", resign_month=" + resign_month + ", region=" + region
				+ ", company=" + company + ", task=" + task + "]";
	}
	
	
	
}
