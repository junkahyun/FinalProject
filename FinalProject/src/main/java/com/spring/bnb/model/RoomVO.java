package com.spring.bnb.model;

import java.util.HashMap;
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
	private String roomCount; 
	private String bathCount;
	private String checkInTime; 
	private String checkOutTime; 
	private String latitude; 
	private String longitude;  
	private String viewcount; 
	private String roomstatus;  
	private String room_warnCount;
	
	//add(getter,setter 아직 안넣음)
	private String roomType_name;
	private String buildType;
	private String buildType_detail_name;
	private int likeCount;
	private List<String> roomimgList;
	private List<String> optionList;
	private List<ReviewVO> reviewList;
	private MemberVO host;
	private List<HashMap<String,String>> bedroomList;
	public RoomVO() {}
	
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
	public String getRoomCount() {
		return roomCount;
	}
	public void setRoomCount(String roomCount) {
		this.roomCount = roomCount;
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
	
	// 추가
	public String getRoomType_name() {
		return roomType_name;
	}
	public void setRoomType_name(String roomType_name) {
		this.roomType_name = roomType_name;
	}
	public String getBuildType() {
		return buildType;
	}
	public void setBuildType(String buildType) {
		this.buildType = buildType;
	}
	public String getBuildType_detail_name() {
		return buildType_detail_name;
	}
	public void setBuildType_detail_name(String buildType_detail_name) {
		this.buildType_detail_name = buildType_detail_name;
	}
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public List<String> getRoomimgList() {
		return roomimgList;
	}
	public void setRoomimgList(List<String> roomimgList) {
		this.roomimgList = roomimgList;
	}
	public List<String> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<String> optionList) {
		this.optionList = optionList;
	}
	public List<ReviewVO> getReviewList() {
		return reviewList;
	}
	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public MemberVO getHost() {
		return host;
	}

	public void setHost(MemberVO host) {
		this.host = host;
	}

	public List<HashMap<String, String>> getBedroomList() {
		return bedroomList;
	}

	public void setBedroomList(List<HashMap<String, String>> bedroomList) {
		this.bedroomList = bedroomList;
	}
	
}