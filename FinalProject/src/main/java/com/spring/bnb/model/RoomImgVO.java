package com.spring.bnb.model;

public class RoomImgVO {
	private String roomimg_idx;
	private String fk_roomcode;
	private String img;
	
	
	public String getRoomimg_idx() {
		return roomimg_idx;
	}
	public void setRoomimg_idx(String roomimg_idx) {
		this.roomimg_idx = roomimg_idx;
	}
	public String getFk_roomcode() {
		return fk_roomcode;
	}
	public void setFk_roomcode(String fk_roomcode) {
		this.fk_roomcode = fk_roomcode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
