package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*; 

import com.spring.bnb.service.InterWCService;
import com.spring.common.AES256;

@Controller
public class WCController {

	@Autowired
	private InterWCService service;
	
	@Autowired
	private AES256 aes;
	

	@RequestMapping(value = "/main.air", method = RequestMethod.GET)
	public String index_2() {
		return "main/index";
	}
	@RequestMapping(value = "/admin.air", method = RequestMethod.GET)
	public String admin_index() {
		return "admin/index.admintiles";
	}
}
