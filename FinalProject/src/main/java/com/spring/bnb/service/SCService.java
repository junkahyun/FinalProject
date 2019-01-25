package com.spring.bnb.service;

import java.util.HashMap;
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
	public RoomVO getRoomInfo(String roomcode) {
		RoomVO roomvo = dao.getRoomInfo(roomcode);
		return roomvo;
	}
	// 룸이미지 추가하기 
	@Override
	public void setRoomImg(HashMap<String, String> paraMap) {
		dao.setRoomImg(paraMap);
	}
	//룸이미지 삭제하기
	@Override
	public void deleteFile(String imgfilename) {
		dao.deleteFile(imgfilename);		
	}}
