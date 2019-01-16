package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterHYDAO;
import com.spring.bnb.model.MemberVO;
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
}
