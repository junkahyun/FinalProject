package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.boboDAO;

@Service
public class boboService implements InterBOService{
	
	@Autowired
	private boboDAO dao;

	// 숙소유형 가져오기
	@Override
	public List<String> selectroomtype() {
		List<String> roomtype = dao.selectroomtype();
		return roomtype;
	}

	// 건물유형 가져오기
	@Override
	public List<HashMap<String, String>> selectbuildType() {
		List<HashMap<String, String>> buildType = dao.selectbuildType();
		return buildType;
	}

	// 건물세부유형 가져오기
	@Override
	public List<HashMap<String, String>> selectbuildTypedetail(String buildType) {
		List<HashMap<String, String>> buildTypedetail = dao.selectbuildTypedetail(buildType);
		return buildTypedetail;
	}

}
