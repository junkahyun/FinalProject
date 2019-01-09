package com.spring.bnb.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KHDAO implements InterKHDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
}
