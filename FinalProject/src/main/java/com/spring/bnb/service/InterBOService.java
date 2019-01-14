package com.spring.bnb.service;

import java.util.List;

public interface InterBOService {
	
	// 숙소유형 가져오기
	List<String> selectroomtype();
	
	// 건물유형 가져오기
	List<String> selectbuildType();

}
