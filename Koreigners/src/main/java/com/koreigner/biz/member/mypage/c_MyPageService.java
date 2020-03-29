package com.koreigner.biz.member.mypage;

import java.util.List;
import java.util.Map;

import com.koreigner.biz.job.hire.HireVO;

public interface c_MyPageService {
	//CRUD 기능 구현 메소드 정의
	
	
	List<HireVO> getHireMyAdsList(c_MyPageVO cVO);

	List<Map<String, Object>>getResumeApplyList(c_MyPageVO cVO);

	int getResumeTotal(c_MyPageVO cVO);
	int getHireTotal(c_MyPageVO cVO);
}
