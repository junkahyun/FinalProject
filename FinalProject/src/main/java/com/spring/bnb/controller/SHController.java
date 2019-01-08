package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class SHController {

	@RequestMapping(value="/adminMember.air", method= {RequestMethod.GET})
	public String adminMember(HttpServletRequest req) {
	
		
		return "admin/";
	
	}

	
}
