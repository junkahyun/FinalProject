package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.bnb.model.RoomVO;

@Repository
public interface InterSCDAO {

	List<RoomVO> getRoomList(String userid); //해당유저의 숙소리스트 가져오기

	RoomVO getRoomInfo(String roomcode);// 룸정보 가져오기
	
	int setRoomImg(HashMap<String, String> paraMap);//룸이미지 추가하기 

	int deleteFile(String imgfilename);//룸이미지 삭제하기

	int updateCoverImg(HashMap<String, String> paraMap);

	List<RoomVO> roomnameSearch(HashMap<String, String> paraMap);

	List<HashMap<String, String>> getReview(String roomcode);

}
