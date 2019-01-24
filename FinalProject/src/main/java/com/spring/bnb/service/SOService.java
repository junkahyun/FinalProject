package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSODAO;
import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.ReviewVO;

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
	public void memberUpdate(MemberVO member) {
		System.out.println("11");
		/*int n = */ dao.memberUpdate(member);
		System.out.println("22");
		/*return n;*/
	}
	
	//나의 예약 내역 가져오기
	@Override
	public List<HashMap<String,String>> getMemberReservationList(String loginuser) {
		
		List<HashMap<String,String>> memberResList = dao.getMemberReservationList(loginuser);
		
		return memberResList;
	}
	
	//나의 예약 상세 내역 가져오기
	@Override
	public HashMap<String, String> getMemberReservationDetail(HashMap<String,String> paraMap) {
		HashMap<String, String>  resDetail = dao.getMemberReservationDetail(paraMap);
		return resDetail ;
	}
	@Override
	public HashMap<String, String> getMap(HashMap<String,String> paraMap) {
		HashMap<String, String> rsvLocation = dao.getMap(paraMap);
		return rsvLocation;
	}
	
	// 내가 작성한 후기 
	@Override
	public List<ReviewVO> getMyReview(String userid) {
		List<ReviewVO> myWriteReview  = dao.getMyReview(userid);
		
		return myWriteReview ;
	}
	
	// *** 나에게 쓴 후기 ***
	@Override
	public List<HashMap<String,String>> getHostReview(String userid) {
		List<HashMap<String,String>> hostReview = dao.getHostReview(userid); 
		return hostReview;
	}
	
	// *** 쿠폰 등록하기 ***
	@Override
	public int addCoupon(HashMap<String, String> map) {
		int couponAdd= dao.addCoupon(map);
		return couponAdd;
	}
	// *** 쿠폰 가져오기 ***
	@Override
	public int getCoupon(String coupon) {
		int n= dao.getCoupon(coupon);
		return n;
	}
	// *** 후긱없는 예약코드 가져오기 ***
	@Override
	public List<HashMap<String,String>>  getMyRsvCode(String userid) {
		List<HashMap<String,String>>  myRsvList =  dao.getMyRsvCode(userid);
		return myRsvList;
	}
	
	// *** 나의 투숙예약 취소하기 ***
	@Override
	public int goCancelMyRsv(HashMap<String, String> map) {
		int n = dao.goCancelMyRsv(map);
		return n;
	}


}
