package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.RoomVO;

public interface InterKHService {
	
	// ** 이용규칙 가져오는 메소드 ** //
	List<HashMap<String,String>> getRoomRule();
	
	// *** 숙소 정보 가져오는 메소드 *** //
	HashMap<String,Object> getRoomInfo();
	
	// *** 숙소 옵션 가져오는 메소드 *** //
	List<HashMap<String,String>> getRoomOptions();
	
	// *** 호스트 프로필 사진 가져오기 *** //
	String gethostImage();
	
	// *** 숙소 리뷰 가져오는 메소드 *** //
	int getReviewCount();
	
	RoomVO getOneRoomInfo(HashMap<String,String> map);
	
}
