package com.koreigner.biz.member;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface UserService {
	
	//아이디 중복체크
	int userIdCheck(String mem_id);

	//닉네임 중복체크
	int userNickCheck(String mem_name);

	//회원가입
	void joinUser(UserVO vo) throws Exception;

	//이메일인증여부 불러오기
	String getAuthStatus(String mem_id);
	
	//회원 정보 가져오기
	UserVO getOneMember(String mem_id);

//	//권한 업데이트
//	void updateAuthstatus(UserVO vo);
	
	//비밀번호 재설정 메일 보내기
	void resetPasswordMail(String email) throws Exception;

//	//비밀번호 재설정
//	void resetPassword(UserVO vo);

	//로그인처리
	boolean checkLogin(String inputId, String inputPw, String inputCate);

	//JWT 토큰 생성
	String createToken(String string, String jSessionId);
	
	//JWT 토큰 검증
	String validToken(String tokenStr);
	
	//JWT 토큰 payload 정보 추출
	Map<String, Object> getTokenPayload(String tokenStr);
	
	//네이버 or 구글계정으로 로그인 할때 db에 데이터가 존재 하는지 확인 한다.
	UserVO getMemberSns(UserVO snsMemVO);

	void keppLogin(String mem_id, String sessionId, Date expire);

	UserVO checkLoginBefore(String value);
	
	//sns(소셜)회원가입 
	void setSnsRegister(UserVO mvo) throws Exception;
	
//==================== 마이페이지 =========================================	
	
	//회원 정보 수정
	void updateMember(UserVO vo);
		
	//동일한 비밀번호인지 체크
	int userPwCheck(Map<String, String> map);
	
	//이력서 입력
	void insertResume(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	

}
