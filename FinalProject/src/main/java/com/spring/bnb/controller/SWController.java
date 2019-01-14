package com.spring.bnb.controller;

import java.util.ArrayList;
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
		
		List<String> buildList = service.getBuildList();
		System.out.println(buildList.get(0));
		req.setAttribute("buildList", buildList);
		
		return "home/homeList.hometiles_nofooter";
	}
	
}
