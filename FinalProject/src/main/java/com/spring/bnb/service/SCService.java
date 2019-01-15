package com.spring.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSCDAO;
import com.spring.bnb.model.RoomVO;

@Service
public class SCService implements InterSCService {
	
	@Autowired
	private InterSCDAO dao;
	
	// 해당 유저의 숙소리스트 가져오기 
	@Override
	public List<RoomVO> getRoomList(String userid) {
		List<RoomVO> roomList = dao.getRoomList(userid);
		return roomList;
	}
	// 룸정보 가져오기
	@Override
	public RoomVO getRoom(String roomcode) {
		RoomVO roomvo = dao.getRoom(roomcode);
		return roomvo;
	}

}
