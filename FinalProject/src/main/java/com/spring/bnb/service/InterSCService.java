package com.spring.bnb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.bnb.model.RoomVO;
@Service
public interface InterSCService {

	List<RoomVO> getRoomList(String userid); // 해당 유저의 숙소 리스트 가져오기

	RoomVO getRoom(String roomcode); // 룸정보 가져오기 

}
