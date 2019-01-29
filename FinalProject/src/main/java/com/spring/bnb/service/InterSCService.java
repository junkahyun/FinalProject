package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.bnb.model.RoomVO;
@Service
public interface InterSCService {

	List<RoomVO> getRoomList(String userid); // 해당 유저의 숙소 리스트 가져오기

	RoomVO getRoomInfo(String roomcode); // 룸정보 가져오기 

	int setRoomImg(HashMap<String, String> paraMap);//룸이미지 추가하기

	int deleteFile(String deleteFilename);// 룸이미지 삭제하기 

	int updateCoverImg(HashMap<String, String> paraMap); // 룸메인이미지 업데이트

	List<RoomVO> roomnameSearch(HashMap<String, String> paraMap);// 숙소이름 검색하기 
}
