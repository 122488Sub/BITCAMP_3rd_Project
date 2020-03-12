package com.koreigner.biz.job.jobservice;

import java.util.List;

import com.koreigner.biz.common.page.PagingVO;

public class JobVO {
	
	List<String> do_en;
	List<String> gu_gun_eup_en;
	String cate_prnt_en;
	List<String> cate_child_en;
	List<String> payCondition;
	String searchKeyword;
	PagingVO pagingVO;
	int begin;
	int end;
	
	//필터 확인값
	boolean addrFilter = false;
	boolean cateFilter = false;
	boolean cateChildFilter = false;
	boolean payFilter = false;
	boolean searchFilter = false;
	
	public JobVO() {}
	
	public boolean isSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(boolean searchFilter) {
		this.searchFilter = searchFilter;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		if(!searchKeyword.equals("")) {
			searchFilter=true;
		}else searchFilter=false;
		this.searchKeyword = searchKeyword;
	}

	public PagingVO getPagingVO() {
		return pagingVO;
	}

	public boolean isCateChildFilter() {
		return cateChildFilter;
	}

	public void setCateChildFilter(boolean cateChildFilter) {
		this.cateChildFilter = cateChildFilter;
	}

	public void setPagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	}

	public boolean isAddrFilter() {
		return addrFilter;
	}

	public void setAddrFilter(boolean addrFilter) {
		
		this.addrFilter = addrFilter;
	}

	public boolean isCateFilter() {
		return cateFilter;
	}

	public void setCateFilter(boolean cateFilter) {
		this.cateFilter = cateFilter;
	}

	public boolean isPayFilter() {
		return payFilter;
	}

	public void setPayFilter(boolean payFilter) {
		this.payFilter = payFilter;
	}

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
		if(do_en.size() > 1){
			addrFilter=true;
		}else addrFilter=false;
		
	}

	public List<String> getGu_gun_eup_en() {
		return gu_gun_eup_en;
	}

	public void setGu_gun_eup_en(List<String> gu_gun_eup_en) {
		if(gu_gun_eup_en.size() > 1){
			addrFilter=true;
		}else addrFilter=false;
		this.gu_gun_eup_en = gu_gun_eup_en;
	}

	public String getCate_prnt_en() {
		return cate_prnt_en;
	}

	public void setCate_prnt_en(String cate_prnt_en) {
		if(!cate_prnt_en.equals("")){
			cateFilter=true;
		}else cateFilter=false;
		
		this.cate_prnt_en = cate_prnt_en;
	}

	public List<String> getCate_child_en() {
		return cate_child_en;
	}

	public void setCate_child_en(List<String> cate_child_en) {
		if(cate_child_en.size() > 0){
			cateChildFilter=true;
		}else cateChildFilter=false;
		this.cate_child_en = cate_child_en;
	}

	public List<String> getPayCondition() {
		return payCondition;
	}

	public void setPayCondition(List<String> payCondition) {
		if(payCondition.size() > 0){
			payFilter=true;
		}else payFilter=false;
		this.payCondition = payCondition;
	}

	@Override
	public String toString() {
		return "JobVO [do_en=" + do_en + ", gu_gun_eup_en=" + gu_gun_eup_en + ", cate_prnt_en=" + cate_prnt_en
				+ ", cate_child_en=" + cate_child_en + ", payCondition=" + payCondition + ", begin=" + begin + ", end="
				+ end + "]";
	}
	
}
