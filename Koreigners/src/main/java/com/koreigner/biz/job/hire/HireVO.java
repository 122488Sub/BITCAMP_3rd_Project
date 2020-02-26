package com.koreigner.biz.job.hire;

import java.util.Date;
import java.util.List;

public class HireVO {
	private int board_idx;      		    //게시판 정보   default 2
	private int hire_idx;      				//채용게시판 번호
	private int salary_min;                 //월급 최소
	private int salary_max;                 //월급 최대
	private int hire_number;                //채용 인원
	private int hire_age_min;               //희망 직원 나이 최소
	private int hire_age_max;               //희망 직원 나이 최대
	private int hit;                        //조회수
	private String mem_id;                  //회사 계정 아이디
	private String company_name;            //회사 이름
	private String work_type;               //근무 형태   정규직 / 아르바이트 / 시간제 등등
	private String title;                   //게시글 제목
	private String do_en;                   //근무 행정구역 영어
	private String gu_gun_eup_eng;          //근무 시구군 영어
	private String address_en;              //근무 주소 영어
	private String do_kor;                  //근무 행정구역 한글
	private String gu_gun_eup_kor;          //근무 시구군 한글
	private String address;                 //근무 주소 한글
	private String addr_dt_kor;             //근무 상세 주소 한글
	private String addr_dt_en;              //근무 상세 주소 영어
	private String payment_detail;          //급여 상세 설명
	private String payment_codition;        //급여 형태   시급/일당/월급/연봉/회사내규
	private String education;               //학력
	private String experience;              //경력
	private String major;                   //전공
	private String prefer_skills;           //기타 우대 능력
	private String foreign_language;        //외국어
	private String domitory;                //기숙사 제공 여부
	private String meals;                   //식사
	private String work_detail;             //직무 내용
	private String insurance;         //보험 유무     의료보험/산재보험/고용보험/국민연금보험
	private List<String> insuranceInfo;         //보험 유무     의료보험/산재보험/고용보험/국민연금보험
	private String apply_way;               //지원방법(전형방법)
	private String b_status;                //게시판 상태(활성화/비활성화)
	private String prepare_doc;             //제출 서류 / 준비물
	private String work_time;               //근무 시간
	private String cate_prnt_ko;            //직무 카테고리 대분류 한글
	private String cate_child_ko;           //직무 카테고리 소분류 한글
	private String cate_prnt_en;            //직무 카테고리 대분류 영어 
	private String cate_child_en;           //직무 카테고리 소분류 영어
	private String ip;                      //아이피
	private Date regdate; 					//작성 일자
	
	public HireVO() {}
	
	
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getInsurance() {
		return insurance;
	}
	public List<String> getInsuranceInfo() {
		return insuranceInfo;
	}
	public void setInsuranceInfo(List<String> insuranceInfo) {
		this.insuranceInfo = insuranceInfo;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
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
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getAddress_en() {
		return address_en;
	}
	public void setAddress_en(String address_en) {
		this.address_en = address_en;
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
	public String getCate_prnt_ko() {
		return cate_prnt_ko;
	}
	public void setCate_prnt_ko(String cate_prnt_ko) {
		this.cate_prnt_ko = cate_prnt_ko;
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
	public String getCate_child_en() {
		return cate_child_en;
	}
	public void setCate_child_en(String cate_child_en) {
		this.cate_child_en = cate_child_en;
	}
	public int getHire_idx() {
		return hire_idx;
	}
	public void setHire_idx(int hire_idx) {
		this.hire_idx = hire_idx;
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


	//주소 toString
	public String toStringAddr() {
		return "HireVO [do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address_en=" + address_en
				+ ", do_kor=" + do_kor + ", gu_gun_eup_kor=" + gu_gun_eup_kor + ", address=" + address
				+ ", addr_dt_kor=" + addr_dt_kor + ", addr_dt_en=" + addr_dt_en + "]";
	}
	
	//카테고리 toString
	public String toStringCate() {
		return "HireVO [cate_prnt_ko=" + cate_prnt_ko + ", cate_child_ko=" + cate_child_ko + ", cate_prnt_en="
				+ cate_prnt_en + ", cate_child_en=" + cate_child_en + "]";
	}





	@Override
	public String toString() {
		return "HireVO [board_idx=" + board_idx + ", hire_idx=" + hire_idx + ", salary_min=" + salary_min
				+ ", salary_max=" + salary_max + ", hire_number=" + hire_number + ", hire_age_min=" + hire_age_min
				+ ", hire_age_max=" + hire_age_max + ", hit=" + hit + ", mem_id=" + mem_id + ", work_type=" + work_type
				+ ", title=" + title + ", do_en=" + do_en + ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address_en="
				+ address_en + ", do_kor=" + do_kor + ", gu_gun_eup_kor=" + gu_gun_eup_kor + ", address=" + address
				+ ", addr_dt_kor=" + addr_dt_kor + ", addr_dt_en=" + addr_dt_en + ", payment_detail=" + payment_detail
				+ ", payment_codition=" + payment_codition + ", education=" + education + ", experience=" + experience
				+ ", major=" + major + ", prefer_skills=" + prefer_skills + ", foreign_language=" + foreign_language
				+ ", domitory=" + domitory + ", meals=" + meals + ", work_detail=" + work_detail + ", insurance="
				+ insurance + ", insuranceInfo=" + insuranceInfo + ", apply_way=" + apply_way + ", b_status=" + b_status
				+ ", prepare_doc=" + prepare_doc + ", work_time=" + work_time + ", cate_prnt_ko=" + cate_prnt_ko
				+ ", cate_child_ko=" + cate_child_ko + ", cate_prnt_en=" + cate_prnt_en + ", cate_child_en="
				+ cate_child_en + ", ip=" + ip + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
}
