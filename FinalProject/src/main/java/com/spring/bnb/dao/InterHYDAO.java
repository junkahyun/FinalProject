package com.spring.bnb.dao;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;

public interface InterHYDAO {

	RoomVO getRoomByCode(String roomcode);

	MemberVO logincheck(MemberVO member);

}
