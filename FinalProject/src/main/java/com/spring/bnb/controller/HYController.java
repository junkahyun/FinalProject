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
	
	// 숙소 상세페이지
	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		String roomcode = req.getParameter("roomcode");
		roomcode = "10";
		RoomVO roomvo = service.getRoomByCode(roomcode);
		req.setAttribute("room", roomvo);
		return "home/homeDetail.hometiles";
	}
	
	// 호스트 메인페이지
	@RequestMapping(value = "/hostMain.air", method = RequestMethod.GET)
	public String hostMain() {
		return "host/hostMain.hosttiles";
	}
	
	// DB로 로그인 체크하기
	@RequestMapping(value = "/login.air", method = RequestMethod.POST)
	public String login(HttpServletRequest req ,MemberVO member) {
		MemberVO loginuser = service.logincheck(member); // 로그인 검사하는 메소드
		JSONObject jobj = new JSONObject();
		String logincheck = "";
		if(loginuser==null) {
			logincheck = "false";
		}
		else {
			// 로그인 성공시 세션에 해당 유저정보저장
			logincheck = "true";
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", loginuser);
		}
		jobj.put("logincheck", logincheck);
		String str_json = jobj.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
	}
	
	// 로그아웃 세션에 저장된  loginuser 삭제하기
	@RequestMapping(value = "/logout.air", method = RequestMethod.GET)
	public String logout(HttpServletRequest req ,MemberVO member) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginuser");
		req.setAttribute("msg","로그아웃 되었습니다.");
		req.setAttribute("reload","reload");
		return "redirect:msg";
	}
}

