package com.spring.bnb.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.bnb.service.InterHYService;

@Controller
public class RoomVO {
	@Autowired
	private InterHYService service; 
	
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
	public RoomVO(String roomcode) {
		/*this.roomcode = roomcode;
		RoomVO roomvo = service.getRoomByCode(roomcode);
		this.fk_userid = roomvo.getFk_userid();
		this.fk_buildType = roomvo.getFk_buildType();
		this.fk_roomoption_idx = roomvo.getFk_roomoption_idx();
		this.fk_roomType_idx = roomvo.getFk_roomType_idx();
		this.roomName = roomvo.getRoomName();
		this.roomMainImg = roomvo.getRoomMainImg();
		this.roomTel = roomvo.getRoomTel();
		this.roomInfo = roomvo.getRoomInfo();
		this.roomPost = roomvo.getRoomPost();
		this.roomSigungu = roomvo.getRoomSigungu();
		this.roomSido = roomvo.getRoomSido();
		this.roomBname = roomvo.getRoomBname();
		this.roomPrice = roomvo.getRoomPrice();
		this.peakper = roomvo.getPeakper();
		this.cleanPay = roomvo.getCleanPay();
		this.basic_person = roomvo.getBasic_person();
		this.max_person = roomvo.getMax_person();
		this.person_addpay = roomvo.getPerson_addpay();
		this.roomcount = roomvo.getRoomcount();
		this.bathCount = roomvo.getBathCount();
		this.checkInTime = roomvo.getCheckInTime();
		this.checkOutTime = roomvo.getCheckOutTime();
		this.latitude = roomvo.getLatitude();
		this.longitude = roomvo.getLongitude();
		this.viewcount = roomvo.getViewcount();
		this.roomstatus = roomvo.getRoomstatus();
		this.room_warnCount = roomvo.getRoom_warnCount();*/
		getRoomByCode(roomcode);
	}
	public RoomVO getRoomByCode(String roomcode) {
		RoomVO roomvo = service.getRoomByCode(roomcode);
		return roomvo;
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
	
	// 추가
	public String getHomeType() {
		return homeType;
	}
	public void setHomeType(String homeType) {
		this.homeType = homeType;
	}
	public String getBuildType() {
		return buildType;
	}
	public void setBuildType(String buildType) {
		this.buildType = buildType;
	}
	public String getBuildType_detail() {
		return buildType_detail;
	}
	public void setBuildType_detail(String buildType_detail) {
		this.buildType_detail = buildType_detail;
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
	
}