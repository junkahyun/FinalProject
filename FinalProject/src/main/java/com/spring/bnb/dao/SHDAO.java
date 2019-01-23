package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReportVO;

@Repository
public class SHDAO implements InterSHDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// 검색없이 회원목록 보여주기
	@Override
	public List<MemberVO> getMemberList() {
		
		List<MemberVO> memberList = sqlsession.selectList("sh.getMemberList");
		
		return memberList;
	}

	// 검색해서 회원목록 보여주기
	@Override
	public List<MemberVO> getSearchMember(HashMap<String, String> paraMap) {
		
		List<MemberVO> searchMember = sqlsession.selectList("sh.getSearchMember", paraMap);
		
		return searchMember;
	}

	// 회원 상세페이지(MemberVO)
	@Override
	public MemberVO getMemberDetail(String userid) {
		
		MemberVO member = sqlsession.selectOne("sh.getMemberDetail", userid);
		
		return member;
	}
	
	// 회원 상세페이지(예약코드)
	@Override
	public List<HashMap<String, String>> getReservation(String userid) {
		
		List<HashMap<String, String>> reservation = sqlsession.selectList("sh.getReservation", userid);
		
		return reservation;
	}

	// 회원 상세페이지(보유쿠폰)
	@Override
	public List<HashMap<String, String>> getMycoupon(String userid) {
		
		List<HashMap<String, String>> mycoupon = sqlsession.selectList("sh.getMycoupon", userid);
		
		return mycoupon;
	}

	// 신고글 가져오기
	@Override
	public List<ReportVO> getReport() {
		
		List<ReportVO> reportMap = sqlsession.selectList("sh.getReport");

		return reportMap;
	}

	// 검색조건에 만족하는 회원수를 알아오기
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		
		int count = sqlsession.selectOne("sh.getTotalCountWithSearch", paraMap);
		
		return count;
	}

	// 검색조건이 없는 회원수를 알아오기
	@Override
	public int getTotalCountNoSearch() {
		
		int count = sqlsession.selectOne("sh.getTotalCountNoSearch");
		
		return count;
	}

	// 검색조건이 없는것 또는 검색조건이 있는 회원전체목록 가져오기
	@Override
	public List<MemberVO> memberlistPaging(HashMap<String, String> paraMap) {
		
		List<MemberVO> memberList = sqlsession.selectList("sh.memberlistPaging", paraMap);
		
		return memberList;
	}

	// 신고 글쓰기 insert하기
	@Override
	public int add(ReportVO reportvo) {
		
		int n = sqlsession.insert("sh.add", reportvo);
		
		return n;
	}

	// 쿠폰등록하기
	@Override
	public int cpAdd(HashMap<String, String> paramap) {
		
		int n = sqlsession.insert("sh.cpAdd", paramap);
		
		return n;
	}
}
