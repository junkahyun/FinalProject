package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.boboService;


@Controller
public class boboController {
	
	@Autowired
	private boboService service;

	@RequestMapping(value="/newroom.air", method={RequestMethod.GET})
	public String newroom() {
		
		return "become-host/newroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstart.air", method={RequestMethod.GET})
	public String roomstart() {
		
		return "become-host/roomstart.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype() {
		
		return "become-host/roomtype.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/bedroom.air", method={RequestMethod.GET})
	public String bedroom() {
		
		return "become-host/bedroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/bathroom.air", method={RequestMethod.GET})
	public String bathroom() {
		
		return "become-host/bathroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/loction.air", method={RequestMethod.GET})
	public String loction() {
		
		return "become-host/loction.hosttiles_nofooter";
	} 
	
	@RequestMapping(value="/map.air", method={RequestMethod.GET})
	public String map() {
		
		return "become-host/map.hosttiles_nofooter";
	}
	
	
	
	
}
