package com.spring.bnb.controller;

import java.util.*; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterSWService;

@Controller
@Component
public class SWController {

	@Autowired
	private InterSWService service;
	
	@RequestMapping(value = "/list.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		/*List<Integer> testList = new ArrayList<Integer>();
		for(int i=0; i<9; i++) {
			testList.add(i);
			
		}*/
		req.getParameter("city");
		req.getParameter("checkin");
		req.getParameter("checkout");
		
		/*req.setAttribute("testList", testList);*/
		// 숙소유형(대)
		List<String> buildList = service.getBuildList();		
		// 옵션종류
		List<String> optionList = service.getOptionList();
		// 방종류
		List<String> roomType = service.getRoomType();
		// 이용규칙
		List<String> roomRule = service.getRoomRule();
		// 숙소유형(소)
		List<RoomVO> roomList = service.getRoomList();
		req.setAttribute("buildList", buildList);
		req.setAttribute("optionList", optionList);
		req.setAttribute("roomType", roomType);
		req.setAttribute("roomRule", roomRule);
		req.setAttribute("roomList", roomList);
		
		return "home/homeList.hometiles_nofooter";
	}
	
/*	
	@RequestMapping(value = "/homeName.air", method = {RequestMethod.GET})
	@ResponseBody
	public List<HashMap<String, Object>> buildDetailName(HttpServletRequest req, HttpServletResponse res) {
		
		String buildName1 = req.getParameter("buildName1");
		
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		List<String> buildDetailName = service.getBuildDetailList(buildName1);;
		
		for(String test : buildDetailName) {
			System.out.println(test);
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("buildDetailName", test);
			
			mapList.add(map);
		}
		
		return mapList;
	}
*/	
	
	@RequestMapping(value = "/homeName.air", method = {RequestMethod.GET})
	public String buildDetailName(HttpServletRequest req, HttpServletResponse res) {
		
		String buildName1 = req.getParameter("buildName1");
		
		JSONArray jsonArr = new JSONArray();  
		
		List<String> buildDetailName = service.getBuildDetailList(buildName1);
		
		for(String test : buildDetailName) {
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("buildDetailName", test);
			
			jsonArr.put(jsonObj);
		}
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		
		/*System.out.println(str_jsonArr);
		System.out.println(buildDetailName);
		System.out.println(jsonArr);*/
		
		return "JSON";
	}
	
	@RequestMapping(value = "/reservationList.air", method = RequestMethod.GET)
	public String reservation(HttpServletRequest req) {
		
		String userid = "leess";
		
		List<ReservationVO> reservationList = service.getReservationList(userid); 
		
		req.setAttribute("userid", userid);
		req.setAttribute("reservationList", reservationList); 
		req.setAttribute("listSize", reservationList.size());
		
		return "hostPage/reservationList.hosttiles_nofooter";
	}
	
	@RequestMapping(value = "/optionJSON.air", method = {RequestMethod.GET})
	public String option(HttpServletRequest req, HttpServletResponse res, String[] rulename, String[] roomtype_name, String[] optionname) {
		 
		if(rulename == null ) {
			rulename = new String[]{""};
		}
		if(roomtype_name == null) {
			roomtype_name = new String[]{""};
		}
		if(optionname == null) {
			optionname = new String[]{""};
		}
		/*
		String rulenameStr = Arrays.toString(rulename);
		String roomtype_nameStr = Arrays.toString(roomtype_name);
		String optionnameStr = Arrays.toString(optionname);
				
		rulenameStr = rulenameStr.replace("[", "{");
		rulenameStr = rulenameStr.replace("]", "}");
		roomtype_nameStr = roomtype_nameStr.replace("[", "{");
		roomtype_nameStr = roomtype_nameStr.replace("]", "}");
		optionnameStr = optionnameStr.replace("[", "{");
		optionnameStr = optionnameStr.replace("]", "}");
			
		System.out.println("rulenameStr : " + rulenameStr);
		System.out.println("roomtype_nameStr : " + roomtype_nameStr);
		System.out.println("optionnameStr : " + optionnameStr);*/
		
		/*List<String> valueList = new ArrayList<>();
		valueList.add(rulenameStr);
		valueList.add(roomtype_nameStr);
		valueList.add(optionnameStr);
						
		System.out.println(valueList);
		
		HashMap<String, List<String> > listMap = new HashMap<>();
		listMap.put("rule", valueList);	
		
		System.out.println(listMap);*/
		
		JSONArray jsonArr = new JSONArray();  		
		
		HashMap<String,String[]> paraMap =  new HashMap<String,String[]>();
		paraMap.put("RULENAME", rulename);
		paraMap.put("ROOMTYPE_NAME", roomtype_name);
		paraMap.put("OPTIONNAME", optionname);
		
		System.out.println(paraMap);
		String rulenameStr = Arrays.toString(paraMap.get("RULENAME"));
		String roomtype_nameStr = Arrays.toString(paraMap.get("ROOMTYPE_NAME"));
		String optionnameStr = Arrays.toString(paraMap.get("OPTIONNAME"));
		
		System.out.println(rulenameStr);
		System.out.println(roomtype_nameStr);
		System.out.println(optionnameStr);
		
		List<String> myList = new ArrayList<String>();
		myList.add(rulenameStr);
		myList.add(roomtype_nameStr);
		myList.add(optionnameStr);
		
		System.out.println(myList);
		
		List<RoomVO> optionList = service.getSWOptionList(paraMap);
		
		for(RoomVO test : optionList) {
			
			JSONObject jsonObj = new JSONObject();			
			jsonObj.put("optionList", test);			
			jsonArr.put(jsonObj);
		}
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);		
		req.setAttribute("optionname", optionnameStr);
		req.setAttribute("rulename", rulename);
		req.setAttribute("roomtype_name", roomtype_name);
		
		System.out.println("2 : " +str_json);
		System.out.println("3 : " +optionList);
		System.out.println("4 : " +jsonArr);
		
		return "JSON";
	}
	
}
