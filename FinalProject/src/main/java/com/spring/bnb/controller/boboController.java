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


@Controller
public class boboController {
	
	@Autowired
	private boboService service;
	
	@RequestMapping(value="/roomstap1.air", method={RequestMethod.GET})
	public String roomstap1(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		RoomVO roomvo = new RoomVO();
		session.setAttribute("roomvo", roomvo);
		
		return "become-host/room-stap1.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype(HttpServletRequest req) {
				
		List<HashMap<String, String>> buildType = service.selectbuildType();// 건물유형 가져오기
		req.setAttribute("buildType", buildType);
		
		List<String> roomtype = service.selectroomtype();// 숙소유형 가져오기
		req.setAttribute("roomtype", roomtype);

		return "become-host/roomtype.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtypeJSON.air", method={RequestMethod.GET})
	/*@ResponseBody*/
	public String roomtypeJSON(HttpServletRequest req) {
		
		String buildType = req.getParameter("buildType");
		//System.out.println(buildType);
		
		/*===========================================================================================*/
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
		
		String str_jsonArr = jsonArr.toString();
		req.setAttribute("str_jsonArr", str_jsonArr);
		
		return "JSON";
		/*=======================================================================================*/
		
		/*===================== jackson ======================================================= 
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		if(buildType != null && !buildType.trim().isEmpty()) {
			List<HashMap<String,String>> buildTypeList = service.selectbuildTypedetail(buildType);
			
			System.out.println(buildTypeList);
			
			if(buildTypeList != null && buildTypeList.size() > 0) {
				for(HashMap<String,String> buildTypeMap : buildTypeList) {
	
					HashMap<String,Object> map = new HashMap<String, Object>();
					
					map.put("BUILDTYPE_DETAIL_IDX", buildTypeMap.get("BUILDTYPE_DETAIL_IDX"));
					map.put("BUILDTYPE_DETAIL_NAME", buildTypeMap.get("BUILDTYPE_DETAIL_NAME"));
					
					mapList.add(map);
		
				}// end of for
				
				System.out.println(mapList);
			}// end of if
		}
		
		return mapList;
		============================================================================================*/
	}
		
	@RequestMapping(value="/bedroom.air", method={RequestMethod.GET})
	public String bedroom(HttpServletRequest req) {
		String buildType = req.getParameter("buildType");
		String buildType_detail = req.getParameter("buildType_detail");
		String room_type = req.getParameter("room_type");
		
		RoomVO roomvo = new RoomVO();
		roomvo.setFk_buildType(buildType);
		//roomvo.setFk_buildType_detail(buildType_detail);
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
