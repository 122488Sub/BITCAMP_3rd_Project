package com.koreigner.biz.house;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * [T_ROOM_BOARD]
	ROOM_IDX			NUMBER(10,0)
	MEM_EMAIL			VARCHAR2(100 BYTE)
	SUBJECT				VARCHAR2(100 BYTE) //
	DO_ENG				VARCHAR2(100 BYTE) //
	GU_GUN_EUP_ENG		VARCHAR2(100 BYTE) //
	ADDRESS				VARCHAR2(500 BYTE) //
	ADDRESS_DETAIL		NVARCHAR2(200 CHAR) //
	ROOM_REPORTING_DATE	DATE

	[T_ROOM_IMG]
	ROOM_IDX			NUMBER(10,0)
	ROOM_IMG_NAME		VARCHAR2(500 BYTE)
	ROOM_IMG_ORI_NAME	VARCHAR2(500 BYTE)
	
	[T_ROOM_INFO]
	ROOM_IDX			NUMBER(10,0)
	BUILD_TYPE			NUMBER(1,0) //
	ROOM_TYPE			NUMBER(1,0) //
	ROOM_AREA			NUMBER(3,0) //
	BULID_LAYERS		NUMBER(2,0) //
	FLOOR_LAYERS		NUMBER(2,0) //
	FLOOR_TYPE			NUMBER(1,0) //
	STAY_NUM_MIN		NUMBER(2,0) //
	DEPOSIT				NUMBER(10,0) //
	MONTHLY_RENT		NUMBER(10,0) //
	MANAGEMENT_EXPENSE	NUMBER(10,0) //
	AVAILABLE_DATE		VARCHAR2(100 BYTE) //
	
	[T_ROOM_OPTION]
	ROOM_IDX		NUMBER(10,0)
	CLOSET			NUMBER(1,0)//
	DESK			NUMBER(1,0)//
	CHAIR			NUMBER(1,0)//
	BAD_TYPE		NUMBER(1,0)//
	AIR_CONDITIONER	NUMBER(1,0) //
	HEATING			NUMBER(1,0) //
	KITCHEN_STOVE	NUMBER(1,0)//
	REFRIGERATOR	NUMBER(1,0)//
	LAUNDRY			NUMBER(1,0)//
	PET				NUMBER(1,0)//
	INTERNET		NUMBER(1,0)///
	WIFI			NUMBER(1,0)//
	ELEVATOR		NUMBER(1,0)//
	SINK			NUMBER(1,0)//
	BATHROOM		NUMBER(1,0)//
	PARKING			NUMBER(1,0)//
 */
public class HouseAll_VO {
	// common
	int room_idx;
	
	// T_ROOM_BOARD
	String mem_email, subject, do_en, gu_gun_eup_eng, address, address_detail, room_reporting_date;
	
	// T_ROOM_IMG
	String room_img_name, room_img_ori_name;
	List<MultipartFile> file;
	List<String> img_nameList;
	List<String> img_ori_nameList;

	// T_ROOM_INFO
	int build_type, room_type, room_area, bulid_layers, floor_layers, floor_type, stay_num_min, deposit, monthly_rent,
			management_expense; 
	String available_date;

	//t_room_option
	int closet, desk, chair, bad_type, air_conditioner, heating, kitchen_stove, 
		refrigerator, laundry, pet, internet, wifi, elevator, sink, bathroom, parking;		
	
	//임시 필터값
	
	//String select_available_date;
	
	
	
	
	
	
	public HouseAll_VO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public String toRoomBoard() {
		return "RoomBoard [room_idx=" + room_idx + ", mem_email=" + mem_email + ", subject=" + subject + ", do_en=" + do_en
				+ ", gu_gun_eup_eng=" + gu_gun_eup_eng + ", address=" + address + ", address_detail=" + address_detail
				+ ", room_reporting_date=" + room_reporting_date+ "]";
	}
	
	public String toRoomImg() {
		return "RoomImg [room_idx=" + room_idx + ", room_img_name=" + room_img_name
				+ ", room_img_ori_name=" + room_img_ori_name + "]";
	}
	
	public String toRoomInfo() {
		return "RoomInfo [room_idx=" + room_idx + ", build_type=" + build_type + ", room_type=" + room_type +", room_area=" + room_area 
				+ ", bulid_layers=" + bulid_layers + ", floor_layers=" + floor_layers + ", floor_type=" + floor_type
				+ ", stay_num_min=" + stay_num_min + ", deposit=" + deposit + ", monthly_rent=" + monthly_rent
				+ ", management_expense=" + management_expense + ", available_date=" + available_date + "]";
	}
	
	public String toRoomOption() {
		return "RoomOption [room_idx=" + room_idx +", closet=" + closet + ", desk=" + desk + ", chair=" + chair + ", bad_type=" + bad_type + ", air_conditioner="
				+ air_conditioner + ", heating=" + heating + ", kitchen_stove=" + kitchen_stove + ", refrigerator="
				+ refrigerator + ", laundry=" + laundry + ", pet=" + pet + ", internet=" + internet + ", wifi=" + wifi
				+ ", elevator=" + elevator + ", sink=" + sink + ", bathroom=" + bathroom + ", parking=" + parking + "]";
	}

	
	
	

	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDo_en() {
		return do_en;
	}
	public void setDo_en(String do_en) {
		this.do_en = do_en;
	}
	public String getGu_gun_eup_eng() {
		return gu_gun_eup_eng;
	}
	public void setGu_gun_eup_eng(String gu_gun_eup_eng) {
		this.gu_gun_eup_eng = gu_gun_eup_eng;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getRoom_reporting_date() {
		return room_reporting_date;
	}
	public void setRoom_reporting_date(String room_reporting_date) {
		this.room_reporting_date = room_reporting_date;
	}
	public String getRoom_img_name() {
		return room_img_name;
	}
	public void setRoom_img_name(String room_img_name) {
		this.room_img_name = room_img_name;
	}
	public String getRoom_img_ori_name() {
		return room_img_ori_name;
	}
	public void setRoom_img_ori_name(String room_img_ori_name) {
		this.room_img_ori_name = room_img_ori_name;
	}
	public int getBuild_type() {
		return build_type;
	}
	public void setBuild_type(int build_type) {
		this.build_type = build_type;
	}
	public int getRoom_type() {
		return room_type;
	}
	public void setRoom_type(int room_type) {
		this.room_type = room_type;
	}
	public int getRoom_area() {
		return room_area;
	}
	public void setRoom_area(int room_area) {
		this.room_area = room_area;
	}
	public int getBulid_layers() {
		return bulid_layers;
	}
	public void setBulid_layers(int bulid_layers) {
		this.bulid_layers = bulid_layers;
	}
	public int getFloor_layers() {
		return floor_layers;
	}
	public void setFloor_layers(int floor_layers) {
		this.floor_layers = floor_layers;
	}
	public int getFloor_type() {
		return floor_type;
	}
	public void setFloor_type(int floor_type) {
		this.floor_type = floor_type;
	}
	public int getStay_num_min() {
		return stay_num_min;
	}
	public void setStay_num_min(int stay_num_min) {
		this.stay_num_min = stay_num_min;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMonthly_rent() {
		return monthly_rent;
	}
	public void setMonthly_rent(int monthly_rent) {
		this.monthly_rent = monthly_rent;
	}
	public int getManagement_expense() {
		return management_expense;
	}
	public void setManagement_expense(int management_expense) {
		this.management_expense = management_expense;
	}
	public String getAvailable_date() {
		return available_date;
	}
	public void setAvailable_date(String available_date) {
		this.available_date = available_date;
	}
	public int getCloset() {
		return closet;
	}
	public void setCloset(int closet) {
		this.closet = closet;
	}
	public int getDesk() {
		return desk;
	}
	public void setDesk(int desk) {
		this.desk = desk;
	}
	public int getChair() {
		return chair;
	}
	public void setChair(int chair) {
		this.chair = chair;
	}
	public int getBad_type() {
		return bad_type;
	}
	public void setBad_type(int bad_type) {
		this.bad_type = bad_type;
	}
	public int getAir_conditioner() {
		return air_conditioner;
	}
	public void setAir_conditioner(int air_conditioner) {
		this.air_conditioner = air_conditioner;
	}
	public int getHeating() {
		return heating;
	}
	public void setHeating(int heating) {
		this.heating = heating;
	}
	public int getKitchen_stove() {
		return kitchen_stove;
	}
	public void setKitchen_stove(int kitchen_stove) {
		this.kitchen_stove = kitchen_stove;
	}
	public int getRefrigerator() {
		return refrigerator;
	}
	public void setRefrigerator(int refrigerator) {
		this.refrigerator = refrigerator;
	}
	public int getLaundry() {
		return laundry;
	}
	public void setLaundry(int laundry) {
		this.laundry = laundry;
	}
	public int getPet() {
		return pet;
	}
	public void setPet(int pet) {
		this.pet = pet;
	}
	public int getInternet() {
		return internet;
	}
	public void setInternet(int internet) {
		this.internet = internet;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getSink() {
		return sink;
	}
	public void setSink(int sink) {
		this.sink = sink;
	}
	public int getBathroom() {
		return bathroom;
	}
	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	
	public List<String> getImg_nameList() {
		return img_nameList;
	}



	public void setImg_nameList(List<String> img_nameList) {
		this.img_nameList = img_nameList;
	}



	public List<String> getImg_ori_nameList() {
		return img_ori_nameList;
	}



	public void setImg_ori_nameList(List<String> img_ori_nameList) {
		this.img_ori_nameList = img_ori_nameList;
	}



	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	
	

	
	
	
	
	
	
	
}













