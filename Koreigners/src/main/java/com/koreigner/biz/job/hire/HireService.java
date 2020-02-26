package com.koreigner.biz.job.hire;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.koreigner.biz.common.page.PagingVO;

public interface HireService {

	void insertHire(HireVO vo, HttpServletRequest reqeust);
	void hireHIT(int hire_idx);
	void wishInsert(HireVO hireVO);
	int hireListTotal();
	List<HireVO> getHireList(Map<String, Integer> map);
	HireVO hireDetailOne(int hire_idx);
	String getHireListJson(List<HireVO> list, PagingVO p);
	
}
