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
	public int userIdCheck(String mem_id) {
		int idCnt = mybatis.selectOne("user.userIdCheck", mem_id);
		return idCnt;
	}
	
	//닉네임 중복 체크
	public int userNickCheck(String mem_name) {
		int nameCnt = mybatis.selectOne("user.userNickCheck", mem_name);
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

	//해당유저의 존재여부 파악
	public Object userLoginCheck(String inputId, String inputPw, String inputCate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", inputId);
		paramMap.put("mem_pw", inputPw);
		paramMap.put("mem_cate", inputCate);
		return mybatis.selectOne("user.userLoginCheck", paramMap);
	}
	
	//이메일인증여부 가져오기
	public String getAuthStatus(String mem_id) {
		String auth_status = mybatis.selectOne("user.getAuthStatus", mem_id);
		return auth_status;
	}
	
	//회원정보 불러오기
	public UserVO getOneMember(String mem_id) {
		UserVO mvo = mybatis.selectOne("user.getOneMember", mem_id);
		return mvo;
	}

	//회원정보 수정하기
	public void updateMember(UserVO vo) {
		mybatis.update("user.updateMember", vo);		
	}

	//비밀번호 체크
	public int userPwCheck(Map<String, String> map) {
		int userCnt = mybatis.selectOne("user.userPwCheck", map);
		return userCnt;
	}

}
