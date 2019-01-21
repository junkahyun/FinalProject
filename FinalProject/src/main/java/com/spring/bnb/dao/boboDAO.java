package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class boboDAO implements InterBODAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 숙소유형 가져오기
	@Override
	public List<String> selectroomtype() {	
		List<String> roomtype = sqlsession.selectList("bobo.selectroomtype");
		return roomtype;
	}

	// 건물유형 가져오기
	@Override
	public List<HashMap<String, String>> selectbuildType() {
		List<HashMap<String, String>> buildType = sqlsession.selectList("bobo.selectbuildType");
		return buildType;
	}

	// 건물세부유형 가져오기
	@Override
	public List<HashMap<String, String>> selectbuildTypedetail(String buildType) {
		List<HashMap<String, String>> buildTypedetail = sqlsession.selectList("bobo.selectbuildTypedetail", buildType);
		return buildTypedetail;
	}

	// 옵션 가져오기
	@Override
	public List<String> selectoptions() {
		List<String> options = sqlsession.selectList("bobo.selectoptions");
		return options;
	}

}
