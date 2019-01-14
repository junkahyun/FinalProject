package com.spring.bnb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bnb.service.boboService;


@Controller
public class boboController {
	
	@Autowired
	private boboService service;

/*	
    @RequestMapping(value="/newroom.air", method={RequestMethod.GET})
	public String newroom() {
		
		return "become-host/newroom.hosttiles_nofooter";
	}
*/
	
	@RequestMapping(value="/roomstart.air", method={RequestMethod.GET})
	public String roomstart(HttpServletRequest req) {
		
		List<String> roomtype = service.selectroomtype();
		req.setAttribute("roomtype", roomtype);

		return "become-host/roomstart.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype(HttpServletRequest req) {
		
		List<HashMap<String, String>> buildType = service.selectbuildType();
		req.setAttribute("buildType", buildType);

		return "become-host/roomtype.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtypeJSON.air", method={RequestMethod.GET})
	public String roomtypeJSON(HttpServletRequest req) {
		
		String buildType = req.getParameter("buildType");
		System.out.println(buildType);
		
		JSONArray jsonArr = new JSONArray();
		
		if(buildType != null && !buildType.trim().isEmpty()) {
			List<HashMap<String,String>> buildTypeList = service.selectbuildTypedetail(buildType);
			
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
		
		return "roomtypeJSON";
		
		/*List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
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
		
		return mapList;*/
	}
	
	
	@RequestMapping(value="/bedroom.air", method={RequestMethod.GET})
	public String bedroom(HttpServletRequest req) {
		
		
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
