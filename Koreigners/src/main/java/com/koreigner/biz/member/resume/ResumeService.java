package com.koreigner.biz.member.resume;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface ResumeService {
	
	//이력서 입력
	void insertResume(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//이력서 가져오기
	Map<String, Object> selectResume(String mem_id);
	
	//이력서 파일 다운받기위한 정보
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

	//이력서 수정하기
	void updateResume(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	

}
