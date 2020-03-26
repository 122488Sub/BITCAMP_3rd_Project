package com.koreigner.biz.member.resume;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ResumeDAO() {}
	
	//이력서 입력
	public void insertResume(Map<String, Object> map) {
		mybatis.insert("resume.insertResume", map);
	}
	
	//커리어 입력
	public void insertCareer(Map<String, Object> map) {
		mybatis.insert("resume.insertCareer", map);
	}
	
	//파일업로드
	public void insertFile(Map<String, Object> map)  throws Exception {
		mybatis.insert("resume.insertFile", map);
	}

	//이력서 가져오기
	public Map<String, Object> selectResume(String mem_id) {
		return mybatis.selectOne("resume.selectResume", mem_id);
	}
	
	//이력서 파일 가져오기
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return mybatis.selectList("resume.selectFileList", map);
	}

	//이력서 경력 가져오기
	public List<Map<String, Object>> selectCareerList(Map<String, Object> map) {
		return mybatis.selectList("resume.selectCareerList", map);
	}
	
	//이력서 파일 다운 정보가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		return (Map<String, Object>)mybatis.selectOne("resume.selectFileInfo", map);
	}

	//이력서 수정하기
	public void updateResume(Map<String, Object> map) {
		mybatis.update("resume.updateResume", map);
	}

	
}
