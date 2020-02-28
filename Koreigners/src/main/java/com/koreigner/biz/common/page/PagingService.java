package com.koreigner.biz.common.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.job.hire.HireServiceImpl;
import com.koreigner.biz.job.jobservice.JobVO;

@Service
public class PagingService {

	@Autowired
	HireServiceImpl hireServiceImpl; 
	
	public PagingVO paging(String cPage, JobVO jobVO) {
	// 페이지 처리를 위한  Paging 객체 생성해서 값 설정
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기
		System.out.println("paging p jobVO : " + jobVO);
		int total = hireServiceImpl.hireListTotal(jobVO);
		
		System.out.println("total : " + total);
		p.setTotalRecord(total);
		p.setTotalPage();

	
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
		System.out.println("p.getEnd() : " + p.getEnd());
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}
}
