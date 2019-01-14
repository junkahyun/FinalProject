package com.spring.bnb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class SWDAO implements InterSWDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.

	@Override
	public List<String> getBuildList() {
		
		List<String> buildList = sqlsession.selectList("sw.getBuildList");
		
		return buildList;
	}

	@Override
	public List<String> getOptionList() {

		List<String> optionList = sqlsession.selectList("sw.getOptionList");
		
		return optionList;
	}

	@Override
	public List<String> getRoomType() {

		List<String> roomType = sqlsession.selectList("sw.getRoomType");
		
		return roomType;
	}

	@Override
	public List<String> getRoomRule() {
		
		List<String> roomRule = sqlsession.selectList("sw.getRoomRule");
		
		return roomRule;
	}

}
