package com.koreigner.biz.member.auth;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.koreigner.biz.member.UserVO;

public class SNSLogin {
	//token을 가져온다던지 프로필을 받는다던지 모두 OAuth20Service가 해준다.
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
								.apiSecret(sns.getClientSecret())
								.callback(sns.getRedirectUrl())
								.scope("profile")
								.build(sns.getApi20Instance());
		
		this.sns = sns;
	}

	public Object getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public UserVO getUserProfile(String code) throws Exception {
		System.out.println("===> [getUserProfile] - 진입 ");
		
		System.out.println("넘겨 받은 code : " + code);
//		System.out.println("accessToken data : " + oauthService.getAccessToken(code));
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("---> accessToken data : " + accessToken.getAccessToken());
		System.out.println("---> token_type data : " + accessToken.getTokenType());
		System.out.println("---> expires_in data : " + accessToken.getExpiresIn());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		
		System.out.println("request data : " + request);
		oauthService.signRequest(accessToken, request);
		
		
		
		Response response = oauthService.execute(request);
		
		System.out.println("response data : " + response);
		System.out.println("response tostring :" +response.toString());
		System.out.println("response tostring :" +response.getCode());
		System.out.println("response tostring :" +response.getMessage());
		System.out.println("response tostring :" +response.getClass());
		System.out.println("response tostring :" +response.getHeaders());
		System.out.println("response tostring :" +response.getStream());
		return parseJson(response.getBody());
	}

	private UserVO parseJson(String body) throws Exception {
		System.out.println("###### [SNSLogin] - naver or google로 부터 받은 로그인 데이터 정보 ###### \n      ===> : " + body);
		UserVO mvo = new UserVO();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);

//		String id = rootNode.get("sub").asText();
//		System.out.println("google sub data : " + id);
		if (this.sns.isGoogle()) {
			if (sns.isGoogle()) {
				//구글에서 제공해준 고유 id값(PWD)를 저장한다.
				mvo.setMem_pw(rootNode.get("sub").asText());;
				//이름
				mvo.setMem_name(rootNode.get("name").asText());
				
				//email
				mvo.setMem_id(rootNode.get("email").asText());
				
				//picture
				mvo.setMem_image(rootNode.get("picture").asText());
				
				//Nationality : locale
				mvo.setMem_nationality(rootNode.get("locale").asText());
			}
			
//			JsonNode nameNode = rootNode.path("name");
//			String name = nameNode.get("family_name").asText() + nameNode.get("give_name").asText();
			
//			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
//			while (iterEmails.hasNext()) {
//				JsonNode emailNode = iterEmails.next();
//				String type = emailNode.get("type").asText();
//				if (StringUtils.equals(type, "account")) {
//					String email = emailNode.get("values").asText();
//					break;
//				}
//			}
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			mvo.setMem_pw(resNode.get("id").asText());
			mvo.setMem_id(resNode.get("email").asText());
			mvo.setMem_name(resNode.get("nickname").asText());
			
		}
		
		return mvo;
	}
	
	
	
}
