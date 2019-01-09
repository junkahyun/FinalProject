package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterKHDAO;

@Service
public class KHService implements InterKHService {
	
	@Autowired
	private InterKHDAO dao;
}
