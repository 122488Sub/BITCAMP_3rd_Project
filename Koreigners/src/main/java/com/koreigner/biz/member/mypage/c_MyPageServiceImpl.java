package com.koreigner.biz.member.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.job.hire.HireVO;

//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("c_MyPageService")
public class c_MyPageServiceImpl implements c_MyPageService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	
	private c_MyPageDAO cDAO;

	@Override
	public List<HireVO>  getHireMyAdsList(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		
		return cDAO.myBatis_getHireMyAdsList(cVO);
	}

	@Override
	public List<Map<String, Object>> getResumeApplyList(c_MyPageVO cVO) {
		
		return cDAO.myBatis_getResumeApplyList(cVO);
	}

	@Override
	public int getResumeTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return cDAO.mybatis_getResumeTotal(cVO);
	}
	
	@Override
	public int getHireTotal(c_MyPageVO cVO) {
		// TODO Auto-generated method stub
		return cDAO.mybatis_getHireTotal(cVO);
	}

	@Override
	public Map<String, Object> togleApply(c_MyPageVO cVO) {
		Map<String, Object> resultMap= new HashMap<String, Object>();

		if(cVO.getCategory()==2) {
			
			if(cDAO.myBatis_updateApplyDel(cVO)>0) {
				resultMap.put("result","Your registration cancellation is complete.");
			}else {
				resultMap.put("result","ERROR");
			}
		}else {
			
			if(cDAO.myBatis_insertApply(cVO)>0) {
				resultMap.put("result","Your resume registration has been completed successfully.");
			}else {
				resultMap.put("result","ERROR");
			}
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> checkResume(c_MyPageVO cVO) {
		Map<String, Object> resultMap= new HashMap<String, Object>();

		int resume_idx=cDAO.mybatis_isResume(cVO);

		if(resume_idx<1) {
			resultMap.put("isResume",false);
		}else {
			resultMap.put("isResume",true);
			resultMap.put("resume_idx", resume_idx);
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> checkApply(c_MyPageVO cVO) {
		Map<String, Object> resultMap= new HashMap<String, Object>();
		resultMap.put("isApply",cDAO.myBatis_isApply(cVO));
		return resultMap;
	}
	
	
	

	
	
	
	
}
