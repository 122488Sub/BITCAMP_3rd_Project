package com.koreigner.biz.job.jobservice;

import java.util.List;

public class JobVO {
	
	List<String> do_en;
	List<String> gu_gun_eup_en;
	String cate_prnt_en;
	List<String> cate_child_en;
	List<String> payCondition;
	int begin;
	int end;
	
	
	
	public JobVO() {}

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

	public List<String> getDo_en() {
		return do_en;
	}

	public void setDo_en(List<String> do_en) {
		this.do_en = do_en;
	}

	public List<String> getGu_gun_eup_en() {
		return gu_gun_eup_en;
	}

	public void setGu_gun_eup_en(List<String> gu_gun_eup_en) {
		this.gu_gun_eup_en = gu_gun_eup_en;
	}

	public String getCate_prnt_en() {
		return cate_prnt_en;
	}

	public void setCate_prnt_en(String cate_prnt_en) {
		this.cate_prnt_en = cate_prnt_en;
	}

	public List<String> getCate_child_en() {
		return cate_child_en;
	}

	public void setCate_child_en(List<String> cate_child_en) {
		this.cate_child_en = cate_child_en;
	}

	public List<String> getPayCondition() {
		return payCondition;
	}

	public void setPayCondition(List<String> payCondition) {
		this.payCondition = payCondition;
	}

	@Override
	public String toString() {
		return "JobVO [do_en=" + do_en + ", gu_gun_eup_en=" + gu_gun_eup_en + ", cate_prnt_en=" + cate_prnt_en
				+ ", cate_child_en=" + cate_child_en + ", payCondition=" + payCondition + ", begin=" + begin + ", end="
				+ end + "]";
	}
	
}
