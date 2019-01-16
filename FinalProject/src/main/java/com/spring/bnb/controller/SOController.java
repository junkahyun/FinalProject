package com.spring.bnb.controller;
 
import java.util.*;

import javax.mail.PasswordAuthentication;
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
import com.spring.common.GoogleMail;
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
	
		List<HashMap<String,String>> myCoupon = service.getMyCoupon(loginuser);

		req.setAttribute("myCoupon", myCoupon);
		req.setAttribute("date", date);
		return "mypage/myCoupon.hometiles";
	}
	@RequestMapping(value="/myEdit.air", method = RequestMethod.GET)
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
	@RequestMapping(value = "/verifyCertification.air", method = RequestMethod.GET)
	public String verifyCertification(HttpServletRequest req,HttpServletResponse res) {
		
	//String userid = req.getParameter("userid");
	String userid = "leess";
	String userCertificationCode = req.getParameter("userCertificationCode");
	System.out.println("verifyCerrificationAction userid : " +userid);
	//유저가 입력한 값과 세션에 입력한 값을 비교해본다
	HttpSession session =  req.getSession();
	String certificationCode = (String)session.getAttribute("certificationCode");
	String msg ="";
	String loc ="";
	
	
	System.out.println(userCertificationCode +"//////" + certificationCode);
	
	if(certificationCode.equalsIgnoreCase(userCertificationCode)) {
		session.setAttribute("userid", userid);
		/*req.setAttribute("userid", userid);*/
		System.out.println("인증 성공 ! : "+userid);
		//사용자가 입력한 값과 인증코드가 동일하다면
		msg = "인증에 성공하였습니다";
		loc = req.getContextPath()+"/myEidt.air";
		//인증에 성공하였을 경우 데이테베이스에 저장해 주어야 하는데 데이터 베이스에 넘길때 pwd 뿐만 아니라 userid도 넘겨야한다.
		//pwdConfirm.do 에 넘어갈때 POST 방식으로 넘어가며 userid 값이 필요하다.
		
	}else {
		msg = "발급된 인증코드를 입력하세요";
		
		loc = req.getContextPath()+"/myEidt.air";
		//인증코드를 잘못 받았다면 다시 처음부터 해라 =>pwdFind.do
	}
	session.setAttribute("userid", userid);

	req.setAttribute("msg",msg);
	req.setAttribute("loc",loc);
	
	session.removeAttribute("certificationCode");
	//sesseion 의 저장된어진 인증코드를 삭제한다
	return "msg";

}
	@RequestMapping(value = "/sendCode.air", method = RequestMethod.GET)
	public void sendCode(HttpServletRequest req,HttpServletResponse res) {
		
		String method = req.getMethod();
		// GET or POST
		//처음에는 겟방식으로 보여짐
		String userid ="leess";
		String email = req.getParameter("changeEmail");
		System.out.println(userid);
		System.out.println(email);
		System.out.println(method);
		if("POST".equalsIgnoreCase(method)) {

		//회원 으로 존재하는 경우
		GoogleMail gmail = new GoogleMail();
		//인증키를 랜덤하게 생성하도록 한다.
		Random rnd = new Random();
		
		String certificationCode="";
		// certificationCode = "ewrfs0003483"
		
		char randchar=' ';
		
		for(int i=0;i<5;i++) {
			// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
			// int rndnum = rnd.nextInt(max-min +1)+min
			// 영문 소문자 'a'부터 'z'까지 중 랜덤하게 1개를 만든다.
			
			
			randchar = (char)(rnd.nextInt('z'-'a'+1)+'a');
			//(char)97;
			certificationCode +=randchar;					
		}				
		int randint=0;
		for(int i=0;i<7;i++) {
			randint = rnd.nextInt(9-0+1)+0;
			certificationCode +=randint;
		}
					
		//랜덤하게 생성한 인증코드를 비밀번호 찾기를 하고자하는 사용자의 email 로 전송시킨다 
			try {			
					gmail.sendmail(email, certificationCode);
					//req.setAttribute("certificationCode", certificationCode);
					HttpSession session =  req.getSession();
					//자바에서 발급한 인증코드를 세션에 저장
					session.setAttribute("certificationCode", certificationCode);
			} catch (Exception e) {
					e.printStackTrace();
					
					req.setAttribute("sendFailmsg", "메일발송이 실패했습니다");
			}

			req.setAttribute("userid", userid);
			req.setAttribute("email", email);

	
		}
		req.setAttribute("method",method);
	}
	@RequestMapping(value = "/myEditEnd.air", method = RequestMethod.POST)
	public String myEditEnd(HttpServletRequest req,HttpServletResponse res) {
		String method = req.getMethod();
		
		if(!"POST".equals(method)) {
/*			String msg="비정상적인 경로입니다.";
			String loc="javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "msg";*/
		}else {
			
			String profileimg = req.getParameter("profileimg");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String month = req.getParameter("month");
			String day = req.getParameter("day");
			String year = req.getParameter("year");			
			String introduction = req.getParameter("introduction");
			String birthday = year+"-"+month+"-"+day;
			
			MemberVO member = new MemberVO();
			
			member.setProfileimg(profileimg);
			member.setEmail(email);
			member.setPhone(phone);
			member.setBirthday(birthday);
			member.setIntroduction(introduction);
		
			int n = service.memberUpdate(member);
			
			if(n==1) {
				
			}else {
				
			}
		}
		
		
		return"mypage/myEdit.hometiles";
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
