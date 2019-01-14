package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;

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
}
