package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterYMService;
import com.spring.common.AES256;

@Controller
public class YMController {

	@Autowired
	private InterYMService service;
	
	@Autowired
	private AES256 aes;

	
	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)
	public String login() {
		
		return "home/homeDetail.hometiles";
	}
}