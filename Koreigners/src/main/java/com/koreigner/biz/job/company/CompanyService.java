package com.koreigner.biz.job.company;

import java.util.List;

public interface CompanyService {
	List<CompanyVO> getCateList();
	List<CompanyVO> getCateChild(String cate_kor);
	List<CompanyVO> getAddrDoList();
	List<CompanyVO> getAddrSiList(String si_kor);
	
	
}
