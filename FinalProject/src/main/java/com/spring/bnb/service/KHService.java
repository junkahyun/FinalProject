package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterKHDAO;

@Service
public class KHService implements InterKHService {
	
	@Autowired
	private InterKHDAO dao;
	
	// ** 이용규칙 가져오는 메소드 ** //
	@Override
	public List<HashMap<String,String>> getRoomRule() {
		List<HashMap<String,String>> roomRule = dao.getRoomRule();
		return roomRule;
	}
	
}
