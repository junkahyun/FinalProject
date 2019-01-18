package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSHDAO;
import com.spring.bnb.model.MemberVO;

@Service
public class SHService implements InterSHService {

	@Autowired
	private InterSHDAO dao;

	// 검색없이 회원목록 보여주기
	@Override
	public List<MemberVO> getMemberList() {

		List<MemberVO> memberList = dao.getMemberList();
		
		return memberList;
	}

	// 검색해서 회원목록 보여주기
	@Override
	public List<MemberVO> getSearchMember(HashMap<String, String> paraMap) {
		
		List<MemberVO> searchMember = dao.getSearchMember(paraMap);
		
		return searchMember;
	}

	// 회원 상세페이지(MemberVO)
	@Override
	public MemberVO getMemberDetail(String userid) {
		
		MemberVO member = dao.getMemberDetail(userid);
		
		return member;
	}

	// 회원 상세페이지(예약코드)
	@Override
	public List<HashMap<String, String>> getReservation(String userid) {
		
		List<HashMap<String, String>> reservation = dao.getReservation(userid);
		
		return reservation;
	}

	// 회원 상세페이지(보유쿠폰)
	@Override
	public List<HashMap<String, String>> getMycoupon(String userid) {
		
		List<HashMap<String, String>> mycoupon = dao.getMycoupon(userid);
		
		return mycoupon;
	}

	// 신고글 가져오기
	@Override
	public List<HashMap<String, String>> getReport() {
		
		List<HashMap<String, String>> reportMap = dao.getReport();
		
		return reportMap;
	}
	
}
