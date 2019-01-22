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
	public String reservationCheck (HttpServletRequest req) {
		
		// where절에 숙소 코드,호스트아이디넣고  
		// 예약날짜, 예약인원, 예약하는 사람 아이디 넣어서 가져오기(homedetail 에서 getparameter로)
		HttpSession session = req.getSession();
		String my_userid = "kongkd2"; //(테스트용)
		session.setAttribute("my_userid", my_userid);
		//===================================================
		String guestcount = "1";//예약 인원(테스트용)
		Calendar current = Calendar.getInstance();
		
		int year = current.get(Calendar.YEAR);
		int month = current.get(Calendar.MONTH)+1;
		int day = current.get(Calendar.DATE);
		
		String roomcode = "12";//숙소코드(테스트용)
		String host_userid = "hongkd";//호스트 아이디(테스트용)
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("roomcode", roomcode);
		map.put("host_userid", host_userid);
		
		// *** 숙소 정보 뽑아오는 메소드 *** //
		RoomVO oneRoom = service.getOneRoomInfo(map);
		
		// *** 리뷰 갯수 가져오기 *** //
		int reviewCount = service.getReviewCount(map);
		
		// *** 평균 요금 구하는 메소드 *** //
		int avgPrice = service.getAvgPrice();
		
		session.setAttribute("guestcount", guestcount);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
		session.setAttribute("day", day);
		session.setAttribute("reviewCount", reviewCount);
		session.setAttribute("oneRoom", oneRoom);
		session.setAttribute("avgPrice", avgPrice);
	
		
		return "reservationAndPay/reservationCheck.notiles";
	}
	
	// ***** 일행 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckPeople.air", method= {RequestMethod.GET})
	public String reservationCheckPeople (HttpServletRequest req,HttpSession session) {
		
		// where절에 숙소 코드 넣어서 가져오기
		//-------------getparameter---------------
		String checkmonth1 = req.getParameter("checkmonth1");
		String checkmonth2 = req.getParameter("checkmonth2");
		String checkday1 = req.getParameter("checkday1");
		String checkday2 = req.getParameter("checkday2");
		//-------------end---------------
		
		// *** 평균 요금 구하는 메소드 *** //
		int avgPrice = service.getAvgPrice();
		
		session.setAttribute("checkmonth1", checkmonth1);//체크인 월
		session.setAttribute("checkmonth2", checkmonth2);//체크아웃 월
		session.setAttribute("checkday1", checkday1);//체크인 일
		session.setAttribute("checkday2", checkday2);//체크아웃 일
		session.setAttribute("avgPrice", avgPrice);//평균 요금
		
		return "reservationAndPay/reservationCheckPeople.notiles";
	}
	
	// ***** 예약 확인 및 결제하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckAndPay.air", method= {RequestMethod.GET})
	public String reservationCheckAndPay (HttpServletRequest req,HttpSession session) throws Exception {
		
		String babycount = req.getParameter("babycount");
		String guestcount = req.getParameter("guestcount");
		String totalprice = req.getParameter("totalprice");
		String message = req.getParameter("message");
		String totalpeople = req.getParameter("totalpeople");
		
		session.setAttribute("babycount", babycount);
		session.setAttribute("guestcount", guestcount);
		session.setAttribute("totalprice", totalprice);
		session.setAttribute("message", message);
		session.setAttribute("totalpeople", totalpeople);
		
		return "reservationAndPay/reservationCheckAndPay.notiles";
	}
	
	
	// ***** 예약 확인 및 결제하기 (결제 창 띄우기) ***** //
	@RequestMapping(value="/paymentGateway.air", method= {RequestMethod.GET})
	public String paymentGateway(HttpServletRequest req,HttpSession session) {
		
		String totalprice = req.getParameter("totalprice");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String username = req.getParameter("username");
		
		RoomVO oneroom = (RoomVO)session.getAttribute("oneRoom");
		
		String roomname = oneroom.getRoomName();
		
		session.setAttribute("totalprice", totalprice);
		session.setAttribute("email", email);
		session.setAttribute("phone", phone);
		session.setAttribute("username", username);
		session.setAttribute("roomname", roomname);
		
		return "paymentGateway";
	}
	
	
	
	// ***** 예약 확인 및 결제하기 (결제성공) ***** //
	@RequestMapping(value="/reservationFinalConfirm.air", method= {RequestMethod.GET})
	public String reservationFinalConfirm (HttpServletRequest req,HttpSession session) {
		
		RoomVO oneroom = (RoomVO)session.getAttribute("oneRoom");
		
		String revcode = getOdrCode();//예약 코드 
		String roomcode = oneroom.getRoomcode();//룸 코드
		String my_userid = (String)session.getAttribute("my_userid");
		String guestcount = (String)session.getAttribute("guestcount");
		String babycount = (String)session.getAttribute("babycount");
		String username = (String)session.getAttribute("username");
		String phone = (String)session.getAttribute("phone");
		String email = (String)session.getAttribute("email");
		int year = (int)session.getAttribute("year");
		String checkmonth1 = (String)session.getAttribute("checkmonth1");
		String checkmonth2 = (String)session.getAttribute("checkmonth2");
		String checkday1 = (String)session.getAttribute("checkday1");
		String checkday2 = (String)session.getAttribute("checkday2");
		String totalprice = (String)session.getAttribute("totalprice");
		String message = (String)session.getAttribute("message");
		
		if(Integer.parseInt(checkmonth1) < 10 || Integer.parseInt(checkmonth2) < 10) {
			checkmonth1 = "0"+checkmonth1;
			checkmonth2 = "0"+checkmonth2;
		}
		if(Integer.parseInt(checkday1) < 10 || Integer.parseInt(checkday2) < 10) {
			checkday1 = "0"+checkday1;
			checkday2 = "0"+checkday2;
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("revcode", revcode);
		map.put("roomcode", roomcode);
		map.put("my_userid", my_userid);
		map.put("guestcount", Integer.parseInt(guestcount));
		map.put("babycount", Integer.parseInt(babycount));
		map.put("username", username);
		map.put("phone", phone);
		map.put("email", email);
		map.put("year", String.valueOf(year));
		map.put("checkmonth1", checkmonth1);
		map.put("checkmonth2", checkmonth2);
		map.put("checkday1", checkday1);
		map.put("checkday2", checkday2);
		map.put("totalprice", Integer.parseInt(totalprice));
		map.put("message", message);
		
		// **** 예약테이블에 insert하는 메소드 **** //
		int finalReservation = service.insertReservation(map);
		
		/*if(finalReservation == 1) {
			
		}*/
		
		req.setAttribute("revcode", revcode);
		
		return "reservationAndPay/reservationFinalConfirm.notiles";
	}
	
	// *** 예약 코드 만드는 메소드 *** //
	private String getOdrCode() {
	      
	      Calendar cal = Calendar.getInstance();
	      
	      int year = cal.get(Calendar.YEAR);
	      int month = cal.get(Calendar.MONTH)+1;
	      int day = cal.get(Calendar.DAY_OF_MONTH);
	      
	      // **** 시퀀스 번호 채번해오기 **** //
	      int ordcode = service.getReservCode();
	      
	      return "O"+year+month+day+"-"+ordcode;
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
