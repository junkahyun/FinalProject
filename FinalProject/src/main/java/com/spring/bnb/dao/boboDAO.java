package com.spring.bnb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class boboDAO implements InterBODAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 숙소유형 가져오기
	public List<String> selectroomtype() {
		
		List<String> roomtype = sqlsession.selectList("bobo.selectroomtype");
		return roomtype;
	}

	// 건물유형 가져오기
	@Override
	public List<String> selectbuildType() {
		List<String> buildType = sqlsession.selectList("bobo.selectbuildType");
		return buildType;
	}

}
