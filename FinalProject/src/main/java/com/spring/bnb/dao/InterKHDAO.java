package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterKHDAO {
	
	// ** 이용규칙 가져오는 메소드 ** //
	List<HashMap<String,String>> getRoomRule();
	
	

}
