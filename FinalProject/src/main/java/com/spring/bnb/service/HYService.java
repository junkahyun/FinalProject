package com.spring.bnb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterHYDAO;
import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;

@Service
public class HYService implements InterHYService {
	
	@Autowired
	private InterHYDAO dao;

	@Override
	public RoomVO getRoomByCode(String roomcode) {
		RoomVO roomvo = dao.getRoomByCode(roomcode);
		return roomvo;
	}

	@Override
	public MemberVO logincheck(MemberVO member) {
		MemberVO loginuser = dao.logincheck(member);
		return loginuser;
	}

	@Override
	public int insertLikeRoom(HashMap<String, Object> paraMap) {
		int n = dao.insertLikeRoom(paraMap);
		return n;
	}

	@Override
	public List<HashMap<String, Object>> getMyLikeRoomList(String userid) {
		List<HashMap<String, Object>> resultMap = dao.getMyLikeRoomList(userid);
		return resultMap;
	}

	@Override
	public List<ReviewVO> getSearchReview(HashMap<String, String> paraMap) {
		List<ReviewVO> reviewList = dao.getSearchReview(paraMap);
		return reviewList;
	}

	@Override
	public int checkDuplicateID(String userid) {
		int n = dao.checkDuplicateID(userid);
		return n;
	}

	@Override
	public int insertMember(MemberVO member) {
		int n = dao.insertMember(member);
		return n;
	}

	@Override
	public List<RoomVO> getRecommendRoomList() {
		List<RoomVO> recoomendRoomList = new ArrayList<RoomVO>();
		return recoomendRoomList;
	} 
}
