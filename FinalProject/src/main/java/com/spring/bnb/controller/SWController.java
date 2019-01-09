package com.spring.bnb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SWController {

	@RequestMapping(value = "/list.air", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		List<Integer> testList = new ArrayList<Integer>();
		for(int i=0;i<9;i++) {
			testList.add(i);
		}
		req.setAttribute("testList", testList);
		return "home/homeList.hometiles";
	}
	
}
