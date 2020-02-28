package com.koreigner.biz.job.hire;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.job.jobservice.JobVO;

public interface HireService {

	void insertHire(HireVO vo, HttpServletRequest reqeust);
	void hireHIT(int hire_idx);
	void wishInsert(HireVO hireVO);
	int hireListTotal(JobVO jobVO);
	List<HireVO> getHireList(JobVO jobVO);
	HireVO hireDetailOne(int hire_idx);
	String getHireListJson(List<HireVO> list, PagingVO p);
	
}
