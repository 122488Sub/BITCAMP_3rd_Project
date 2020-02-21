package com.koreigner.biz.job.hire;

import javax.servlet.http.HttpServletRequest;

public interface HireService {

	void insertHire(HireVO vo, HttpServletRequest reqeust);
}
