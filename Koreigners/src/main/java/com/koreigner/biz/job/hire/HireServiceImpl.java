package com.koreigner.biz.job.hire;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreigner.biz.common.page.PagingVO;
import com.koreigner.biz.job.company.CompanyServiceImpl;
import com.koreigner.biz.job.company.CompanyVO;
import com.koreigner.biz.job.jobservice.JobService;
import com.koreigner.biz.job.jobservice.JobVO;

@Service
public class HireServiceImpl implements HireService {

	@Autowired
	private HireDAO hireDAO;
	@Autowired
	private JobService jobService;
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	
	
	
	@Override
	public void insertHire(HireVO vo, HttpServletRequest reqeust) {
		
		String ip = reqeust.getRemoteAddr();  	//ip
		String insurance = jobService.insuranceInfo(vo.getInsuranceInfo()); //보험 유무 데이터 ex) 0111
		
		Map<String, String> map = new HashMap<>();
		map.put("cate_prnt_ko", vo.getCate_prnt_ko());
		map.put("cate_child_ko", vo.getCate_child_ko());
		
		vo.setMem_id("rex");
		CompanyVO enCate_vo = companyServiceImpl.getCateEn(map); //영어 카테고리 vo 생성
		String companyName = companyServiceImpl.getComName(vo.getMem_id());
		System.out.println("company name : " + companyName);
		vo.setCompany_name(companyName);
		vo.setInsurance(insurance);                              //보험정보 vo에 추가
		vo.setIp(ip);											 //ip vo에 추가
		vo.setCate_prnt_en(enCate_vo.getCate_prnt_en());         //영어 카테고리 대분류 vo에 추가
		vo.setCate_child_en(enCate_vo.getCate_child_en());       //영어 카테고리 소분류 vo에 추가
		
		
		System.out.println("vo.toString() : " + vo.toString());
		
		hireDAO.insertHire(vo);
	}
	
	@Override
	public List<HireVO> getHireList(JobVO jobVO) {
		List<HireVO> hireList = hireDAO.getHireList(jobVO);
		return hireList;
	}
	
	@Override
	public int hireListTotal(JobVO jobVO) {
		int total = hireDAO.hireListTotal(jobVO);
		return total;
	}
	
	@Override
	public void hireHIT(int hire_idx) {
		hireDAO.hireHIT(hire_idx);
	}
	
	@Override
	public HireVO hireDetailOne(int hire_idx) {
		HireVO hirevo = hireDAO.hireDetailOne(hire_idx);
		return hirevo;
	}
	
	@Override
	public String getHireListJson(List<HireVO> list, PagingVO p) {
		
		String result = "{";
		result +=          "\"list\" : [";
		for(HireVO vo : list) {
			result += "{";
			result += "\"hire_idx\":\"" + vo.getHire_idx() + "\","; 
			result += "\"company_name\":\"" + vo.getCompany_name() + "\","; 
			result += "\"gu_gun_eup_eng\":\"" + vo.getGu_gun_eup_eng() + "\","; 
			result += "\"do_en\":\"" + vo.getDo_en() + "\","; 
			result += "\"title\":\"" + vo.getTitle() + "\","; 
			result += "\"salary_min\":\"" + vo.getSalary_min() + "\","; 
			result += "\"salary_max\":\"" + vo.getSalary_max() + "\","; 
			result += "\"regdate\":\"" + vo.getRegdate() + "\""; 
			result += "},";
			
		}
		
		// {},{},{},{},{}, 형태로 저장 되므로 맨마지막 ,는 제거
		result = result.substring(0,result.length()-1);
		result +="],";
		result += " \"pvo\" : {";
		result += "\"nowPage\" :"+ p.getNowPage() +","; 
		result += "\"nowBlock\":" + p.getNowBlock() + ","; 
		result += "\"pagePerBlock\":" + p.getPagePerBlock() + ","; 
		result += "\"totalRecord\":" + p.getTotalRecord() + ","; 
		result += "\"totalPage\":" + p.getTotalPage() + ","; 
		result += "\"totalBlock\":" + p.getTotalBlock() + ","; 
		result += "\"begin\":" + p.getBegin() + ","; 
		result += "\"end\":" + p.getEnd() + ","; 
		result += "\"beginPage\":" + p.getBeginPage() + ","; 
		result += "\"endPage\":" + p.getEndPage() +"}"; 
		result +="}";
		
		return result;
	}
	
	@Override
	public void wishInsert(HireVO hireVO) {
		hireDAO.wishInsert(hireVO);
		
	}
}
