package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KHDAO implements InterKHDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String,String>> getRoomRule() {
		List<HashMap<String,String>> roomRule = sqlsession.selectList("kh.getRoomRule");
		return roomRule;
	}
	
	
}
