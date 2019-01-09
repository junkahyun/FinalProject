package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterWCDAO;

@Service
public class WCService implements InterWCService {

	@Autowired
	private InterWCDAO dao;
}
