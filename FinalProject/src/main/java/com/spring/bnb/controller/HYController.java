package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterHYService;

@Controller
public class HYController {

	//===== #35. 의존객체 주입하기(DI:Dependency Injection)  =====


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

}

