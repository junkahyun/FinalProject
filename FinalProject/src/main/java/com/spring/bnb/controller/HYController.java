package com.spring.bnb.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterHYService;

@Controller
public class HYController {

	//===== #35. 의존객체주입(DI:Dependency Injection)  =====
	@Autowired
	private InterHYService service; 

	/*@Autowired
	private AES256 aes;*/
	
	// 숙소 상세페이지
	@RequestMapping(value = "/homeDetail.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		String roomcode = req.getParameter("roomcode");
		if(roomcode==null) roomcode = "10";
		RoomVO roomvo = service.getRoomByCode(roomcode);
		req.setAttribute("room", roomvo);
		return "home/homeDetail.hometiles";
	}
	
	// 숙소 상세페이지
	@RequestMapping(value = "/reviewSearch.air", method = RequestMethod.GET)
	public String reviewSearch(HttpServletRequest req) {
		String reviewSearchWord = req.getParameter("reviewSearchWord");
		String roomcode = req.getParameter("roomcode");
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("REVIEWSEARCHWORD", reviewSearchWord);
		paraMap.put("ROOMCODE",roomcode);
		List<ReviewVO> reviewList = service.getSearchReview(paraMap);
		JSONArray jsonArr = new JSONArray();
		for(ReviewVO review :reviewList) {
			JSONObject jobj = new JSONObject();
			jobj.put("review_idx",review.getReview_idx());
			jobj.put("fk_roomcode",review.getFk_roomcode());
			jobj.put("fk_userid",review.getFk_userid());
			jobj.put("review_content",review.getReview_content());
			jobj.put("review_wrtitedate",review.getReview_writedate());
			jsonArr.put(jobj);
		}
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
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
	@RequestMapping(value = "/logout.air", method = RequestMethod.POST)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginuser");
		JSONObject jobj = new JSONObject();
		jobj.put("msg", "로그아웃 되었습니다.");
		String str_json = jobj.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
	}

	// 숙소 관심테이블에 저장하기
	@RequestMapping(value = "/likeRoom.air", method = RequestMethod.POST)
	public String likeRoom(HttpServletRequest req ,MemberVO member) {
		String userid = req.getParameter("userid");
		String roomcode = req.getParameter("roomcode");
		String saveTitle = req.getParameter("saveTitle");
		//System.out.println("roomcode : "+roomcode+"/ userid : "+userid+"/saveTitle : "+saveTitle);
		HashMap<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("USERID", userid);
		paraMap.put("ROOMCODE", roomcode);
		paraMap.put("SAVETITLE", saveTitle);
		int n = service.insertLikeRoom(paraMap);
		JSONObject jobj = new JSONObject();
		jobj.put("n", n);
		String str_json = jobj.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
	}
	
	// 로그인 유저의 관심 숙소 리스트 불러오기
	@RequestMapping(value = "/myLikeRoomList.air", method = RequestMethod.GET)
	public String myLikeRoomList(HttpServletRequest req ,MemberVO member) {
		String userid = req.getParameter("userid");
		List<HashMap<String,Object>> resultMap = service.getMyLikeRoomList(userid);
		JSONArray jsonArr = new JSONArray();
		for(HashMap<String,Object> result :resultMap) {
			jsonArr.put(result);
		}
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
	}
}

