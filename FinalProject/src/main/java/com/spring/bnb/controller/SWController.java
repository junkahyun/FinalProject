package com.spring.bnb.controller;

import java.util.ArrayList;
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
		
		// 건물유형(대)
		List<String> buildList = service.getBuildList();		
		// 옵션
		List<String> optionList = service.getOptionList();
		// 숙소유형
		List<String> roomType = service.getRoomType();
		// 숙소 이용규칙
		List<String> roomRule = service.getRoomRule();
		// 숙소 리스트 불러오기
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
		
		List<String> buildDetailName = service.getBuildDetailList(buildName1);;
		
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
		
		
		return "hostPage/reservationList.hosttiles_nofooter";
	}
	
}
