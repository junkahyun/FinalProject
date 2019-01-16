package com.spring.bnb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.boboService;
import com.spring.common.MyUtil;


@Controller
public class boboController {
	
	@Autowired
	private boboService service;
	
	@RequestMapping(value="/roomstap1.air", method={RequestMethod.GET})
	public String roomstap1(HttpServletRequest req) {
		
		// 세션에 입력값을 넣어서 한번에 insert하려고 RoomVO를 세션값에 저장
		HttpSession session = req.getSession();		
		RoomVO roomvo = new RoomVO();
		session.setAttribute("roomvo", roomvo);
		
		return "become-host/room-stap1.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstap1page.air", method={RequestMethod.GET})
	public String roomstap1page(HttpServletRequest req) {
		
		// 옵션 hold를 위한 작업
		String buildType = req.getParameter("buildType");
		if(buildType == null) buildType="0";
		req.setAttribute("buildType", buildType);
		String buildType_detail = req.getParameter("buildType_detail");	
		if(buildType_detail == null) buildType_detail="0";
		req.setAttribute("buildType_detail", buildType_detail);
		

		List<HashMap<String, String>> buildTypeList = service.selectbuildType();// 건물유형 가져오기
		req.setAttribute("buildTypeList", buildTypeList);		

		List<String> roomtype = service.selectroomtype();// 숙소유형 가져오기
		req.setAttribute("roomtype", roomtype);
		
		return "become-host/room-stap1-page.hosttiles_nofooter";
	}

	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype(HttpServletRequest req) {	
			
			// 뒤로가기를 위한 작업
			String currentURL = req.getRequestURL().toString();
			req.setAttribute("currentURL", currentURL);


			// 옵션 hold를 위한 작업
			String buildType = req.getParameter("buildType");
			if(buildType == null) buildType="0";
			req.setAttribute("buildType", buildType);
			String buildType_detail = req.getParameter("buildType_detail");	
			if(buildType_detail == null) buildType_detail="0";
			req.setAttribute("buildType_detail", buildType_detail);
			

			List<HashMap<String, String>> buildTypeList = service.selectbuildType();// 건물유형 가져오기
			req.setAttribute("buildTypeList", buildTypeList);		

			List<String> roomtype = service.selectroomtype();// 숙소유형 가져오기
			req.setAttribute("roomtype", roomtype);
			
			return "become-host/roomtype.hosttiles_nofooter";

	}
	
	@RequestMapping(value="/roomtypeJSON.air", method={RequestMethod.GET})
	public String roomtypeJSON(HttpServletRequest req) {
		
		/*String buildType_detail = req.getParameter("buildType_detail");	
		if(buildType_detail == null) buildType_detail="0";
		req.setAttribute("buildType_detail_json", buildType_detail);*/
		
		String buildType = req.getParameter("buildType");

		JSONArray jsonArr = new JSONArray();
		
		if(buildType != null && !buildType.trim().isEmpty()) {
			List<HashMap<String,String>> buildTypeList = service.selectbuildTypedetail(buildType);// 건물세부유형 가져오기
			
			if(buildTypeList != null && buildTypeList.size() > 0) {
				for(HashMap<String,String> map : buildTypeList) {
					JSONObject jsonObj = new JSONObject();
					
					jsonObj.put("BUILDTYPE_DETAIL_IDX", map.get("BUILDTYPE_DETAIL_IDX")); // 키값, xml에서 읽어온 키값
					jsonObj.put("BUILDTYPE_DETAIL_NAME", map.get("BUILDTYPE_DETAIL_NAME"));
					
					jsonArr.put(jsonObj);
		
				}// end of for
			}// end of if
			
		}
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		
		return "JSON";		
	}
		
	@RequestMapping(value="/bedroom.air", method={RequestMethod.GET})
	public String bedroom(HttpServletRequest req) {
		
		//뒤로가기를 위한 작업
		String currentURL = req.getParameter("currentURL");
		//System.out.println(currentURL);		
		String queryString = req.getQueryString();
		//System.out.println(queryString);		
		currentURL += "?" + queryString;
		//System.out.println(currentURL);		
		req.setAttribute("currentURL", currentURL);
		
		
		String buildType_detail = req.getParameter("buildType_detail");
		String room_type = req.getParameter("room_type");
		
		// RoomVO에 입력값 저장(나중에 한번에 insert하려고)
		RoomVO roomvo = new RoomVO();
		roomvo.setFk_buildType_detail_idx(buildType_detail);
		roomvo.setFk_roomType_idx(room_type);
			
		return "become-host/bedroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/bathroom.air", method={RequestMethod.GET})
	public String bathroom() {
		
		return "become-host/bathroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/location.air", method={RequestMethod.GET})
	public String location() {
		
		return "become-host/location.hosttiles_nofooter";
	} 
	
	@RequestMapping(value="/map.air", method={RequestMethod.GET})
	public String map(HttpServletRequest req) {
		
		String address = req.getParameter("address");
		req.setAttribute("address", address);
		
		return "become-host/map.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/option.air", method={RequestMethod.GET})
	public String option() {
		
		return "become-host/option.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstap2.air", method={RequestMethod.GET})
	public String roomstap2() {
		
		return "become-host/room-stap2.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomimage.air", method={RequestMethod.GET})
	public String roomimage() {
		
		return "become-host/roomimage.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roominfo.air", method={RequestMethod.GET})
	public String roominfo() {
		
		return "become-host/roominfo.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtitle.air", method={RequestMethod.GET})
	public String roomtitle() {
		
		return "become-host/roomtitle.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstap3.air", method={RequestMethod.GET})
	public String roomstap3() {
		
		return "become-host/room-stap3.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/guestrule.air", method={RequestMethod.GET})
	public String guestrule() {
		
		return "become-host/guestrule.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/checkInOutTime.air", method={RequestMethod.GET})
	public String checkInOutTime() {
		
		return "become-host/checkInOutTime.hosttiles_nofooter";
	}
	
	
	
	
}
