package com.koreigner.biz.resale;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.member.UserVO;
@Repository
public class ResaleDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	UserVO getUser(String mem_id){
		UserVO vo = mybatis.selectOne("getRsUser", mem_id);
		return vo;
	}
	
	void writeImg(List<String> originFileList, List<String> saveFileList) {
		int cnt = 0;
		int insertImg=0;
		for (String origin : originFileList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("originFile", origin);
			map.put("saveFile", saveFileList.get(cnt));
			cnt++;
			
			insertImg = mybatis.insert("writeImg", map);
		}
	}
	
	void writeRs(ResaleVO rsVO) {
		mybatis.insert("writeRs", rsVO);
		
	}
}
