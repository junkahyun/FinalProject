package com.spring.bnb.controller;

import javax.servlet.http.HttpServletRequest;

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

/*	
    @RequestMapping(value="/newroom.air", method={RequestMethod.GET})
	public String newroom() {
		
		return "become-host/newroom.hosttiles_nofooter";
	}
*/
	
	@RequestMapping(value="/roomstart.air", method={RequestMethod.GET})
	public String roomstart(HttpServletRequest req) {

		return "become-host/roomstart.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype(HttpServletRequest req) {
		
		String room_type = req.getParameter("room_type");
		String person_capacity = req.getParameter("person_capacity");
		
		if(room_type != null && person_capacity != null) {
			//insert작업
		}
		
	//	System.out.println(room_type);
	//	System.out.println(person_capacity);
		
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
