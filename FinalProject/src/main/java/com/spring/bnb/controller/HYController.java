package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterHYService;

@Controller
public class HYController {

	//===== #35. ������ü �����ϱ�(DI:Dependency Injection)  =====


	@Autowired
	private InterHYService service; 

	/*@Autowired
	private AES256 aes;*/
	
	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		String roomcode = req.getParameter("roomcode");
		roomcode = "10";
		RoomVO roomvo = service.getRoomByCode(roomcode);
		req.setAttribute("room", roomvo);
		return "home/homeDetail.hometiles";

	}
	
	@RequestMapping(value = "/apiTest.air", method = RequestMethod.GET)
	public String apiTest() {
		return "apiTest.notiles";

	}
	@RequestMapping(value = "/hostMain.air", method = RequestMethod.GET)
	public String hostMain() {
		return "host/hostMain.hosttiles";

	}
	@RequestMapping(value = "/login.air", method = RequestMethod.POST)
	public String login(HttpServletRequest req ,MemberVO member) {
		MemberVO loginuser = service.logincheck(member); // 로그인 검사하는 메소드
		if(loginuser==null) {
			req.setAttribute("msg", "아이디와 비밀번호를 확인하세요");
			req.setAttribute("loc", "javascript:history.back();");
			return "msg";
		}
		else {
			// 로그인 성공시 세션에 해당 유저정보저장
			JSONObject jobj = new JSONObject();
			jobj.put("logincheck", "true");
			String str_json = jobj.toString();
			req.setAttribute("str_json", str_json);
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", loginuser);
		}
		return "JSON";
	}
	@RequestMapping(value = "/logout.air", method = RequestMethod.GET)
	public String logout(HttpServletRequest req ,MemberVO member) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginuser");
		req.setAttribute("msg","로그아웃 되었습니다.");
		req.setAttribute("loc","homeDetail.air");
		return "msg";
	}
}

