package com.koreigner.biz.house;

import java.util.List;

public class HouseSearch_VO {
		

	//필터 확인값
	int dosiFilter=0;
	boolean buildFilter=true;
	boolean roomFilter=true;
	
	//도시 필터
	List<String> do_enList;
	List<String> si_enList;
	
	//타입버튼 필터
	List<Integer> build_typeList;
	List<Integer> room_typeList;
	
	
	//가격필터
	
	int stayNum=12;
	int depositMin=0,depositMax=50000;
	int monthly_rentMin=0,monthly_rentMax=50000;
	


	int begin;
	int end;
	
	
	void changeDoSiFilter(int tmp) {
		this.dosiFilter += tmp;
	}
	
	


	public int getDosiFilter() {
		return dosiFilter;
	}




	public void setDosiFilter(int dosiFilter) {
		this.dosiFilter = dosiFilter;
	}




	public boolean isBuildFilter() {
		return buildFilter;
	}




	public void setBuildFilter(boolean buildFilter) {
		this.buildFilter = buildFilter;
	}




	public boolean isRoomFilter() {
		return roomFilter;
	}




	public void setRoomFilter(boolean roomFilter) {
		this.roomFilter = roomFilter;
	}




	public int getBegin() {
		return begin;
	}



	public void setBegin(int begin) {
		this.begin = begin;
	}



	public int getEnd() {
		return end;
	}



	public void setEnd(int end) {
		this.end = end;
	}


	public HouseSearch_VO() {
		// TODO Auto-generated constructor stub
	}



	public List<String> getDo_enList() {
		return do_enList;
	}



	public void setDo_enList(List<String> do_enList) {
		this.do_enList = do_enList;
		
		if(do_enList.size()>1) 
			changeDoSiFilter(1);
	}



	public List<String> getSi_enList() {
		return si_enList;
	}



	public void setSi_enList(List<String> si_enList) {
		this.si_enList = si_enList;
		if(si_enList.size()>1) 
			changeDoSiFilter(1);
		
	}


	public List<Integer> getBuild_typeList() {
		return build_typeList;
		
	}




	public void setBuild_typeList(List<Integer> build_typeList) {
		this.build_typeList = build_typeList;
		
		if(build_typeList.contains(0)||build_typeList.contains(1)||build_typeList.contains(2)){
			buildFilter=true;
		}else buildFilter=false;
	}




	public List<Integer> getRoom_typeList() {
		return room_typeList;
	}




	public void setRoom_typeList(List<Integer> room_typeList) {
		this.room_typeList = room_typeList;
		
		if(room_typeList.contains(0)||room_typeList.contains(1)||room_typeList.contains(2)){
			roomFilter=true;
		}else roomFilter=false;
	}





	public int getDepositMin() {
		return depositMin;
	}



	public void setDepositMin(int depositMin) {
		this.depositMin = depositMin;
	}



	public int getDepositMax() {
		return depositMax;
	}



	public void setDepositMax(int depositMax) {
		this.depositMax = depositMax;
	}



	public int getMonthly_rentMin() {
		return monthly_rentMin;
	}



	public void setMonthly_rentMin(int monthly_rentMin) {
		this.monthly_rentMin = monthly_rentMin;
	}



	public int getMonthly_rentMax() {
		return monthly_rentMax;
	}



	public void setMonthly_rentMax(int monthly_rentMax) {
		this.monthly_rentMax = monthly_rentMax;
	}




	public int getStayNum() {
		return stayNum;
	}




	public void setStayNum(int stayNum) {
		this.stayNum = stayNum;
	}
	
	
	
	
	
	
	
	
}













