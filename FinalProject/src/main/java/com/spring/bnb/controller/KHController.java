package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class KHController {

	// ***** 숙소이용규칙 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheck.air", method= {RequestMethod.GET})
	public String reservationCheck (HttpServletRequest req) {
		
		return "reservationAndPay/reservationCheck.notiles";
	}
	
	// ***** 일행 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckPeople.air", method= {RequestMethod.GET})
	public String reservationCheckPeople (HttpServletRequest req) {
		
		return "reservationAndPay/reservationCheckPeople.notiles";
	}
	
	// ***** 예약 확인 및 결제하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckAndPay.air", method= {RequestMethod.GET})
	public String reservationCheckAndPay (HttpServletRequest req) {
		
		return "reservationAndPay/reservationCheckAndPay.notiles";
	}
	
	// ***** 예약 확인 및 결제하기 (예약) ***** //
	@RequestMapping(value="/reservationFinalConfirm.air", method= {RequestMethod.GET})
	public String reservationFinalConfirm (HttpServletRequest req) {
		
		return "reservationAndPay/reservationFinalConfirm.notiles";
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	// ***** 호스트 등록된 숙소 수정하기 ***** //
	@RequestMapping(value="/hostRoomEdit.air", method= {RequestMethod.GET})
	public String hostRoomEdit (HttpServletRequest req) {
		
		return "hostRoomEdit/hostRoomEdit.notiles";
	}
}
