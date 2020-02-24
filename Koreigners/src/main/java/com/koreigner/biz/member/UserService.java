package com.koreigner.biz.member;

import java.util.Map;

public interface UserService {
	
	int userIdCheck(UserVO vo);

	int userNickCheck(UserVO vo);

	void joinUser(UserVO vo) throws Exception;

	void updateAuthstatus(UserVO vo);

	void resetPasswordMail(String email) throws Exception;

	void resetPassword(UserVO vo);

	//로그인처리
	boolean checkLogin(String mem_id, String mem_pw);

	//JWT 토큰 생성
	String createToken(String string);
	
	//JWT 토큰 검증
	String validToken(String tokenStr, String userId);
	
	//JWT 토큰 payload 정보 추출
	Map<String, Object> getTokenPayload(String tokenStr);
	
}
