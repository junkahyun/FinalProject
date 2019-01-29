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
			
			jsonArr.put(jsonObj);
		}
		
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		/*System.out.println(str_json);
		System.out.println(jsonArr.length());*/
		
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
	/*@ResponseBody*/
	public String option(HttpServletRequest req, HttpServletResponse res) {
		 
		List<HashMap<String,Object>> mapList = new ArrayList<HashMap<String,Object>>();
		
		String[] rulename = req.getParameterValues("rulename");
		String[] roomtype_name = req.getParameterValues("roomtype_name");
		String[] optionname = req.getParameterValues("optionname");
		String[] city = req.getParameterValues("city");
			
		String rulenameStr = "";
		String roomtype_nameStr = "";
		String optionnameStr = "";
	
		List<String> rulenameList = new ArrayList<String>();
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
		
		List<String> roomtype_nameList = new ArrayList<String>();
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
		
		List<String> optionnameList = new ArrayList<String>();
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
		
		/*System.out.println(rulenameStr);
		System.out.println(roomtype_nameStr);
		System.out.println(optionnameStr);*/
		
		HashMap<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("RULENAME", rulenameStr);
		paraMap.put("ROOMTYPE_NAME", roomtype_nameStr);
		paraMap.put("OPTIONNAME", optionnameStr);
		paraMap.put("CITY", city);
				
		/*System.out.println("1 :"+paraMap);*/
		
		
		List<RoomVO> optionList = service.getSWOptionList(paraMap);	
		
		for(RoomVO roomvo : optionList) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("ROOMNAME", roomvo.getRoomName());
			map.put("ROOMPRICE", roomvo.getRoomPrice());
			map.put("ROOMMAINIMG", roomvo.getRoomMainImg());
			
			mapList.add(map);
		}
		/*System.out.println("2 :"+mapList);*/
		
		JSONArray jsonArr = new JSONArray();  		
				
		for(RoomVO test : optionList) {
			
			JSONObject jsonObj = new JSONObject();			
			if(test.getRoomName().length() >= 25) {
				jsonObj.put("ROOMNAME", test.getRoomName().substring(0, 25)+"....");
			}
			else {
				jsonObj.put("ROOMNAME", test.getRoomName());
			}
			jsonObj.put("ROOMPRICE", test.getRoomPrice());
			jsonObj.put("ROOMMAINIMG", test.getRoomMainImg());
			
			jsonArr.put(jsonObj);
		}
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);		
		
		/*System.out.println("3 : " +str_json);*/
		
		return "JSON";
	}	
	
	
}
