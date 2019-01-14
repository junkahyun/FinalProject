package com.spring.bnb.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterSOService;
import com.spring.common.AES256;
import com.spring.common.FileManager;

@Controller
public class SOController {
	@Autowired
	private InterSOService service;  
	
	@Autowired
	private AES256 aes;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "/myCoupon.air", method = RequestMethod.GET)
	public String myCoupon(HttpServletRequest req) {

		List<HashMap<String,String>> myCoupon = new ArrayList<HashMap<String,String>>();
		myCoupon = service.getMyCoupon("leess");
		
		
		return "mypage/myCoupon.hometiles";
	}
	@RequestMapping(value = "/myEdit.air", method = RequestMethod.GET)
	public String myEdit(HttpServletRequest req,HttpServletResponse res) {
		
		
		return "mypage/myEdit.hometiles";
	}
	@RequestMapping(value = "/myReservation.air", method = RequestMethod.GET)
	public String myReservation() {
		return "mypage/myReservation.hometiles";
	}
	@RequestMapping(value = "/myReservationCancelDetail.air", method = RequestMethod.GET)
	public String myReservationCancelDetail() {
		return "mypage/myReservationCancelDetail.hometiles";
	}
	@RequestMapping(value = "/myReservationDetail.air", method = RequestMethod.GET)
	public String myReservationDetail() {
		return "mypage/myReservationDetail.hometiles";
	}
	
	@RequestMapping(value = "/myReservationScheduleDetail.air", method = RequestMethod.GET)
	public String myReservationScheduleDetail() {
		return "mypage/myReservationScheduleDetail.hometiles";
	}
	@RequestMapping(value = "/review.air", method = RequestMethod.GET)
	public String review() {
		
		return "mypage/review.hometiles";
	}
	@RequestMapping(value = "/couponReg.air", method = RequestMethod.POST)
	public String couponReg(HttpServletRequest req, HttpServletResponse res) {
		   String method = req.getMethod();
		   System.out.println(method);
		return "mypage/couponReg.notiles";
	}
	
	@RequestMapping(value = "/couponRegEnd.air", method = RequestMethod.POST)
	public String couponRegEnd(HttpServletRequest req, HttpServletResponse res) {

		return "mypage/couponRegEnd.notiles";
	}
	
	
	@RequestMapping(value = "/myReservationMAP.air", method = RequestMethod.GET)
	public String myReservationMAP(HttpServletRequest req, HttpServletResponse res) {

		return "mypage/myReservationMAP.notiles";
	}
	
	@RequestMapping(value = "/ddd.air", method = RequestMethod.GET)
	public String ddd(HttpServletRequest req, HttpServletResponse res) {

		return "hostAd/ddd.hosttiles";
	}
	
	@RequestMapping(value = "/dddd.air", method = RequestMethod.GET)
	public String dddd(HttpServletRequest req, HttpServletResponse res) {

		return "mypage/dddd.hometiles";
	}
	
	
}
