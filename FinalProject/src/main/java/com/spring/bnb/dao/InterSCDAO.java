package com.spring.bnb.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.bnb.model.RoomVO;

@Repository
public interface InterSCDAO {

	List<RoomVO> getRoomList(String userid); //해당유저의 숙소리스트 가져오기

}
