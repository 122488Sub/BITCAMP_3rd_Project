package com.koreigner.biz.member.auth;

public interface SnsUrls {
	static final String NAVER_ACCESS_TOKEN 
						= "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	static final String NAVER_AUTH 
						= "https://nid.naver.com/oauth2.0/authorize";
//	static final String GOOGLE_PROFILE_URL 
//						= "https://www.googleapis.com/plus/v1/people/me";
//	static final String GOOGLE_PROFILE_URL 
//						= "https://people.googleapis.com/v1/contactGroups";
	
//	static final String GOOGLE_PROFILE_URL 
//						= "https://openidconnect.googleapis.com/v1/userinfo";
	
	
	static final String GOOGLE_PROFILE_URL 
						= "https://www.googleapis.com/oauth2/v3/userinfo";
	
	
//	static final String GOOGLE_PROFILE_URL 
//	= "https://www.googleapis.com/oauth2/v3/tokeninfo?access_token=";
//	static final String GOOGLE_PROFILE_URL 
//	= "https://www.googleapis.com/oauth2/v3/userinfo";
	static final String NAVER_PROFILE_URL 
						= "https://openapi.naver.com/v1/nid/me";
	
}
