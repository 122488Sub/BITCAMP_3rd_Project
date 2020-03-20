package com.koreigner.biz.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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

	
	//네이버 or 구글계정으로 로그인 요청할 시 DB에 데이터가 존재하는지 확인한다.
	public UserVO getMemberSns(UserVO snsMemVO) {
		System.out.println("===> [UserDAO] - getMemberSns() 실행");
		if (StringUtils.isNotEmpty(snsMemVO.getMem_id())) {
			System.out.println("naver ID가 존재 : " + snsMemVO.getMem_id());
			return mybatis.selectOne("user.getMemberSns", snsMemVO);
		} else {
			return mybatis.selectOne("user.getMemberSns", snsMemVO);
		}
	}

	public void keepLogin(String mem_id, String sessionId, Date expire) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("mem_sessionkey", sessionId);
		paramMap.put("mem_sessionlimit", expire);
		mybatis.update("user.updateKeepLogin", paramMap);
	}

	public UserVO getCheckLoginBefore(String loginCookie) {
		return mybatis.selectOne("user.getCheckLoginBefore", loginCookie);
	}
	
	//sns 소셜 회원 등록
	public void setSnsRegister(UserVO mvo) {
		System.out.println("===> [UserDAO] - setSnsRegister() 실행");
		mybatis.insert("user.setSnsRegister", mvo);
	}
	
//========================= 마이페이지 ===========================================
	//회원정보 수정하기
	public void updateMember(UserVO vo) {
		mybatis.update("user.updateMember", vo);		
	}

	//비밀번호 체크
	public int userPwCheck(Map<String, String> map) {
		int userCnt = mybatis.selectOne("user.userPwCheck", map);
		return userCnt;
	}
	
	//이력서 입력
	public void insertResume(Map<String, Object> map) {
		mybatis.insert("user.insertResume", map);
	}

	//이력서 커리어 입력
	public void insertCareer(Map<String, Object> map) {
		mybatis.insert("user.insertCareer", map);
		
	}

	//이력서 첨부파일 업로드
	public void insertFile(Map<String, Object> map) {
		mybatis.insert("user.insertFile", map);		
	}
	

}
