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

}
