package com.koreigner.biz.member.wish;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreigner.biz.house.HouseAll_VO;
import com.koreigner.biz.job.hire.HireVO;
import com.koreigner.biz.resale.ResaleImgVO;
import com.koreigner.biz.resale.ResaleVO;

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
		
		List<HouseAll_VO> houseList=mybatis.selectList("wish.getHouseWishList", wishVO);
		return houseList;
	}

	public List<HireVO> myBatis_getHireWishList(WishVO wishVO) {
		List<HireVO> hireList=mybatis.selectList("wish.getHireWishList", wishVO);
		return hireList;
	}

	public boolean myBatis_isWish(WishVO wishVO) {
		int count= mybatis.selectOne("wish.isWish", wishVO);
		System.out.println(count);
		boolean result=false;
		if(count!=0) {
			result=true;
		}
		System.out.println("isWish");
		System.out.println(result);
		System.out.println("isWish");
		return result;
	}

	public void myBatis_insertWish(WishVO wishVO) {
		mybatis.insert("wish.insertWish", wishVO);
		
	}

	public void myBatis_deleteWish(WishVO wishVO) {
		mybatis.delete("wish.deleteWish", wishVO);
		
		
	}

	public List<ResaleVO> myBatis_getResaleWishList(WishVO wishVO) {
		List<ResaleVO> resaleList=mybatis.selectList("wish.getResaleWishList", wishVO);
		return resaleList;
	}

	public List<ResaleImgVO> myBatis_getResaleImgWishList(WishVO wishVO) {
		List<ResaleImgVO> resaleImgList=mybatis.selectList("wish.getResaleImgWishList", wishVO);
		return resaleImgList;
	}

	public List<HouseAll_VO> myBatis_getHouseMyAdsList(WishVO wishVO) {
		List<HouseAll_VO> houseList=mybatis.selectList("myads.getHouseMyAdsList", wishVO);
		return houseList;
	}

	public List<HireVO> myBatis_getHireMyAdsList(WishVO wishVO) {
		List<HireVO> hireList=mybatis.selectList("myads.getHireMyAdsList", wishVO);
		return hireList;
	}

	public List<ResaleVO> myBatis_getResaleMyAdsList(WishVO wishVO) {
		List<ResaleVO> resaleList=mybatis.selectList("myads.getResaleMyAdsList", wishVO);
		return resaleList;
	}
}








