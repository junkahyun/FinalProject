package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterHYService;
import com.spring.common.AES256;

@Controller
public class HYController {
<<<<<<< HEAD
	
=======

	@Autowired
	private InterHYService service; 
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
	
<<<<<<< HEAD
	@Autowired
	private InterHYService service; // �������̽��� ��õ� �޼ҵ常 ��밡���ϴ�.
	
	
=======
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
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
	
	@RequestMapping(value = "/hostroomList.air", method = RequestMethod.GET)
	public String hostroomList() {
		return "host/hostroomList.hosttiles";
	}
}

