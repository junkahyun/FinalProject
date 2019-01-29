package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;

public interface InterKHService {
	
	// *** 숙소 정보 뽑아오는 메소드 *** //
	RoomVO getOneRoomInfo(HashMap<String,Object> map);
	
	// *** 리뷰 갯수 가져오기 *** //
	int getReviewCount(HashMap<String,Object> map);
	
	// *** 평균 요금 구하는 메소드 *** //
	int getAvgPrice();
	
	// *** 예약 시퀀스 채번해오기 *** //
	int getReservCode();
	
	// *** 숙소 예약하는 메소드 *** //
	int insertReservation(HashMap<String,Object> map);
	
	
	// *** 예약자 정보 가져오기 *** //
	ReservationVO getOneReserve(HashMap<String,Object> map);
	
	
}
