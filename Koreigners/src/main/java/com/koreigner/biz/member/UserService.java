package com.koreigner.biz.member;

public interface UserService {
	
	int userIdCheck(UserVO vo);

	int userNameCheck(UserVO vo);

	void joinUser(UserVO vo) throws Exception;

	int userLoginCheck(UserVO vo);

	void updateAuthstatus(UserVO vo);

	void resetPasswordMail(String email) throws Exception;

	void resetPassword(UserVO vo);
	
}
