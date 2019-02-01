package com.spring.bnb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterSWService;

@Controller
@Component
public class SWController {

	@Autowired
	private InterSWService service;
	
	@RequestMapping(value = "/list.air", method = RequestMethod.GET)
	public String list(HttpServletRequest req) {
		
		String city = req.getParameter("sido");
		String checkin = req.getParameter("checkin");
		String checkout = req.getParameter("checkout"); 
		
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("CITY", city);
		paraMap.put("CHECKIN", checkin);
		paraMap.put("CHECKOUT", checkout);
		
		/*System.out.println(paraMap);*/
		
		// 숙소유형(대)
		List<String> buildList = service.getBuildList();		
		// 옵션종류
		List<String> optionList = service.getOptionList();
		// 방종류
		List<String> roomType = service.getRoomType();
		// 이용규칙
		List<String> roomRule = service.getRoomRule();
		// 전체 숙소리스트
		List<RoomVO> roomList = service.getRoomList(paraMap);
			
		req.setAttribute("buildList", buildList);
		req.setAttribute("optionList", optionList);
		req.setAttribute("roomType", roomType);
		req.setAttribute("roomRule", roomRule);
		req.setAttribute("roomList", roomList);
		req.setAttribute("city", city);
		req.setAttribute("checkin", checkin);
		req.setAttribute("checkout", checkout);
		
		return "home/homeList.hometiles_nofooter";
	}	
	
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
	
	@RequestMapping(value = "/homeListByOption.air", method = {RequestMethod.GET})
	public String homeListByOption(HttpServletRequest req, HttpServletResponse res) {
		
		String buildName2 = req.getParameter("buildName2");
		String checkin = req.getParameter("checkin");
		String checkout = req.getParameter("checkout");
		String startprice = req.getParameter("startprice");
		String endprice = req.getParameter("endprice");
		String city = req.getParameter("city");
		String allperson = req.getParameter("allperson");
						
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("BUILDNAME2", buildName2);
		paraMap.put("CHECKIN", checkin);
		paraMap.put("CHECKOUT", checkout);
		paraMap.put("STARTPRICE", startprice);
		paraMap.put("ENDPRICE", endprice);
		paraMap.put("CITY", city);
		paraMap.put("ALLPERSON", allperson);
		
		/*System.out.println(paraMap);*/
		JSONArray jsonArr = new JSONArray();
		
		List<RoomVO> homeListByOption = service.getHomeListByOption(paraMap);
		/*System.out.println(homeListByOption.size());*/
		if(homeListByOption.size() <1) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("LISTCHECK", homeListByOption.size()); 
			jsonArr.put(jsonobj);
			req.setAttribute("str_json", jsonobj.toString()); 
			return "JSON";
		}
		else {
			for(RoomVO roomvo : homeListByOption) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("ROOMMAINIMG", roomvo.getRoomMainImg());
				jsonObj.put("ROOMPRICE", roomvo.getRoomPrice());
				
				if(roomvo.getRoomName().length() >= 25) {
					jsonObj.put("ROOMNAME", roomvo.getRoomName().substring(0, 25)+"....");
				}
				else {
					jsonObj.put("ROOMNAME", roomvo.getRoomName());
				}
				jsonObj.put("LATITUDE", roomvo.getLatitude());
				jsonObj.put("LONGITUDE", roomvo.getLongitude());
				jsonObj.put("ROOMCODE", roomvo.getRoomcode());
				jsonObj.put("ROOMTYPENAME", roomvo.getRoomType_name());
				jsonObj.put("ROOMCOUNT", roomvo.getRoomCount());
				jsonObj.put("BEDCOUNT", roomvo.getBedCount());
				jsonObj.put("BATHCOUNT", roomvo.getBathCount());
				jsonObj.put("BEDTYPE", roomvo.getBedtype());
				
				jsonArr.put(jsonObj);
			}
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("LISTCHECK", homeListByOption.size());
			req.setAttribute("str_json", jsonArr.toString());
		}
		/*
		
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		System.out.println(str_json);
		System.out.println(jsonArr.length());*/
		
		return "JSON";		
	}
	
	@RequestMapping(value = "/reservationList.air", method = RequestMethod.GET)
	public String reservation(HttpServletRequest req) {
		
		String userid = "kongkd2";
		
		List<ReservationVO> reservationList = service.getReservationList(userid); 
		
		req.setAttribute("userid", userid);
		req.setAttribute("reservationList", reservationList); 
		req.setAttribute("listSize", reservationList.size());
		
		return "hostPage/reservationList.hosttiles_nofooter";
	}
	
	@RequestMapping(value = "/optionJSON.air", method = {RequestMethod.GET})
	/*@ResponseBody*/
	public String option(HttpServletRequest req, HttpServletResponse res) {
		 
		List<HashMap<String,Object>> mapList = new ArrayList<HashMap<String,Object>>();
		
		String[] rulename = req.getParameterValues("rulename");
		String[] roomtype_name = req.getParameterValues("roomtype_name");
		String[] optionname = req.getParameterValues("optionname");
		String city = req.getParameter("city");
			
		String rulenameStr = "";
		String roomtype_nameStr = "";
		String optionnameStr = "";
		
		if(rulename != null) {
			for(int i=0; i<rulename.length; i++) {
				String rule = rulename[i];				
				if(rulename.length > i+1) {
					rulenameStr += rule+",";					
				}
				else {
					rulenameStr += rule;
				}				
			}
		//	System.out.println(rulenameStr);
		}
		
		if(roomtype_name != null) {
			for(int i=0; i<roomtype_name.length; i++) {
				String roomtype = roomtype_name[i];				
				if(roomtype_name.length > i+1) {
					roomtype_nameStr += roomtype+",";
				}
				else {
					roomtype_nameStr += roomtype;
				}				
			}
		//	System.out.println(roomtype_nameStr);
		}
		
		if(optionname != null) {
			for(int i=0; i<optionname.length; i++) {
				String option = optionname[i];				
				if(optionname.length > i+1) {
					optionnameStr += option+",";
				}
				else {
					optionnameStr += option;
				}				
			}
		//	System.out.println(optionnameStr);
		}	
				
		HashMap<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("RULENAME", rulenameStr);
		paraMap.put("ROOMTYPE_NAME", roomtype_nameStr);
		paraMap.put("OPTIONNAME", optionnameStr);
		paraMap.put("CITY", city);				
	
		//System.out.println(paraMap);
		
		List<RoomVO> optionList = service.getSWOptionList(paraMap);	
		
		/*for(RoomVO roomvo : optionList) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("ROOMNAME", roomvo.getRoomName());
			map.put("ROOMPRICE", roomvo.getRoomPrice());
			map.put("ROOMMAINIMG", roomvo.getRoomMainImg());
			
			mapList.add(map);
		}*/
		JSONArray jsonArr = new JSONArray();
		
		if(optionList.size() < 1) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("OPTIONCHECK", optionList.size());
			req.setAttribute("str_json", jsonobj.toString());
			jsonArr.put(jsonobj);
			return "JSON";
		}
		else {
			for(RoomVO roomvo : optionList) {
				
				JSONObject jsonObj = new JSONObject();			
				if(roomvo.getRoomName().length() >= 25) {
					jsonObj.put("ROOMNAME", roomvo.getRoomName().substring(0, 25)+"....");
				}
				else {
					jsonObj.put("ROOMNAME", roomvo.getRoomName());
				}
				jsonObj.put("ROOMPRICE", roomvo.getRoomPrice());
				jsonObj.put("ROOMMAINIMG", roomvo.getRoomMainImg());
				jsonObj.put("ROOMCODE", roomvo.getRoomcode());
				jsonObj.put("ROOMTYPENAME", roomvo.getRoomType_name());
				jsonObj.put("ROOMCOUNT", roomvo.getRoomCount());
				jsonObj.put("BEDCOUNT", roomvo.getBedCount());
				jsonObj.put("BATHCOUNT", roomvo.getBathCount());
				jsonObj.put("BEDTYPE", roomvo.getBedtype());
				
				jsonArr.put(jsonObj);
			}
			req.setAttribute("str_json", jsonArr.toString());
		}
		return "JSON";
	}	
	
	@RequestMapping(value = "/allHomeList.air", method = {RequestMethod.GET})	
	public String allHome(HttpServletRequest req, HttpServletResponse res) {
		
		JSONArray jsonArr = new JSONArray();
		
		List<RoomVO> allHomeList = service.getAllHomeList();
		
		
		for(RoomVO roomvo : allHomeList) {
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("ROOMMAINIMG", roomvo.getRoomMainImg());
			jsonObj.put("ROOMPRICE", roomvo.getRoomPrice());
			
			if(roomvo.getRoomName().length() >= 25) {
				jsonObj.put("ROOMNAME", roomvo.getRoomName().substring(0, 25)+"....");
			}
			else {
				jsonObj.put("ROOMNAME", roomvo.getRoomName());
			}
			/*jsonObj.put("LATITUDE", roomvo.getLatitude());
			jsonObj.put("LONGITUDE", roomvo.getLongitude());*/
			jsonObj.put("ROOMCODE", roomvo.getRoomcode());
			/*jsonObj.put("ROOMTYPENAME", roomvo.getRoomType_name());
			jsonObj.put("ROOMCOUNT", roomvo.getRoomCount());
			jsonObj.put("BEDCOUNT", roomvo.getBedCount());
			jsonObj.put("BATHCOUNT", roomvo.getBathCount());
			jsonObj.put("BEDTYPE", roomvo.getBedtype());*/
			
			jsonArr.put(jsonObj);
		}
		/*JSONObject jsonObj = new JSONObject();
		jsonObj.put("LISTCHECK", allHomeList.size());*/
		req.setAttribute("str_json", jsonArr.toString());
		
		
		return "JSON";		
	}
}
