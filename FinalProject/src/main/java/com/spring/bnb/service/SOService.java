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
	// 나의 정보 수정
	@Override
	public int memberUpdate(MemberVO member) {
		int n = dao.memberUpdate(member);
		return n;
	}
	
	//나의 예약 내역 가져오기
	@Override
	public List<HashMap<String,String>> getMemberReservationList(String loginuser) {
		List<HashMap<String,String>> memberResList = dao.getMemberReservationList(loginuser);
		return memberResList;
	}

}
