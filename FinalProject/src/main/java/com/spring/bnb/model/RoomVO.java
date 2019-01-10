package com.spring.bnb.model;

import java.util.List;

public class RoomVO {
	private String roomcode;
	private String fk_userid; 
	private String fk_buildType;
	private String fk_roomoption_idx;
	private String fk_roomType_idx;
	private String roomName;
	private String roomMainImg; 
	private String roomTel;
	private String roomInfo; 
	private String roomPost;
	private String roomSigungu; 
	private String roomSido;
	private String roomBname; 
	private String roomPrice;
	private String peakper;
	private String cleanPay; 
	private String basic_person;
	private String max_person;
	private String person_addpay;
	private String roomcount; 
	private String bathCount;
	private String checkInTime; 
	private String checkOutTime; 
	private String latitude; 
	private String longitude;  
	private String viewcount; 
	private String roomstatus;  
	private String room_warnCount;
	
	//add(getter,setter 아직 안넣음)
	private String homeType;
	private String buildType;
	private String buildType_detail;
	private List<String> roomimgList;
	private List<String> optionList;
	private List<ReviewVO> reviewList;
	
	public RoomVO() {}
	public RoomVO(String roomcode, String fk_userid, String fk_buildType, String fk_roomoption_idx,
			String fk_roomType_idx, String roomName, String roomMainImg, String roomTel, String roomInfo,
			String roomPost, String roomSigungu, String roomSido, String roomBname, String roomPrice, String peakper,
			String cleanPay, String basic_person, String max_person, String person_addpay, String roomcount,
			String bathCount, String checkInTime, String checkOutTime, String latitude, String longitude,
			String viewcount, String roomstatus, String room_warnCount) {
		super();
		this.roomcode = roomcode;
		this.fk_userid = fk_userid;
		this.fk_buildType = fk_buildType;
		this.fk_roomoption_idx = fk_roomoption_idx;
		this.fk_roomType_idx = fk_roomType_idx;
		this.roomName = roomName;
		this.roomMainImg = roomMainImg;
		this.roomTel = roomTel;
		this.roomInfo = roomInfo;
		this.roomPost = roomPost;
		this.roomSigungu = roomSigungu;
		this.roomSido = roomSido;
		this.roomBname = roomBname;
		this.roomPrice = roomPrice;
		this.peakper = peakper;
		this.cleanPay = cleanPay;
		this.basic_person = basic_person;
		this.max_person = max_person;
		this.person_addpay = person_addpay;
		this.roomcount = roomcount;
		this.bathCount = bathCount;
		this.checkInTime = checkInTime;
		this.checkOutTime = checkOutTime;
		this.latitude = latitude;
		this.longitude = longitude;
		this.viewcount = viewcount;
		this.roomstatus = roomstatus;
		this.room_warnCount = room_warnCount;
	}
	public String getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(String roomcode) {
		this.roomcode = roomcode;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getFk_buildType() {
		return fk_buildType;
	}
	public void setFk_buildType(String fk_buildType) {
		this.fk_buildType = fk_buildType;
	}
	public String getFk_roomoption_idx() {
		return fk_roomoption_idx;
	}
	public void setFk_roomoption_idx(String fk_roomoption_idx) {
		this.fk_roomoption_idx = fk_roomoption_idx;
	}
	public String getFk_roomType_idx() {
		return fk_roomType_idx;
	}
	public void setFk_roomType_idx(String fk_roomType_idx) {
		this.fk_roomType_idx = fk_roomType_idx;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomMainImg() {
		return roomMainImg;
	}
	public void setRoomMainImg(String roomMainImg) {
		this.roomMainImg = roomMainImg;
	}
	public String getRoomTel() {
		return roomTel;
	}
	public void setRoomTel(String roomTel) {
		this.roomTel = roomTel;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getRoomPost() {
		return roomPost;
	}
	public void setRoomPost(String roomPost) {
		this.roomPost = roomPost;
	}
	public String getRoomSigungu() {
		return roomSigungu;
	}
	public void setRoomSigungu(String roomSigungu) {
		this.roomSigungu = roomSigungu;
	}
	public String getRoomSido() {
		return roomSido;
	}
	public void setRoomSido(String roomSido) {
		this.roomSido = roomSido;
	}
	public String getRoomBname() {
		return roomBname;
	}
	public void setRoomBname(String roomBname) {
		this.roomBname = roomBname;
	}
	public String getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getPeakper() {
		return peakper;
	}
	public void setPeakper(String peakper) {
		this.peakper = peakper;
	}
	public String getCleanPay() {
		return cleanPay;
	}
	public void setCleanPay(String cleanPay) {
		this.cleanPay = cleanPay;
	}
	public String getBasic_person() {
		return basic_person;
	}
	public void setBasic_person(String basic_person) {
		this.basic_person = basic_person;
	}
	public String getMax_person() {
		return max_person;
	}
	public void setMax_person(String max_person) {
		this.max_person = max_person;
	}
	public String getPerson_addpay() {
		return person_addpay;
	}
	public void setPerson_addpay(String person_addpay) {
		this.person_addpay = person_addpay;
	}
	public String getRoomcount() {
		return roomcount;
	}
	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}
	public String getBathCount() {
		return bathCount;
	}
	public void setBathCount(String bathCount) {
		this.bathCount = bathCount;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getViewcount() {
		return viewcount;
	}
	public void setViewcount(String viewcount) {
		this.viewcount = viewcount;
	}
	public String getRoomstatus() {
		return roomstatus;
	}
	public void setRoomstatus(String roomstatus) {
		this.roomstatus = roomstatus;
	}
	public String getRoom_warnCount() {
		return room_warnCount;
	}
	public void setRoom_warnCount(String room_warnCount) {
		this.room_warnCount = room_warnCount;
	}
	
}