package com.spring.bnb.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterKHService;

@Controller
public class KHController {
	
	@Autowired
	private InterKHService service;

	// ***** 숙소이용규칙 확인하기 (예약)<aop처리해야댐> ***** //
	@RequestMapping(value="/reservationCheck.air", method= {RequestMethod.GET})
	public String requireLogin_reservationCheck (HttpServletRequest req) {
		
		// where절에 숙소 코드,호스트아이디넣고  
		// 예약날짜, 예약인원, 예약하는 사람 아이디 넣어서 가져오기(homedetail 에서 getparameter로)
		HttpSession session = req.getSession();
		String loginuser = "kongkd2"; //임시 확인용
		session.setAttribute("loginuser", loginuser);
		//===================================================
		String person = "2";//예약 인원(테스트용)
		Calendar current = Calendar.getInstance();
		
		int year = current.get(Calendar.YEAR);
		int month = current.get(Calendar.MONTH)+1;
		int day = current.get(Calendar.DATE);
		
		String roomcode = req.getParameter("roomcode");
		String host_userid = req.getParameter("host_userid");
		roomcode = "10";
		host_userid = "leess";
		
		/*HashMap<String,String> map = new HashMap<String,String>();
		map.put("roomcode", roomcode);
		map.put("host_userid", host_userid);*/
		
		//RoomVO oneRoom = service.getOneRoomInfo(map);
		
		
		// *** 숙소 정보 가져오는 메소드 *** //
		HashMap<String,Object> roomList = service.getRoomInfo();//호스트아이디,숙소코드 파라미터로 넘기기
		
		// *** 숙소 옵션 가져오는 메소드 *** //
		List<HashMap<String,String>> roomoption = service.getRoomOptions();//호스트아이디,숙소코드 파라미터로 넘기기
		
		// *** 숙소 리뷰 가져오는 메소드 *** //
		int reviewCount = service.getReviewCount();
		
		req.setAttribute("roomoption", roomoption);
		req.setAttribute("roomList", roomList);
		req.setAttribute("person", person);
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("day", day);
		req.setAttribute("reviewCount", reviewCount);
		
		return "reservationAndPay/reservationCheck.notiles";
	}
	
	// ***** 일행 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckPeople.air", method= {RequestMethod.POST})
	public String reservationCheckPeople (HttpServletRequest req) {
		
		// where절에 숙소 코드 넣어서 가져오기
		/*-------------getparameter---------------*/
		String fk_roomcode = req.getParameter("fk_roomcode");
		String guestcount = req.getParameter("guestcount");
		String fk_userid = req.getParameter("fk_userid");
		String host_userid = req.getParameter("host_userid");
		String year = req.getParameter("year");
		String checkmonth1 = req.getParameter("checkmonth1");
		String checkmonth2 = req.getParameter("checkmonth2");
		String checkday1 = req.getParameter("checkday1");
		String checkday2 = req.getParameter("checkday2");
		/*-------------end---------------*/
		
		// *** 숙소 정보 가져오는 메소드 *** //
		HashMap<String,Object> roomList = service.getRoomInfo();//호스트아이디, 룸코드 파라미터로 넘기기
		// *** 호스트 프로필 사진 가져오기 *** //
		String hostimg = service.gethostImage();//호스트아이디 파라미터로 넘기기
		// *** 숙소 리뷰 가져오는 메소드 *** //
		int reviewCount = service.getReviewCount();
		
		req.setAttribute("roomList", roomList);//전체 숙소 뽑아내기
		req.setAttribute("hostimg", hostimg);//호스트 프로필 이미지 뽑아내기
		/*-------------------------------------------*/
		req.setAttribute("guestcount", guestcount);//예약 인원
		req.setAttribute("fk_userid", fk_userid);//예약자 아이디
		req.setAttribute("year", year);//체크인,체크아웃 년도
		req.setAttribute("checkmonth1", checkmonth1);//체크인 월
		req.setAttribute("checkmonth2", checkmonth2);//체크아웃 월
		req.setAttribute("checkday1", checkday1);//체크인 일
		req.setAttribute("checkday2", checkday2);//체크아웃 일
		req.setAttribute("reviewCount", reviewCount);
		
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
	// ***** 호스트 등록된 숙소 수정하기 ***** //
	@RequestMapping(value="/hostRoomEdit.air", method= {RequestMethod.GET})
	public String hostRoomEdit (HttpServletRequest req) {
		return "hostRoomEdit/hostRoomEdit.hosttiles_nofooter";
	}
	
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
