package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.MemberVO;

public interface InterSHDAO {

	// 검색없이 회원목록 보여주기
	List<MemberVO> getMemberList();

	// 검색해서 회원목록 보여주기
	List<MemberVO> getSearchMember(HashMap<String, String> paraMap);

	// 회원 상세페이지
	HashMap<String, String> getMemberDetail(String userid);
}
