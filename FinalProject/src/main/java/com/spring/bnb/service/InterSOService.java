package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;

public interface InterSOService {
	
	
	// 나의 쿠폰 리스트 가져오기
	List<HashMap<String, String>> getMyCoupon(String loginuser);

	// *** 쿠폰 등록하기 ***
	int addCoupon(HashMap<String, String> map);
	
	//나의 개인정보 가져오기
	MemberVO getMyInfo(String loginuser);
	
	//나의 정보 수정
	void memberUpdate(MemberVO member);
	
	//나의 예약 내역 가져오기
	List<HashMap<String,String>> getMemberReservationList(String loginuser);

	//나의 예약 상세 내역 가져오기
	HashMap<String, String> getMemberReservationDetail(HashMap<String,String> paraMap);

	//나의 예약 위치 가져오기
	HashMap<String, String> getMap(HashMap<String,String> paraMap);
	
	
	// *** 내가 작성한 후기  ***
	List<ReviewVO> getMyReview(String userid);
	// *** 나에게 쓴 후기 ***
	List<HashMap<String,String>> getHostReview(String userid);
	// ***쿠폰 리스트 가져오기 ***
	List<HashMap<String, String>> getCoupon();

	String getMyRsvCode(String userid);



}
