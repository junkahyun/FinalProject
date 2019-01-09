package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterHYService;
import com.spring.bnb.service.InterSOService;
import com.spring.common.AES256;

@Controller
public class SOController {
	@Autowired
	private InterSOService service; 
	
	@Autowired
	private AES256 aes;
	
	@RequestMapping(value = "/myCoupon.air", method = RequestMethod.GET)
	public String myCoupon() {
		
		return "mypage/myCoupon.hometiles";
	}
	@RequestMapping(value = "/myEdit.air", method = RequestMethod.GET)
	public String myEdit() {
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
}
