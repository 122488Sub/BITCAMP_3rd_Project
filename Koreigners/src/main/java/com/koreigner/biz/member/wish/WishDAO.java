package com.koreigner.biz.member.wish;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.job.hire.HireVO;

@Repository("WishDAO")
public class WishDAO {
	//src/main/resources/mappings/house-mapper.xml
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public WishDAO() {
		System.out.println(">> House_DAOMyBatis 객체 생성");	
	}

	public List<WishVO> myBatis_getWishList(WishVO vo) {
		
		List<WishVO> list=mybatis.selectList("wish.getSelectWishList", vo);
		return list;
	}

	public int myBatis_getWishTotal(WishVO vo) {
		return mybatis.selectOne("wish.getWishTotal", vo);
	}

	
	
	public List<HouseAll_VO> myBatis_getHouseWishList(WishVO wishVO) {
		
		System.out.println(wishVO);
		List<HouseAll_VO> houseList=mybatis.selectList("wish.getHouseWishList", wishVO);
		for(HouseAll_VO v : houseList) {
			System.out.println(v.toRoomBoard());
		}
		return houseList;
	}

	public List<HireVO> myBatis_getHireWishList(WishVO wishVO) {
		List<HireVO> hireList=mybatis.selectList("wish.getHireWishList", wishVO);
		return hireList;
	}

	public int myBatis_isWish(WishVO wishVO) {
		return mybatis.selectOne("wish.isWish", wishVO);
	}

	public void myBatis_insertWish(WishVO wishVO) {
		mybatis.insert("wish.insertWish", wishVO);
		
	}

	public void myBatis_deleteWish(WishVO wishVO) {
		mybatis.delete("wish.insertWish", wishVO);
		
		
	}
}








