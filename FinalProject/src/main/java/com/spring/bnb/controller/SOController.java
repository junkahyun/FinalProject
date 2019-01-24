package com.spring.bnb.controller;
 
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.apache.commons.digester.Substitutor;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.service.InterSOService;
import com.spring.common.AES256;
import com.spring.common.FileManager;
import com.spring.common.GoogleMail;
import com.spring.common.MyUtil;
import com.sun.org.apache.bcel.internal.generic.CPInstruction;

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
		
		HttpSession session = req.getSession();
		MemberVO mvoUser = (MemberVO)session.getAttribute("loginuser");
	
		if(mvoUser == null) {
		
			String msg = "먼저 로그인 해주세요!";
			String loc="/bnb/index.air;"; 
			req.setAttribute("msg",msg);
			req.setAttribute("loc", loc); 
			
			return "msg"; 
		}else {		
			String userid = mvoUser.getUserid();
			
			String date = MyUtil.getNowTime();
		
			List<HashMap<String,String>> myCoupon = service.getMyCoupon(userid);

			req.setAttribute("myCoupon", myCoupon);
			req.setAttribute("date", date);
			return "mypage/myCoupon.hometiles";			
		}
		
	}

	@RequestMapping(value="/myEdit.air", method = RequestMethod.GET)
	public String requireLogin_myEditShowInfo(HttpServletRequest req,HttpServletResponse res) {		

		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		/*try {*/
			//나의 개인정보 가져오기
			MemberVO myInfo = new MemberVO();
			myInfo = service.getMyInfo(userid);
			
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
			
		/*	String email = aes.decrypt(myInfo.getEmail());
			myInfo.setEmail(email);*/
			
			String birthdayYY = birthday.substring(0, 4);
			String birthdayMM = birthday.substring(5,7);
			String birthdayDD = birthday.substring(8,10);

			req.setAttribute("birthdayYY", birthdayYY);
			req.setAttribute("birthdayMM", birthdayMM);
			req.setAttribute("birthdayDD", birthdayDD);
			req.setAttribute("str_gender", str_gender);
			req.setAttribute("myInfo", myInfo);
	/*		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			return "mypage/myEdit.hometiles";		
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
	JSONObject jobj = new JSONObject();
	
	jobj.put("ok", "ok");
	String str_json = jobj.toString();
	req.setAttribute("str_json", str_json);
	
	return "JSON";

}
	@RequestMapping(value = "/sendCode.air", method = RequestMethod.POST)
	public String sendCode(HttpServletRequest req,HttpServletResponse res) {
		
		String method = req.getMethod();
		// GET or POST
		//처음에는 겟방식으로 보여짐
		String userid ="leess";
		String email = req.getParameter("changeEmail");
		//if("POST".equalsIgnoreCase(method)) {

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

	//}
			JSONObject jobj = new JSONObject();
			jobj.put("ok", "ok");
			String str_json = jobj.toString();
			req.setAttribute("str_json", str_json);
		req.setAttribute("method",method);
		return "JSON";

	}
	
	// 나의 정보 수정
	@RequestMapping(value = "/myEditEnd.air", method = RequestMethod.POST)
	public String myEditEnd(HttpServletRequest req,@RequestParam("file") MultipartFile multipartFile, MultipartRequest mtreq) throws FileNotFoundException, IOException {
		String method = req.getMethod();
		
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		System.out.println(userid);
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String introduction = req.getParameter("introduction");
		String str_post = req.getParameter("post");
		int post = Integer.parseInt(str_post);
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("detailAddr");
		
		MemberVO member = new MemberVO();
		
		if(!"POST".equals(method)) {
			String msg="비정상적인 경로입니다.";
			String loc="javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "msg";
		}else {
			
					String filename = "";
					if(!multipartFile.isEmpty()) {
						ServletContext application = req.getServletContext();
						String realPath = application.getRealPath("/resources/images/profile");
						
						filename = multipartFile.getOriginalFilename();
						
						int index = filename.lastIndexOf("\\");
						filename = filename.substring(index +1);
						
						File file = new File(realPath,filename);
						if(file.exists()) {
							filename = System.currentTimeMillis()+"_"+filename;
							file = new File(realPath,filename);
						}
						System.out.println("업로드 경로 "+realPath);
						System.out.println("업로드 파일명"+filename);
						
						
							IOUtils.copy(multipartFile.getInputStream(), new FileOutputStream(file));
							member.setProfileimg(filename);
							System.out.println("11"+filename);
						
					}else {
						filename = req.getParameter("profileimg");
						System.out.println(filename);
						member.setProfileimg(filename);
						System.out.println("파일이 존재하지 않거나 파일 크기가 0입니다.");
					}
			
				
	
				/*member.setEmail(aes.encrypt(email));
				member.setPhone(aes.encrypt(phone));*/
				member.setEmail(email);
				member.setPhone(phone);
				member.setIntroduction(introduction);
				member.setPost(post);
				member.setAddr(addr);
				member.setDetailAddr(detailAddr);
				member.setUserid(userid);
				
				/*int n = */service.memberUpdate(member);
				
		/*		if(n==1) {
					System.out.println("업데이트 성공");
				}else {
					System.out.println("업데이트 실패!");
				}*/
		}		
		String msg="회원정보 수정 성공!";
		String loc="/bnb/myEdit.air";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return"msg"; 
	}


	@RequestMapping(value = "/myReservation.air", method = RequestMethod.GET)
	public String requireLogin_myReservation(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		System.out.println("myReservation : "+userid);
		List<HashMap<String,String>> memberResList = service.getMemberReservationList(userid);
		//회원 예약 내용 가져오기

		req.setAttribute("memberResList", memberResList);
		req.setAttribute("userid", userid);
		
		return "mypage/myReservation.hometiles";
	}
	
	@RequestMapping(value = "/myReservationCancelDetail.air", method = RequestMethod.GET)
	public String myReservationCancelDetail(HttpServletRequest req, HttpServletResponse res) {
	
		return "mypage/myReservationCancelDetail.hometiles";
	}
	
	// 투숙 완료예약 상세보기
	@RequestMapping(value = "/myReservationDetail.air", method = RequestMethod.GET)
	public String requireLogin_myReservationDetail(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		
		String rsvcode = req.getParameter("rsvcode");
		
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("rsvcode", rsvcode);
		paraMap.put("userid",userid);
		
		
		HashMap<String,String> resDetail = service.getMemberReservationDetail(paraMap);
		req.setAttribute("resDetail", resDetail);
		return "mypage/myReservationDetail.hometiles";
	}
	// 투숙 예정 예약 상세보기
	@RequestMapping(value = "/myReservationScheduleDetail.air", method = RequestMethod.GET)
	public String requireLogin_myReservationScheduleDetail(HttpServletRequest req, HttpServletResponse res) {
		//	*** 아이디 정보 가져오기 ***
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		String rsvcode = req.getParameter("rsvcode");
		
			
			HashMap<String,String> paraMap = new HashMap<String,String>();
			paraMap.put("userid", userid);
			paraMap.put("rsvcode", rsvcode);
			
			HashMap<String, String> myReservationScheduleDetail = service.getMemberReservationDetail(paraMap);
			/*
			System.out.println("email : " + myReservationScheduleDetail.get("email"));
			 
			String email = aes.decrypt(myReservationScheduleDetail.get("email"));
			 
			System.out.println("복호화  email : "+email);
			myReservationScheduleDetail.put("email", email);
			System.out.println(myReservationScheduleDetail.get("email"));
			*/
			req.setAttribute("myRsvDetail", myReservationScheduleDetail);
			
		return "mypage/myReservationScheduleDetail.hometiles";
	}
	
	// 나의 후기 보기
	@RequestMapping(value = "/review.air", method = RequestMethod.GET)
	public String requireLogin_review(HttpServletRequest req, HttpServletResponse res) {
		//	*** 아이디 정보 가져오기 ***
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		
		//	*** 내가 쓴 후기 ***
		List<ReviewVO> myWriteReview = service.getMyReview(userid);
		
		// *** 나에게 쓴 후기 ***
		List<HashMap<String,String>> myReadReview = service.getHostReview(userid);
		// *** 작성해야 할 후기 ***
		// *** 나의 예약 코드 받아오기 ***
		//String rsvcode = service.getMyRsvCode(userid);
		//int n = service.getNoReview(userid)
		
		req.setAttribute("myReadReview", myReadReview);
		req.setAttribute("myWriteReview", myWriteReview);
		return "mypage/review.hometiles";
	}
	@RequestMapping(value = "/couponReg.air", method = {RequestMethod.GET,RequestMethod.POST})
	public String couponReg(HttpServletRequest req, HttpServletResponse res) {
		
		return "mypage/couponReg.notiles";
	}
	
	@RequestMapping(value = "/couponRegEnd.air", method = {RequestMethod.GET,RequestMethod.POST})
	public String couponRegEnd(HttpServletRequest req, HttpServletResponse res) {
		//	*** 아이디 정보 가져오기 ***
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginuser");
		String userid = loginMember.getUserid();
		String coupon = req.getParameter("coupon");
		List<HashMap<String,String>> couponList = service.getCoupon();		
		System.out.println("11");
		for(int i=0;i<couponList.size();i++) {
		
			String cpcode = couponList.get(i).get("cpcode");
			System.out.println("22");
			if(cpcode == coupon) {
				cpcode = coupon;
				System.out.println("33");
			}
				coupon = "";
		}
		System.out.println("44");
		if(coupon == null || coupon.trim() =="") {
			System.out.println("55");
			String msg = "쿠폰번호를 등록해 주세요!";
			String loc = "javascript:history.back()";
			
			return "msg";
		}else {
			//*** 쿠폰 정보 가져오기 ***			
			System.out.println("66");
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
			map.put("coupon",coupon);
			
			int n = service.addCoupon(map);
			req.setAttribute("n", n);
			return "mypage/couponRegEnd.notiles";
		}		
		
	
	}
	
	
	@RequestMapping(value = "/myReservationMAP.air", method = RequestMethod.GET)
	public String myReservationMAP(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		MemberVO memberLogin= (MemberVO)session.getAttribute("loginuser");
		String userid = memberLogin.getUserid();
		String rsvcode = req.getParameter("rsvcode");
		
		HashMap<String,String>  paraMap = new HashMap<String,String>();		
		paraMap.put("rsvcode", rsvcode);
		paraMap.put("userid", userid);
		
		HashMap<String,String> rsvLocation = service.getMap(paraMap);
		//HashMap<String,String> rsvLocation = service.getMemberReservationDetail(paraMap);
		req.setAttribute("rsvLocation", rsvLocation);
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
