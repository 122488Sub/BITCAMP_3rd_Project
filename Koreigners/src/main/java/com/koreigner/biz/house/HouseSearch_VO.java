package com.koreigner.biz.house;

import java.util.List;

public class HouseSearch_VO {
		

	//임시 필터값
	
	List<String> do_enList;
	List<String> si_enList;
	int [] build_typeArr;
	int [] room_typeArr; 
	int [] bulid_layersArr;
	int [] floor_layersArr;
	int [] floor_typeArr;
	int depositMin=0,depositMax=99999999;
	int monthly_rentMin=0,monthly_rentMax=99999999;

	

	public HouseSearch_VO() {
		// TODO Auto-generated constructor stub
	}



	public List<String> getDo_enList() {
		return do_enList;
	}



	public void setDo_enList(List<String> do_enList) {
		this.do_enList = do_enList;
	}



	public List<String> getSi_enList() {
		return si_enList;
	}



	public void setSi_enList(List<String> si_enList) {
		this.si_enList = si_enList;
	}



	public int[] getBuild_typeArr() {
		return build_typeArr;
	}



	public void setBuild_typeArr(int[] build_typeArr) {
		this.build_typeArr = build_typeArr;
	}



	public int[] getRoom_typeArr() {
		return room_typeArr;
	}



	public void setRoom_typeArr(int[] room_typeArr) {
		this.room_typeArr = room_typeArr;
	}



	public int[] getBulid_layersArr() {
		return bulid_layersArr;
	}



	public void setBulid_layersArr(int[] bulid_layersArr) {
		this.bulid_layersArr = bulid_layersArr;
	}



	public int[] getFloor_layersArr() {
		return floor_layersArr;
	}



	public void setFloor_layersArr(int[] floor_layersArr) {
		this.floor_layersArr = floor_layersArr;
	}



	public int[] getFloor_typeArr() {
		return floor_typeArr;
	}



	public void setFloor_typeArr(int[] floor_typeArr) {
		this.floor_typeArr = floor_typeArr;
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
	
	
	
	
	
	
	
	
}













