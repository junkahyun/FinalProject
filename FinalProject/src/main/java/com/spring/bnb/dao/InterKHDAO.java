package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterKHDAO {
	
	// ** 이용규칙 가져오는 메소드 ** //
	List<HashMap<String,String>> getRoomRule();
	
	// *** 숙소 정보 가져오는 메소드 *** //
	HashMap<String, Object> getRoomInfo();
	
	// *** 숙소 옵션 가져오는 메소드 *** //
	List<HashMap<String, String>> getRoomOptions();
	
	// *** 호스트 프로필 사진 가져오기 *** //
	String gethostImage();
}
