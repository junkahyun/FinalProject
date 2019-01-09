package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterSCService;


@Controller
public class SCController {
	
	@Autowired
	private InterSCService service; 
	
	@RequestMapping(value = "/hostroomList.air", method = RequestMethod.GET)
	public String hostroomList() {
		return "host/hostroomList.hosttiles";
	}
}

