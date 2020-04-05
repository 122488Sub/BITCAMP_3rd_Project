package com.koreigner.biz.common.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.house.HouseSearch_VO;
import com.koreigner.biz.house.House_Service;
import com.koreigner.biz.inform.InformService;
import com.koreigner.biz.inform.InformVO;
import com.koreigner.biz.job.hire.HireServiceImpl;
import com.koreigner.biz.job.jobservice.JobVO;
import com.koreigner.biz.member.mypage.c_MyPageService;
import com.koreigner.biz.member.mypage.c_MyPageVO;
import com.koreigner.biz.member.mypage.p_MyPageService;
import com.koreigner.biz.member.mypage.p_MyPageVO;
import com.koreigner.biz.resale.ResaleService;
import com.koreigner.biz.resale.ResaleVO;

@Service
public class PagingService {

	@Autowired
	HireServiceImpl hireServiceImpl; 
	
	@Autowired
	House_Service houseService;
	
	@Autowired
	ResaleService resaleService;
	
	@Autowired
	p_MyPageService pService;
	
	@Autowired
	c_MyPageService cService;
	
	@Autowired
	InformService informService;
	
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
	
	public PagingVO paging(String cPage, HouseSearch_VO houseVO) {
		// 페이지 처리를 위한  Paging 객체 생성해서 값 설정
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기
	//  System.out.println("paging p houseVO : " + houseVO);
		int total = houseService.getHouseTotal(houseVO);
		
	//  System.out.println("total : " + total);
		p.setTotalRecord(total);
		p.setTotalPage();

	
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
	//	System.out.println("p.getEnd() : " + p.getEnd());
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}
	public PagingVO paging(String cPage, p_MyPageVO pVO) {
		// 페이지 처리를 위한  Paging 객체 생성해서 값 설정
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기
		//  System.out.println("paging p houseVO : " + houseVO);
		System.out.println(pVO);
		
		int total =0;
		if(pVO.getCategory()==1)
			total=pService.getWishTotal(pVO);
		else if(pVO.getCategory()==2)
			total=pService.getAdsTotal(pVO);
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
	//	System.out.println("p.getEnd() : " + p.getEnd());
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}
	
	public PagingVO paging(String cPage, c_MyPageVO cVO) {
		// 페이지 처리를 위한  Paging 객체 생성해서 값 설정
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기
		//  System.out.println("paging p houseVO : " + houseVO);
		int total=0;
		if(cVO.getCategory()==1 ) {
			total = cService.getHireTotal(cVO);
		}
		
		else if(cVO.getCategory()==2) {
			total = cService.getResumeTotal(cVO);
		}
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
	//	System.out.println("p.getEnd() : " + p.getEnd());
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}
	
	public PagingVO paging(String cPage) {
		// 페이지 처리를 위한  Paging 객체 생성해서 값 설정
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기
	//  System.out.println("paging p houseVO : " + houseVO);
		int total = resaleService.resaleTotal();
		p.setNumPerPage(9);
	//  System.out.println("total : " + total);
		p.setTotalRecord(total);
		p.setTotalPage();

	
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
	//	System.out.println("p.getEnd() : " + p.getEnd());
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}

	public PagingVO paging(String cPage, InformVO informVO) {
		PagingVO p = new PagingVO();
		//1. 전체 페이지의 수를 구하기

		int total = informService.informSearchTotal(informVO);
		
		p.setTotalRecord(total);
		p.setTotalPage();
		p.setNumPerPage(9);
	
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
	
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}

	public PagingVO paging(String cPage, ResaleVO resaleVO) {
		PagingVO p = new PagingVO();
		System.out.println("PAGING");
		int total = resaleService.resaleSearchTotal(resaleVO);
		System.out.println(total);
		p.setTotalRecord(total);
		p.setTotalPage();
		p.setNumPerPage(9);
	
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
	
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
