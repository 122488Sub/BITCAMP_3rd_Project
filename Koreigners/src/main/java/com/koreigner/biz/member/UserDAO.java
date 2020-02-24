package com.koreigner.biz.member;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {}
	
	//아이디 중복 체크
	public int userIdCheck(UserVO vo) {
		int idCnt = mybatis.selectOne("user.userIdCheck", vo);
		return idCnt;
	}
	
	//닉네임 중복 체크
	public int userNickCheck(UserVO vo) {
		int nameCnt = mybatis.selectOne("user.userNickCheck", vo);
		return nameCnt;
	}

	//회원 등록
	public void joinUser(UserVO vo) {
		mybatis.insert("user.joinUser", vo);
	}
	
	//이메일 인증 후 권한 업데이트
	public void updateAuthstatus(UserVO vo) {
		mybatis.update("user.updateAuthstatus", vo);
		
	}
	
	//비밀번호 재설정
	public void updatePassword(UserVO vo) {
		mybatis.update("user.updatePassword", vo);
		
	}

	public Object userLoginCheck(String mem_id, String mem_pw) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("mem_pw", mem_pw);
		return mybatis.selectOne("user.userLoginCheck", paramMap);
	}

}
