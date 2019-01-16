package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterKHDAO;
import com.spring.bnb.model.RoomVO;

@Service
public class KHService implements InterKHService {
	
	@Autowired
	private InterKHDAO dao;
	
	// ** 이용규칙 가져오는 메소드 ** //
	@Override
	public List<HashMap<String,String>> getRoomRule() {
		List<HashMap<String,String>> roomRule = dao.getRoomRule();
		return roomRule;
	}
	
	// *** 숙소 정보 가져오는 메소드 *** //
	@Override
	public HashMap<String, Object> getRoomInfo() {
		HashMap<String, Object> roomList = dao.getRoomInfo();
		return roomList;
	}
	
	// *** 숙소 옵션 가져오는 메소드 *** //
	@Override
	public List<HashMap<String, String>> getRoomOptions() {
		List<HashMap<String, String>> roomOptions = dao.getRoomOptions();
		return roomOptions;
	}
	
	// *** 호스트 프로필 사진 가져오기 *** //
	@Override
	public String gethostImage() {
		String hostimage = dao.gethostImage();
		return hostimage;
	}
	
	// *** 숙소 리뷰 가져오는 메소드 *** //
	@Override
	public int getReviewCount() {
		int reviewCount = dao.getReviewCount();
		return reviewCount;
	}

	// *** 숙소 정보 가져오기 *** //
	@Override
	public RoomVO getOneRoomInfo(HashMap<String,String> map) {
		RoomVO oneRoomList = dao.getOneRoomInfo(map);
		return oneRoomList;
	}
	
}
