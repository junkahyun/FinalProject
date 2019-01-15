package com.spring.bnb.controller;
 
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.service.InterSOService;
import com.spring.common.AES256;
import com.spring.common.FileManager;
import com.spring.common.MyUtil;

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

		//임시 유저아이디
		String loginuser = "leess"; 
		//
		String date = MyUtil.getNowTime();
		
		System.out.println(date);
		List<HashMap<String,String>> myCoupon = service.getMyCoupon(loginuser);

		req.setAttribute("myCoupon", myCoupon);
		req.setAttribute("date", date);
		return "mypage/myCoupon.hometiles";
	}
	@RequestMapping(value = "/myEdit.air", method = RequestMethod.GET)
	public String myEdit(HttpServletRequest req,HttpServletResponse res) {
		
		
		//로그인 유저 만들기
		String loginuser = "leess";
		////////////////////////
		
		String msg = "";
		String loc = "";
		
		if(loginuser == null) {
			msg = "로그인부터 하세요!";
			loc="javascript:history.back();";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "msg";
		}else {
			//나의 개인정보 가져오기
			MemberVO myInfo = new MemberVO();
			myInfo = service.getMyInfo(loginuser);
			
			int gender = myInfo.getGender();
			String str_gender = "";
			switch (gender) {
			case 1:
				str_gender = "Male";
				break;
			case 2:
				str_gender = "Female";
				break;

			default: str_gender = "Other";
				break;
			}
			String birthday= myInfo.getBirthday();
			Date date = new Date();
			
			String birthdayYY = birthday.substring(0, 4);
			String birthdayMM = birthday.substring(5,7);
			String birthdayDD = birthday.substring(8,10);

			req.setAttribute("birthdayYY", birthdayYY);
			req.setAttribute("birthdayMM", birthdayMM);
			req.setAttribute("birthdayDD", birthdayDD);
			req.setAttribute("str_gender", str_gender);
			req.setAttribute("myInfo", myInfo);
			return "mypage/myEdit.hometiles";
		}
		

		
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
