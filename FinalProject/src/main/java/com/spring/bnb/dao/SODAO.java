package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;

//===== #32. DAO 선언  =====
@Repository
//DB Exception Translation
public class SODAO implements InterSODAO {
	
	//===== #33. 의존 객체 주입하기 (DI:Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 나의 쿠폰 리스트 가져오기
	@Override
	public List<HashMap<String, String>> getMyCoupon(String loginuser) {
		
		List<HashMap<String, String>> getMyCoupon = sqlsession.selectList("cso.getMyCoupon",loginuser);
		return getMyCoupon;
	}

	@Override
	public MemberVO getMyInfo(String loginuser) {
		MemberVO myInfo = sqlsession.selectOne("cso.getMyInfo", loginuser);
		return myInfo;
	}
	
}
