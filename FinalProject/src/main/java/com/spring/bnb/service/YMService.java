package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.spring.bnb.dao.InterYMDAO;

@Service
public class YMService implements InterYMService {
	
	@Autowired
	private InterYMDAO dao; 
}