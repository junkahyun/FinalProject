package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterHYService;
import com.spring.common.AES256;

@Controller
public class HYController {

	@Autowired
	private InterHYService service; 

	@Autowired
	private AES256 aes;
	
	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		//String roomcode = req.getParameter("roomcode");
		RoomVO roomvo = service.getRoomByCode("10");
		req.setAttribute("room", roomvo);
		return "home/homeDetail.hometiles";
	}
	@RequestMapping(value = "/hostMain.air", method = RequestMethod.GET)
	public String hostMain() {
		return "host/hostMain.hosttiles";
	}

}

