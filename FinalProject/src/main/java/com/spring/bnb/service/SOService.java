package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSODAO;

@Service
public class SOService implements InterSOService{
	private InterSODAO dao;
	
	// 나의 쿠폰 리스트 가져오기
	@Override
	public List<HashMap<String, String>> getMyCoupon(String loginuser) {
		List<HashMap<String,String>> myCouponList = dao.getMyCoupon(loginuser);
		return myCouponList;
	}

}
