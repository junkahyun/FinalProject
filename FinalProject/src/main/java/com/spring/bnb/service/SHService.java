package com.spring.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSHDAO;
import com.spring.bnb.model.MemberVO;

@Service
public class SHService implements InterSHService {

	@Autowired
	private InterSHDAO dao;

	@Override
	public List<MemberVO> getMemberList() {

		
		
		return null;
	}
	
}
