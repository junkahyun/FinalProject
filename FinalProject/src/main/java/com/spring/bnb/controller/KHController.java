package com.spring.bnb.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterKHService;
import com.spring.common.AES256;
import com.spring.common.KHGoogleMail;


@Controller
public class KHController {
	
	@Autowired
	private InterKHService service;
	
	@Autowired
	private AES256 aes;

	// ***** 숙소이용규칙 확인하기 (예약)<aop처리해야댐> ***** //
	
	@RequestMapping(value="/reservationCheck.air", method= {RequestMethod.GET})
	public String reservationCheck (HttpServletRequest req) throws ParseException {
		
		// where절에 숙소 코드,호스트아이디넣고  
		// 예약날짜, 예약인원, 예약하는 사람 아이디 넣어서 가져오기(homedetail 에서 getparameter로)
		HttpSession session = req.getSession();
		String my_userid = "kongkd2"; //(테스트용)
		session.setAttribute("my_userid", my_userid);
		//===================================================
		/*String roomcode = req.getParameter("roomcode");
		String guestCount = req.getParameter("guestCount");
		String babyCount = req.getParameter("babyCount");
		String rsv_checkInDate = req.getParameter("rsv_checkInDate");
		String rsv_checkOutDate = req.getParameter("rsv_checkOutDate");*/
	
		String roomcode = "24";
		String guestCount = "2";
		String babyCount = "1";
		
		// *** 날짜 쪼개기 *** //
		/*String year1 = rsv_checkInDate.substring(0, 4);
		String mon1 = rsv_checkInDate.substring(5, 7);
		String day1 = rsv_checkInDate.substring(8);
		
		String year2 = rsv_checkOutDate.substring(0, 4);
		String mon2 = rsv_checkOutDate.substring(5, 7);
		String day2 = rsv_checkOutDate.substring(8);*/
		
		String year1 = "2019";
		String mon1 = "1";
		String day1 = "23";
		
		String year2 = "2019";
		String mon2 = "2";
		String day2 = "2";
		
		String checkin = "2019-01-31";
		String checkout = "2019-02-06";
		//************************
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("roomcode", roomcode);
		
		// *** 숙소 정보 뽑아오는 메소드 *** //
		RoomVO oneRoom = service.getOneRoomInfo(map);
		
		// *** 리뷰 갯수 가져오기 *** //
		int reviewCount = service.getReviewCount(map);
		
		// *** 평균 요금 구하는 메소드 *** //
		int avgPrice = service.getAvgPrice();
		
		session.setAttribute("checkin", checkin);
		session.setAttribute("checkout", checkout);
		
		session.setAttribute("guestCount", guestCount);
		session.setAttribute("babyCount", babyCount);
		session.setAttribute("year1", year1);
		session.setAttribute("mon1", mon1);
		session.setAttribute("day1", day1);
		session.setAttribute("year2", year2);
		session.setAttribute("mon2", mon2);
		session.setAttribute("day2", day2);
		session.setAttribute("reviewCount", reviewCount);
		session.setAttribute("oneRoom", oneRoom);
		session.setAttribute("avgPrice", avgPrice);
	
		
		return "reservationAndPay/reservationCheck.notiles";
	}
	
	
	
	// ***** 일행 확인하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckPeople.air", method= {RequestMethod.GET})
	public String reservationCheckPeople (HttpServletRequest req,HttpSession session)  {
		
		return "reservationAndPay/reservationCheckPeople.notiles";
	}

	
	
	// ***** 예약 확인 및 결제하기 (예약) ***** //
	@RequestMapping(value="/reservationCheckAndPay.air", method= {RequestMethod.GET})
	public String reservationCheckAndPay (HttpServletRequest req,HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		
		String babycount = req.getParameter("babycount");
		String guestcount = req.getParameter("guestcount");
		String totalprice = req.getParameter("totalprice");
		String message = req.getParameter("message");
		String totalpeople = req.getParameter("totalpeople");
		
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String email = aes.decrypt(loginuser.getEmail());
		String phone = aes.decrypt(loginuser.getPhone());
		
		session.setAttribute("phone", phone);
		session.setAttribute("email", email);
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
		
		RoomVO oneroom = (RoomVO)session.getAttribute("oneRoom");
		
		String roomname = oneroom.getRoomName();
		
		session.setAttribute("totalprice", totalprice);
		session.setAttribute("roomname", roomname);
		
		return "paymentGateway";
	}
	
	
	
	
	
	// ***** 예약 확인 및 결제하기 (결제성공) ***** //
	@RequestMapping(value="/reservationFinalConfirm.air", method= {RequestMethod.GET})
	public String reservationFinalConfirm (HttpServletRequest req,HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		
		RoomVO oneroom = (RoomVO)session.getAttribute("oneRoom");
		MemberVO loginuser  = (MemberVO)session.getAttribute("loginuser");
		
		
		String revcode = getOdrCode();//예약 코드 
		String roomcode = oneroom.getRoomcode();//룸 코드
		String my_userid = loginuser.getUserid();
		String guestCount = (String)session.getAttribute("guestCount");
		String babyCount = (String)session.getAttribute("babyCount");
		String username = loginuser.getUsername();
		String phone = loginuser.getPhone();
		String email = loginuser.getEmail();
		String year1 = (String)session.getAttribute("year1");
		String year2 = (String)session.getAttribute("year2");
		String mon1 = (String)session.getAttribute("mon1");
		String mon2 = (String)session.getAttribute("mon2");
		String day1 = (String)session.getAttribute("day1");
		String day2 = (String)session.getAttribute("day2");
		String totalprice = (String)session.getAttribute("totalprice");
		String message = (String)session.getAttribute("message");
		
		String checkin = "2019-01-31";
		String checkout = "2019-02-03";
		
		
		if(Integer.parseInt(mon1) < 10 || Integer.parseInt(mon2) < 10) {
			mon1 = "0"+mon1;
			mon2 = "0"+mon2;
		}
		if(Integer.parseInt(day1) < 10 || Integer.parseInt(day2) < 10) {
			day1 = "0"+day1;
			day2 = "0"+day2;
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("revcode", revcode);
		map.put("roomcode", roomcode);
		map.put("my_userid", my_userid);
		map.put("guestCount", Integer.parseInt(guestCount));
		map.put("babyCount", Integer.parseInt(babyCount));
		map.put("username", username);
		map.put("phone", aes.encrypt(phone));
		map.put("email", aes.encrypt(email));
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("year1", year1);
		map.put("year2", year2);
		map.put("mon1", mon1);
		map.put("mon2", mon2);
		map.put("day1", day1);
		map.put("day2", day2);
		map.put("totalprice", Integer.parseInt(totalprice));
		map.put("message", message);
		
		// **** 예약테이블에 insert하는 메소드 **** //
		int finalReservation = service.insertReservation(map);
		
		if(finalReservation == 1) { //결제 완료시 메일보내기 
			try {
				KHGoogleMail gmail = new KHGoogleMail();
				StringBuilder sb = new StringBuilder();
				
				// *** 예약자 정보 가져오기 *** //
				ReservationVO rvo = service.getOneReserve(map);
				
				sb.append("<img src='https://ci4.googleusercontent.com/proxy/ycoe9yJWtDXnJKHImcia25D30dkyKMUWkev09437rXQjdXs46I5wDsuZuF7jS8OLh8gCCMZeK5PMFzSb8U-6RXj5c2zjwG0sD2DwMJeD2SrOGQzWpsfp52Qg3X29kLGdKZGDzG2YUO2UgNYqbNgRSwFJug=s0-d-e1-ft#https://a1.muscache.com/airbnb/rookery/dls/logo_standard_2x-c0ed1450d18490825bc37dd6cb23e5c5.png' onClick='javascript:location.href="+req.getContextPath()+"/index.air' style='cursor:pointer; width:100px;'/><br><br>");
				sb.append("<h1>비앤비 에어 영수증</h1><br>");
				sb.append("<span style='font-size:12pt; margin-bottom:5%; '><strong>영수증 ID</strong>: "+rvo.getRsvcode()+" , "+rvo.getPaydate()+"</span><br>");
				sb.append("<hr style='border: 1px solid lightgray;'><br>");
				sb.append("<h1>"+oneroom.getRoomSigungu()+"</h1><br>");
				sb.append("<img src='"+oneroom.getRoomMainImg()+"' style='width:150px;'/><br>");
				sb.append("<span style='font-size:12pt; margin-bottom:5%;'>"+oneroom.getRoomSigungu()+"에서 "+(Integer.parseInt(day2)-Integer.parseInt(day1))+"박 </span><br>");
				sb.append("<hr style='border: 1px solid lightgray;'><br>");
				sb.append("<span style='font-size:12pt;'>"+year1+"년"+mon1+"월"+day1+"일 → "+year2+"년"+mon2+"월"+day2+"일</span><br>");
				sb.append("<span style='font-size:12pt; margin-bottom:5%;'>"+oneroom.getRoomType_name()+". 게스트 "+(Integer.parseInt(guestCount)+Integer.parseInt(babyCount))+""+"명</span><br>");
				sb.append("<hr style='border: 1px solid lightgray;'><br>");
				sb.append("<h1>요금내역</h1>");
				sb.append("<h2>총 금액 (KRW) </h2>"+"<span style='font-size:12pt;'>₩"+totalprice+"</span><br>");
				sb.append("<hr style='border: 1px solid lightgray;'><br>");
				sb.append("<button type='button' style='width:50%; font-size:15pt; margin-bottom:3%; background-color:tomato;'><span style='color:white;'>영수증 인쇄하기</span></button><br>");
				sb.append("<hr style='border: 1px solid lightgray;'><br><p style='font-size:12pt;'><strong>BnbAir Payments UK Ltd.</strong><br>\r\n" + 
						"\r\n" + 
						"BnbAir Payments는 호스트의 대금 수령 한정 대리인입니다. 즉, 회원님이 BnbAir Payments를 통해 결제하면 호스트에 대한 지급 의무를 다하게 됩니다. "
						+ "(1) 호스트의 환불 정책(숙소 페이지에서 확인 가능) 또는 "
						+ "(2) 비앤비에어의 게스트 환불 정책 약관(<span style='color:#00a699;'>www.airbnb.com/terms</span>) "
						+ "궁금하신 사항이 있거나 불만 사항을 제기하려면 BnbAir Payments UK Ltd.(전화번호: +44 203 318 1111)에 문의하세요.</p>");
				
				String emailContents = sb.toString();
			
				gmail.sendmail_OrderFinish(email, username, emailContents);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
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
	

}
