package com.spring.bnb.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterSWService;

@Controller
@Component
public class SWController {

	@Autowired
	private InterSWService service;
	
	@RequestMapping(value = "/list.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		/*List<Integer> testList = new ArrayList<Integer>();
		for(int i=0;i<9;i++) {
			testList.add(i);
		}
		req.setAttribute("testList", testList);*/
		
		// 건물유형(대)
		List<HashMap<String, String>> buildList = service.getBuildList();		
		// 옵션
		List<String> optionList = service.getOptionList();
		// 숙소유형
		List<String> roomType = service.getRoomType();
		// 숙소 이용규칙
		List<String> roomRule = service.getRoomRule();
	
		req.setAttribute("buildList", buildList);
		req.setAttribute("optionList", optionList);
		req.setAttribute("roomType", roomType);
		req.setAttribute("roomRule", roomRule);
		
		
		return "home/homeList.hometiles_nofooter";
	}
	
}
