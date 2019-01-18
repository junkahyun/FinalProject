package com.spring.bnb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;

@Repository
public class KHDAO implements InterKHDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// *** 숙소 이용규칙 가져오는 메소드 *** //
	@Override
	public List<HashMap<String,String>> getRoomRule() {
		List<HashMap<String,String>> roomRule = sqlsession.selectList("kh.getRoomRule");
		return roomRule;
	}
	
    //======================================================================
	// *** 숙소 정보 뽑아오는 메소드 *** //
	@Override
	public RoomVO getOneRoomInfo(HashMap<String,String> map) {
		// *** 숙소 정보 가져오기 *** //
		RoomVO oneRoom = sqlsession.selectOne("kh.getOneRoomInfo",map);// 숙소 정보 가져오기
		
		// *** 호스트 정보 가져오기 *** //
		MemberVO host = sqlsession.selectOne("kh.getOneHost",oneRoom.getFk_userid());// 호스트 정보 가져오기
		oneRoom.setHost(host);
		
		// *** 룸 옵션 *** //
		List<HashMap<String,String>> optionList = sqlsession.selectList("kh.roomOptionList", map);
		oneRoom.setOptionList(optionList);
		
		return oneRoom;
	}
	
	// *** 리뷰 갯수 가져오기 *** //
	@Override
	public int getReviewCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("kh.getReviewCount", map);
		return count;
	}
	
	// *** 평균 요금 구하는 메소드 *** //
	@Override
	public int getAvgPrice() {
		int avg = sqlsession.selectOne("kh.getAvgPrice");
		return avg;
	}
	
	
	
	
	
}
