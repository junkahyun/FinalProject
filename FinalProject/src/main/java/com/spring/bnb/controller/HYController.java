package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterHYService;
import com.spring.common.AES256;

@Controller
public class HYController {

	//===== #35. 의존객체 주입하기(DI:Dependency Injection)  =====


	@Autowired
	private InterHYService service; 

	@Autowired
	private AES256 aes;
	


	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)

	public String index() {
		return "home/homeDetail.hometiles";
<<<<<<< HEAD
	}
	
	@RequestMapping(value = "/apiTest.air", method = RequestMethod.GET)
	public String apiTest() {
		return "apiTest.notiles";
=======
	}
	@RequestMapping(value = "/hostMain.air", method = RequestMethod.GET)
	public String hostMain() {
		return "host/hostMain.hosttiles";
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
	}

}

