package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSHDAO;
import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReportVO;

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
	public List<ReportVO> getReport() {
		
		List<ReportVO> reportMap = dao.getReport();
		// System.out.println(reportMap);
		return reportMap;

	}

	// 검색조건에 만족하는 회원수를 알아오기
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		
		int count = dao.getTotalCountWithSearch(paraMap);
		
		return count;
	}

	// 검색조건이 없는 회원수를 알아오기
	@Override
	public int getTotalCountNoSearch() {
		
		int count = dao.getTotalCountNoSearch();
		
		return count;
	}

	// 검색조건이 없는것 또는 검색조건이 있는 회원전체목록 가져오기
	@Override
	public List<MemberVO> memberlistPaging(HashMap<String, String> paraMap) {
		
		List<MemberVO> memberList =  dao.memberlistPaging(paraMap);
		
		return memberList;
	}

	// 쿠폰등록하기
	@Override
	public int cpAdd(HashMap<String, String> paramap) {
		
		int n = dao.cpAdd(paramap);
		
		return n;
	}

	// 신고 글쓰기 insert하기
	@Override
	public int vanAdd(HashMap<String, String> paramap) {

		int n = dao.vanAdd(paramap);
		
		return n;
	}
	
}
