package com.koreigner.biz.member;

public class CareerVO {

	private int resume_idx;
	private int join_year;
	private int join_month;
	private int resign_year;
	private int resign_month;
	private String region;
	private String company;
	private String task;
	
	
	public CareerVO() {
		super();
	}


	public int getResume_idx() {
		return resume_idx;
	}


	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}


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


	@Override
	public String toString() {
		return "CareerVO [resume_idx=" + resume_idx + ", join_year=" + join_year + ", join_month=" + join_month
				+ ", resign_year=" + resign_year + ", resign_month=" + resign_month + ", region=" + region
				+ ", company=" + company + ", task=" + task + "]";
	}
	
	
	
	
	
}
