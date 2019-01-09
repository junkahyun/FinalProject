package com.spring.bnb.dao;

import org.springframework.stereotype.Repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class SCDAO implements InterSCDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.
}
