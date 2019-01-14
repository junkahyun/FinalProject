package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

public interface InterSOService {
	
	
	// 나의 쿠폰 리스트 가져오기
	List<HashMap<String, String>> getMyCoupon(String string);

}
