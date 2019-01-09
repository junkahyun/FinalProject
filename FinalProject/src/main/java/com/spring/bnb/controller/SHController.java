package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SHController {

	// 관리자 회원관리 페이지
	@RequestMapping(value="/adminMember.air", method= {RequestMethod.GET})
	public String adminMember(HttpServletRequest req) {
	
		return "admin/adminMember";
	}
	
	// 회원 상세 페이지
	@RequestMapping(value="/adminMemberDetail.air", method= {RequestMethod.GET})
	public String adminMemberDetail(HttpServletRequest req) {
	
		return "admin/adminMemberDetail";
	}
	
	
}
