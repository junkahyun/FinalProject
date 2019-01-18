package com.spring.bnb.dao;

import java.util.List;

import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;

public interface InterSWDAO {

	List<String> getBuildList();  // 숙소유형(대)

	List<String> getOptionList();  // 옵션종류

	List<String> getRoomType();  // 건물유형

	List<String> getRoomRule();  // 이용규칙

	List<String> getBuildDetailList(String buildName1);  // 숙소유형(소)

	List<RoomVO> getRoomList();  // 숙소 리스트보기

	List<ReservationVO> getReservationList(String userid);  // 예약자 현황 보기

	
}
