package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

public interface InterBOService {
	
	// 숙소유형 가져오기
	List<String> selectroomtype();
	
	// 건물유형 가져오기
	List<HashMap<String, String>> selectbuildType();
	
	// 건물세부유형 가져오기
	List<HashMap<String,String>> selectbuildTypedetail(String buildType);
	
	// 옵션 가져오기
	List<String> selectoptions();
	
	// 이용규칙 가져오기
	List<String> selectrule();

}
