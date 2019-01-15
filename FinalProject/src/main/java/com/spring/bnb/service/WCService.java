package com.spring.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterWCDAO;
import com.spring.bnb.model.RoomVO;

@Service
public class WCService implements InterWCService {

	@Autowired
	private InterWCDAO dao;

	@Override
	public List<RoomVO> getAllRoomList() { 
		return dao.getAllRoomList();
	}
}
