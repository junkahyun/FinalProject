package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterSODAO {

	// 나의 쿠폰 리스트 가져오기
	List<HashMap<String, String>> getMyCoupon(String loginuser);

}
