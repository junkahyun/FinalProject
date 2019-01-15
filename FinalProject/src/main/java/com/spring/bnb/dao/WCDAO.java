package com.spring.bnb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.spring.bnb.model.RoomVO;

@Repository
public class WCDAO implements InterWCDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<RoomVO> getAllRoomList() {
		 
		return sqlsession.selectList("wc.getAllRoomList");
	}
}
 