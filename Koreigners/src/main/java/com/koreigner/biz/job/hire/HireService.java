package com.koreigner.biz.job.hire;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface HireService {

	void insertHire(HireVO vo, HttpServletRequest reqeust);
	List<HireVO> getHireList(Map<String, Integer> map);
	int hireListTotal();
}
