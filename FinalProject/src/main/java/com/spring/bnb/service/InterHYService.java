package com.spring.bnb.service;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;

public interface InterHYService {

	RoomVO getRoomByCode(String roomcode);

	MemberVO logincheck(MemberVO member);

}
