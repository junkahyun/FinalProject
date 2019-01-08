package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterHYDAO;

@Service
public class HYService implements InterHYService {
	
	@Autowired
	private InterHYDAO dao; 
}
