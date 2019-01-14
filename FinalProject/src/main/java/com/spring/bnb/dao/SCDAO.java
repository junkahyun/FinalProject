package com.spring.bnb.dao;

import org.springframework.stereotype.Repository;

import com.spring.bnb.model.RoomVO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class SCDAO implements InterSCDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.
	
	// 해당유저의 숙소리스트 가져오기
	@Override
	public List<RoomVO> getRoomList(String userid) {
		List<RoomVO> roomList = sqlsession.selectList("sc.getRoomList", userid);
		return roomList;
	}
}
