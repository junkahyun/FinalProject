package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;
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
	
	// *** 숙소 정보 가져오는 메소드 *** //
	@Override
	public HashMap<String, Object> getRoomInfo() {
		HashMap<String, Object> roomList = sqlsession.selectOne("kh.getRoomInfo");
		return roomList;
	}
	
	// *** 숙소 옵션 가져오는 메소드 *** //
	@Override
	public List<HashMap<String, String>> getRoomOptions() {
		List<HashMap<String, String>> roomOptions = sqlsession.selectList("kh.getRoomOptions");
		return roomOptions;
	}
	
	// *** 호스트 프로필 사진 가져오기 *** //
	@Override
	public String gethostImage() {
		String hostimage = sqlsession.selectOne("kh.gethostImage");
		return hostimage;
	}
	
	// *** 숙소 리뷰 가져오는 메소드 *** //
	@Override
	public int getReviewCount() {
		int reviewcount = sqlsession.selectOne("kh.getReviewCount");
		return reviewcount;
	}
	
    //======================================================================
	@Override
	public RoomVO getOneRoomInfo(HashMap<String,String> map) {
		RoomVO oneRoom = sqlsession.selectOne("kh.getOneRoomInfo",map);// 숙소 정보 가져오기
		MemberVO host = sqlsession.selectOne("kh.getOneHost",oneRoom.getFk_userid());// 호스트 정보 가져오기
		oneRoom.setHost(host);
		
		return oneRoom;
	}
	
	
}
