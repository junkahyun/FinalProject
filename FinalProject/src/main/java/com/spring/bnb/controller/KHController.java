package com.spring.bnb.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterKHService;

@Controller
public class KHController {
	
	@Autowired
	private InterKHService service;

	// ***** 숙소이용규칙 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheck.air", method= {RequestMethod.GET})
	public String reservationCheck (HttpServletRequest req) {
		
		// where절에 숙소 코드,호스트아이디넣고  
		// 예약날짜, 예약인원, 예약하는 사람 아이디 넣어서 가져오기(homedetail 에서 getparameter로)
		
		// *** 숙소 정보 가져오는 메소드 *** //
		HashMap<String,Object> roomList = service.getRoomInfo();
		
		// *** 숙소 옵션 가져오는 메소드 *** //
		List<HashMap<String,String>> roomoption = service.getRoomOptions();
		
		
		req.setAttribute("roomoption", roomoption);
		req.setAttribute("roomList", roomList);
		
		
		return "reservationAndPay/reservationCheck.notiles";
	}
	
	// ***** 일행 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckPeople.air", method= {RequestMethod.GET})
	public String reservationCheckPeople (HttpServletRequest req) {
		
		// where절에 숙소 코드 넣어서 가져오기
		// *** 숙소 정보 가져오는 메소드 *** //
		HashMap<String,Object> roomList = service.getRoomInfo();
		
		// *** 호스트 프로필 사진 가져오기 *** //
		String hostimg = service.gethostImage();
		
		
		req.setAttribute("roomList", roomList);
		req.setAttribute("hostimg", hostimg);
		return "reservationAndPay/reservationCheckPeople.notiles";
	}
	
	// ***** 예약 확인 및 결제하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckAndPay.air", method= {RequestMethod.GET})
	public String reservationCheckAndPay (HttpServletRequest req) {
		
		return "reservationAndPay/reservationCheckAndPay.notiles";
	}
	
	// ***** 예약 확인 및 결제하기 (결제 창 띄우기) ***** //
	@RequestMapping(value="/paymentGateway.air", method= {RequestMethod.GET})
	public String paymentGateway(HttpServletRequest req) {
		
		return "paymentGateway";
	}
	
	// ***** 예약 확인 및 결제하기 (결제성공) ***** //
	@RequestMapping(value="/reservationFinalConfirm.air", method= {RequestMethod.GET})
	public String reservationFinalConfirm (HttpServletRequest req) {
		
		return "reservationAndPay/reservationFinalConfirm.notiles";
	}

	///////////////////////////////////////////////////////////////////////////////////
	
	// ***** 호스트 등록된 숙소 수정하기(기본요금 수정) ***** //
	@RequestMapping(value="/changeDefaultRoomCharge.air", method= {RequestMethod.GET})
	public String changeDefaultRoomCharge (HttpServletRequest req) {
		return "hostRoomEdit/changeDefaultRoomCharge.hosttiles_nofooter";
	}
	
	// ***** 호스트 등록된 숙소 수정하기(추가요금 수정) ***** //
	@RequestMapping(value="/changePlusRoomCharge.air", method= {RequestMethod.GET})
	public String changePlusRoomCharge (HttpServletRequest req) {
		return "hostRoomEdit/changePlusRoomCharge.hosttiles_nofooter";
	}
	
	// ***** 호스트 등록된 숙소 수정하기(체크인과 체크아웃 수정) ***** //
	@RequestMapping(value="/changeCheckInCheckOut.air", method= {RequestMethod.GET})
	public String changeCheckInCheckOut (HttpServletRequest req) {
		return "hostRoomEdit/changeCheckInCheckOut.hosttiles_nofooter";
	}

	// ***** 호스트 등록된 숙소 수정하기(숙박인원 수정) ***** //
	@RequestMapping(value="/changeHostingPeople.air", method= {RequestMethod.GET})
	public String changeHostingPeople (HttpServletRequest req) {
		return "hostRoomEdit/changeHostingPeople.hosttiles_nofooter";
	}

	// ***** 호스트 등록된 숙소 수정하기(편의시설 및 이용규칙 수정) ***** //
	@RequestMapping(value="/changeConvenienceAndRule.air", method= {RequestMethod.GET})
	public String changeConvenienceAndRule (HttpServletRequest req) {
		
		// ** 이용규칙 가져오는 메소드 ** //
		List<HashMap<String,String>> roomRule = service.getRoomRule();
		
		req.setAttribute("roomRule", roomRule);
		
		return "hostRoomEdit/changeConvenienceAndRule.hosttiles_nofooter";
	}

}
