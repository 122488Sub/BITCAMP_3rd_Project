package com.koreigner.biz.inform;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("InformDAO")
public class InformDAO {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public InformDAO() {
		System.out.println(">> InformDAO 객체 생성");	
	}

	public List<Map<String, Object>> dao_getSelectSearchList(InformVO informVO) {
		System.out.println("AAAA");
		System.out.println(informVO);
		List<Map<String, Object>> tmp=mybatis.selectList("inform.getSelectSearchList",informVO);
		System.out.println("BBBB");
		return tmp;
	}

	public int dao_informSearchTotal(InformVO informVO) {
		Integer count=mybatis.selectOne("inform.informSearchTotalCount", informVO);
		System.out.println(count);
		return count;
	}

	public int dao_insertInform(InformVO informVO) {
		System.out.println("dao");
		System.out.println(informVO);
		return mybatis.insert("inform.insertInform", informVO);
	}

	public InformVO dao_getInform(int info_idx) {
		InformVO vo = mybatis.selectOne("inform.getInform",info_idx);
		System.out.println(vo);
		return vo;
	}

	public int dao_updateInform(InformVO informVO) {
	
		return mybatis.update("inform.updateInform", informVO) ;
	}

	public int dao_increaseHit(int info_idx) {
	
		return mybatis.update("inform.increaseHit", info_idx);
	}

	public int dao_deleteInform(int info_idx) {
		
		return mybatis.update("inform.deleteInform", info_idx);
	}

	
}








