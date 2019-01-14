package com.spring.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSWDAO;

@Service
public class SWService implements InterSWService {
	
	@Autowired
	private InterSWDAO dao;

	@Override
	public List<String> getBuildList() {
		
		List<String> buildList = dao.getBuildList();
		
		return buildList;
	} 
}
