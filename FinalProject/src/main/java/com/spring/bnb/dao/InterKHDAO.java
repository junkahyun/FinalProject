package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.RoomVO;

public interface InterKHDAO {
	
	// ** 이용규칙 가져오는 메소드 ** //
	List<HashMap<String,String>> getRoomRule();
	
	// *** 숙소 정보 뽑아오는 메소드 *** //
	RoomVO getOneRoomInfo(HashMap<String,String> map);
	
	// *** 리뷰 갯수 가져오기 *** //
	int getReviewCount(HashMap<String,String> map);
	
	// *** 평균 요금 구하는 메소드 *** //
	int getAvgPrice(); 
}
