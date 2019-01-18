package com.spring.bnb.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.spring.bnb.model.*;
import com.spring.bnb.service.InterWCService;
import com.spring.common.AES256;

@Controller
public class WCController {

	@Autowired
	private InterWCService service;
	 
	@Autowired
	private AES256 aes;
	 
	@RequestMapping(value = "/index.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		// 메인페이지 요청 시 모든 숙소 리스트 가져오기
		List<RoomVO> roomList = service.getRecommandRoomList();
		
		List<ReviewVO> reviewList = service.getBestReviewList();
		
		req.setAttribute("roomList", roomList);  
		return "main/index";   
	}  
	@RequestMapping(value = "/admin.air", method = RequestMethod.GET)
	public String admin_index() {
		return "admin/index.admintiles";
	}
	@RequestMapping(value = "/lodgingManage.air", method = RequestMethod.GET)
	public String lodgingManage() {
		return "admin/lodging_manage.admintiles";
	}
	@RequestMapping(value = "/lodgingRegistManage.air", method = RequestMethod.GET)
	public String lodgingRegistManage() {
		return "admin/lodging_regist_manage.admintiles";
	}
} 