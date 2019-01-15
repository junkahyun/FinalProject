package com.spring.bnb.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterSCService;
import com.spring.common.AES256;


@Controller
public class SCController {
	
	@Autowired
	private InterSCService service;
	
	@Autowired
	private AES256 aes;
	
	// 호스트 숙소 리스트
	@RequestMapping(value = "/hostroomList.air", method = {RequestMethod.GET})
	public String hostroomList(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		/*
		 * HttpSession session = req.getSession(); MemberVO loginuser =
		 * (MemberVO)session.getAttribute("loginuser");
		 */
		String userid = null;
		userid ="leess";
		/*
		 * if(loginuser !=null) { userid = loginuser.getUserid(); }
		 */
		roomList = service.getRoomList(userid);
		req.setAttribute("roomList", roomList);
		
		return "host/hostroomList.hosttiles";
	}
	
	// 호스트 등록된 숙소 수정하기 
	@RequestMapping(value="/hostRoomEdit.air", method= {RequestMethod.GET})
	public String hostRoomEdit (HttpServletRequest req) {
		return "hostRoomEdit/hostRoomEdit.hosttiles_nofooter";
	}
	
	// 호스트 숙소사진 수정
	@RequestMapping(value = "/hrPhotoEdit.air", method = {RequestMethod.GET})
	public String hrPhotoEdit() {
		return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
	}
	
	// 호스트 숙소세부사진 수정
	@RequestMapping(value = "/hrDetailPhotoEdit.air", method = {RequestMethod.GET})
	public String hrDetailPhotoEdit() {
		return "hostRoomEdit/hrDetailPhotoEdit.hosttiles_nofooter";
	}
	
	// 호스트 숙소 제목 수정
	@RequestMapping(value = "/hrTitleEdit.air", method = {RequestMethod.GET})
	public String hrTitleEdit() {
		return "hostRoomEdit/hrTitleEdit.hosttiles_nofooter";
	}
	
	// 호스트 숙소 침실 수정
	@RequestMapping(value="/bedroomEdit.air", method={RequestMethod.GET})
	public String bedroomEdit() {
		return "hostRoomEdit/bedroomEdit.hosttiles_nofooter";
	}
	
	// 숙소 페이지 
	@RequestMapping(value="/hostroomPage.air", method={RequestMethod.GET})
	public String hostroomPage() {
		return "host/hostroomPage.hosttiles";
	}
	
	// 숙소 평점, 수입, 성취도  페이지
	@RequestMapping(value="/hostroomMark.air", method={RequestMethod.GET})
	public String hostroomMark() {
		return "host/hostroomMark.hosttiles";
	}
}

