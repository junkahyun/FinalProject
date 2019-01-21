package com.spring.bnb.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.spring.bnb.model.*;
import com.spring.bnb.service.InterWCService;
import com.spring.common.AES256;
import com.spring.common.MyUtil;

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
		req.setAttribute("reviewLeft", reviewList.get(0));
		req.setAttribute("reviewRight", reviewList.get(1));
		return "main/index";   
	}  
	@RequestMapping(value = "/admin.air", method = RequestMethod.GET)
	public String admin_index() {
		return "admin/index.admintiles";
	}
	@RequestMapping(value = "/lodgingManage.air", method = RequestMethod.GET)
	public String lodgingManage(HttpServletRequest req, HttpServletResponse res) {
		/*
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)req.getSession().getAttribute("loginuser");
		
		if(!"admin".equalsIgnoreCase(loginuser.getUserid())) {
		    try {
			 String msg = "먼저 로그인 하세요 ";
             String loc = req.getContextPath()+"/login.action";
            
            // === 로그인 성공 후 로그인 하기전  페이지로 돌아가는 작업하기 ===
            // === 현재 페이지 주소 URL 주소 알아내기 ===
            
             String url = MyUtil.getCurrentURL(req);
             session.setAttribute("gobackURL", url);
             req.setAttribute("msg", msg);
             req.setAttribute("loc", loc);
             RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/msg.jsp"); 
           
			dispatcher.forward(req, res);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
		List<RoomVO> roomList = service.getAllRoomList();
				
		req.setAttribute("roomList", roomList);
		return "admin/lodging_manage.admintiles";
	}
	@RequestMapping(value = "/lodgingRegistManage.air", method = RequestMethod.GET)
	public String lodgingRegistManage() {
		return "admin/lodging_regist_manage.admintiles";
	}
} 