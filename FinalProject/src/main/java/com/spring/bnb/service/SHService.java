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

	// 회원 상세페이지
	@Override
	public HashMap<String, String> getMemberDetail(String userid) {
		
		HashMap<String, String> member = dao.getMemberDetail(userid);
		
		return member;
	}
	
}
