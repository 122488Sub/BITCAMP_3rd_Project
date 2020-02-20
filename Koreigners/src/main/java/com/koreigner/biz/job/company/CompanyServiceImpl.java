package com.koreigner.biz.job.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDAO;
	
	@Override
	public List<CompanyVO> getCateList() {
		List<CompanyVO> list = companyDAO.getCateList();
		return list;
	}
	
	@Override
	public List<CompanyVO> getCateChild(String cate_kor) {
		List<CompanyVO> list = companyDAO.getCateChild(cate_kor);
		
		return list;
	}
	
	@Override
	public List<CompanyVO> getAddrDoList() {
		List<CompanyVO> list = companyDAO.getAddrDoList();
				
		return list;
	}
	
	@Override
	public List<CompanyVO> getAddrSiList(String si_kor) {
		List<CompanyVO> list = companyDAO.getAddrSiList(si_kor);
		return list;
	}
	
	@Override
	public CompanyVO getCateEn(CompanyVO vo) {
		CompanyVO outVO = companyDAO.getCateEn(vo);
		return outVO;
	}
	
	@Override
	public void comJoin(CompanyVO vo) {
		companyDAO.comJoin(vo);
	}
}
