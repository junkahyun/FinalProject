package com.spring.bnb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.service.InterYMService;
import com.spring.common.AES256;
import com.spring.common.SHA256;

@Controller
public class YMController {

	@Autowired
	private InterYMService service;
	
	@Autowired
	private AES256 aes;

	
	@RequestMapping(value="/join.air", method= {RequestMethod.GET})
	public String join(HttpServletRequest req, MemberVO membervo) {
		

		String day = req.getParameter("day");
		String month = req.getParameter("month");
		String year = req.getParameter("year");
		if(Integer.parseInt(month)<10) {
			month = "0"+month;
		}
		String birth = year +"-" + month +"-"+ day;
		
		membervo.setBirthday(birth);
		System.out.println(membervo.getAddr());
		System.out.println(membervo.getBirthday());
		System.out.println(membervo.getEmail());
		System.out.println(membervo.getGender());
		System.out.println(membervo.getIntroduction());
		System.out.println(membervo.getPhone());
		System.out.println(membervo.getPost());
		System.out.println(membervo.getDetailaddr());
		System.out.println(membervo.getProfileimg());
		System.out.println(membervo.getPwd());
		System.out.println(membervo.getUserid());
		System.out.println(membervo.getUsername());
		
		service.memberJoin(membervo);
		
		return"home/homeDetail.hometiles";
	}
	
	
   }

