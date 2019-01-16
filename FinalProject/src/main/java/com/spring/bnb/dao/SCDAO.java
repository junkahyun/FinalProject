package com.spring.bnb.dao;

import org.springframework.stereotype.Repository;

import com.spring.bnb.model.RoomVO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class SCDAO implements InterSCDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 해당유저의 숙소리스트 가져오기
	@Override
	public List<RoomVO> getRoomList(String userid) {
		List<RoomVO> roomList = sqlsession.selectList("sc.getRoomList", userid);
		return roomList;
	}
	
	// 룸정보 가져오기
	@Override
	public RoomVO getRoomInfo(String roomcode) {
		RoomVO roomvo = sqlsession.selectOne("sc.getRoom",roomcode);
		
		List<String> roomimgList = sqlsession.selectList("sc.getRoomImgList", roomcode);// 숙소 사진 리스트
		roomvo.setRoomimgList(roomimgList);
		
		List<HashMap<String,String>> bedroomList = sqlsession.selectList("sc.getRoomBedList", roomcode);// 침실 리스트
		roomvo.setBedroomList(bedroomList);
		
		List<HashMap<String,String>> optionList = sqlsession.selectList("sc.getRoomOptionList", roomcode); // 숙소 옵션 리스트
		roomvo.setOptionList(optionList);

		return roomvo;
	}
}
