package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterHYDAO;

//===== #31. Service 선언  =====
@Service
public class HYService implements InterHYService {
	//===== #34. 의존객체 주입하기(DI:Dependency Injection)  =====
	@Autowired
	private InterHYDAO dao; // 인터페이스에 명시된 메소드만 사용가능하다.
}
