package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterBODAO {
	
	//숙소유형가져오기
	List<String> selectroomtype();
	
	//건물유형가져오기
	List<HashMap<String, String>> selectbuildType();
	
	//건물세부유형가져오기
	List<HashMap<String, String>> selectbuildTypedetail(String buildType);
}
