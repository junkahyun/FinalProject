package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;

public interface InterSODAO {

	// 나의 쿠폰 리스트 가져오기
	List<HashMap<String, String>> getMyCoupon(String loginuser);

	//나의 정보 가져오기
	MemberVO getMyInfo(String loginuser);
	
	//나의 정보 수정하기
	int memberUpdate(MemberVO member);

	//나의 예약 내역 가져오기
	List<HashMap<String,String>> getMemberReservationList(String loginuser);

	//나의 예약 상세 내역 가져오기
	HashMap<String, String> getMemberReservationDetail(HashMap<String,String> paraMap);

	// 나의 예약 숙소 위치정보 가져오기
	HashMap<String, String> getMap(HashMap<String, String> paraMap);
		
	//내가 작성한 후기
	List<ReviewVO> getMyReview(String userid);

}
