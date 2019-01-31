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
	/*@Override
	public List<MemberVO> getMemberList(HashMap<String, String> paraMap) {

		List<MemberVO> memberList = dao.getMemberList(paraMap);
		
		return memberList;
	}*/

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
	public List<ReportVO> getReport(HashMap<String, String> paraMap) {
		
		List<ReportVO> reportMap = dao.getReport(paraMap);
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

	// 검색조건에 맞는 회원 수 알아오기
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		
		int n = dao.getTotalCount(paraMap);
		
		return n;
	}

	// 회원삭제하기
	@Override
	public int adminDeleteMember(String userid) {
		
		int n = dao.adminDeleteMember(userid);
		
		return n;
	}

	// 신고게시판의 글 총 갯수 알아오기
	@Override
	public int getTotalCounts(HashMap<String, String> paraMap) {
		
		int n = dao.getTotalCounts(paraMap);
		
		return n;
	}

	// 신고게시글 상세보기 -> 조회수 증가 없이
	@Override
	public ReportVO getReportDetailNo(String report_idx) {

		ReportVO reportvo = dao.getReportDetail(report_idx);
		
		return reportvo;
	}

	// 신고게시글 상세보기 -> 조회수 증가
	@Override
	public ReportVO getReportDetail(String report_idx, String userid) {
		
		ReportVO reportvo = dao.getReportDetail(report_idx);
		
		if(userid != null && !(reportvo.getFk_userid().equals(userid))) {
			dao.upCount(report_idx);
			reportvo = dao.getReportDetail(report_idx);
		}
		
		return reportvo;
	}
	
}
