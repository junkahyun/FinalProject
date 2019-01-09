package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.boboDAO;

@Service
public class boboService {
	
	@Autowired
	private boboDAO dao;

}
