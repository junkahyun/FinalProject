package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.ReviewVO;

public interface InterSOService {
	
	
	// 나의 쿠폰 리스트 가져오기
	List<HashMap<String, String>> getMyCoupon(String loginuser);

	// 쿠폰 등록하기 
	int addCoupon(HashMap<String, String> map);
	
	//나의 개인정보 가져오기
	MemberVO getMyInfo(String loginuser);
	
	//나의 정보 수정
	void memberUpdate(MemberVO member);
	
	//나의 예약 내역 가져오기
	List<HashMap<String,String>> getMemberReservationList(String loginuser);

	//나의 예약 상세 내역 가져오기
	HashMap<String, String> getMemberReservationDetail(HashMap<String,String> paraMap);
	
	// *** 투숙 예약 취소하기 ***
	int goCancelMyRsv(HashMap<String, String> map);

	//나의 예약 위치 가져오기
	HashMap<String, String> getMap(HashMap<String,String> paraMap);
	
	
	// *** 내가 작성한 후기  ***
	List<ReviewVO> getMyReview(String userid);
	// *** 나에게 쓴 후기 ***
	List<HashMap<String,String>> getHostReview(String userid);
	// ***쿠폰 존재 확인하기 ***
	int getCoupon(String coupon);

	// *** 후기 없는 나의 예약코드 리스트 받아오기 ***
	List<HashMap<String,String>> getMyRsvCode(String userid);

	

	


}
