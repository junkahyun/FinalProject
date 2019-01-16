package com.spring.bnb.dao;

import java.util.List;

import com.spring.bnb.model.RoomVO;

public interface InterSWDAO {

	List<String> getBuildList();  // 건물유형(대)

	List<String> getOptionList();  // 옵션종류

	List<String> getRoomType();  // 숙소유형

	List<String> getRoomRule();  // 숙소 이용규칙

	List<String> getBuildDetailList(String buildName1);  // 건물유형(소)

	List<RoomVO> getRoomList();  // 숙소 리스트 불러오기

	
}
