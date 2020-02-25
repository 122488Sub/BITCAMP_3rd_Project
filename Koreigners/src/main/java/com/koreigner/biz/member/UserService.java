package com.koreigner.biz.member;

import java.util.Map;

public interface UserService {
	
	//아이디 중복체크
	int userIdCheck(UserVO vo);

	//닉네임 중복체크
	int userNickCheck(UserVO vo);

	//회원가입
	void joinUser(UserVO vo) throws Exception;

	//권한 불러오기
	String getAuthStatus(String mem_id);

	//권한 업데이트
	void updateAuthstatus(UserVO vo);

	//비밀번호 재설정 메일 보내기
	void resetPasswordMail(String email) throws Exception;

	//비밀번호 재설정
	void resetPassword(UserVO vo);

	//로그인처리
	boolean checkLogin(String inputId, String inputPw, String inputCate);

	//JWT 토큰 생성
	String createToken(String string);
	
	//JWT 토큰 검증
	String validToken(String tokenStr);
	
	//JWT 토큰 payload 정보 추출
	Map<String, Object> getTokenPayload(String tokenStr);

	
}
