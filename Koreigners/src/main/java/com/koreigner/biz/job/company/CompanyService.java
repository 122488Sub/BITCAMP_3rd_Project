package com.koreigner.biz.job.company;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.koreigner.biz.job.hire.HireVO;

public interface CompanyService {
	List<CompanyVO> getCateList();
	List<CompanyVO> getCateChild(String cate_kor);
	List<CompanyVO> getAddrDoList();
	List<CompanyVO> getAddrSiList(String si_kor);
	CompanyVO getCateEn(Map<String, String> map);
	void comJoin(CompanyVO vo, HttpServletRequest request);
	
	
	
}
