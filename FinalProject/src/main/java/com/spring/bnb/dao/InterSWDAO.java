package com.spring.bnb.dao;

import java.util.List;

public interface InterSWDAO {

	List<String> getBuildList();  // 건물유형

	List<String> getOptionList();  // 옵션종류

	List<String> getRoomType();  // 숙소유형

	List<String> getRoomRule();  // 숙소 이용규칙

}
