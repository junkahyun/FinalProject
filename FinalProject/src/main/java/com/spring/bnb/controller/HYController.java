package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterHYService;
import com.spring.common.AES256;

@Controller
public class HYController {
	
	//===== #35. 의존객체 주입하기(DI:Dependency Injection)  =====
	@Autowired
	private InterHYService service; // 인터페이스에 명시된 메소드만 사용가능하다.
	
	// 45. 양방향 암호화 알고리즘인 AES256를 사용하여 암호화/복호화 하기 위한 클래스 의존객체 주입하기(DI:Dependency Injection)
	@Autowired
	private AES256 aes;
	
	@RequestMapping(value = "/index.air", method = RequestMethod.GET)
	public String index() {
		return "home/homeDetail.hometiles";
	}
	@RequestMapping(value = "/apiTest.air", method = RequestMethod.GET)
	public String apiTest() {
		return "apiTest.notiles";
	} 
}

