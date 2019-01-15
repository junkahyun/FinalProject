package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSODAO;
import com.spring.bnb.model.MemberVO;

@Service
public class SOService implements InterSOService{
	@Autowired
	private InterSODAO dao;
	
	// 나의 쿠폰 리스트 가져오기
	@Override
	public List<HashMap<String, String>> getMyCoupon(String loginuser) {
		List<HashMap<String,String>> myCouponList = dao.getMyCoupon(loginuser);
		return myCouponList;
	}
	//나의 개인정보 가져오기
	@Override
	public MemberVO getMyInfo(String loginuser) {
		MemberVO myInfo = dao.getMyInfo(loginuser);
		return myInfo;
	}

}
