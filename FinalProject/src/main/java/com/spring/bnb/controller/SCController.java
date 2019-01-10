package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
import com.spring.bnb.service.InterHYService;
import com.spring.bnb.service.InterSWService;
=======
import com.spring.bnb.service.InterSCService;

>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git

@Controller
public class SCController {
	
	@Autowired
<<<<<<< HEAD
	private InterSWService service;
=======
	private InterSCService service; 
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
	
	@RequestMapping(value = "/hostroomList.air", method = RequestMethod.GET)
	public String hostroomList() {
		return "host/hostroomList.hosttiles";
	}
}

