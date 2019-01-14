package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSWDAO;

@Service
public class SWService implements InterSWService {
	
	@Autowired
	private InterSWDAO dao;

	@Override
	public List<HashMap<String, String>> getBuildList() {
		
		List<HashMap<String, String>> buildList = dao.getBuildList();
		
		return buildList;
	}

	@Override
	public List<String> getOptionList() {

		List<String> optionList = dao.getOptionList();
		
		return optionList;
	}

	@Override
	public List<String> getRoomType() {

		List<String> roomType = dao.getRoomType();
		
		return roomType;
	}

	@Override
	public List<String> getRoomRule() {

		List<String> roomRule = dao.getRoomRule();
		
		return roomRule;
	}

	
}
