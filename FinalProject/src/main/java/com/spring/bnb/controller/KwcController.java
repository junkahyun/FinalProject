package com.spring.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.service.InterHYService;
import com.spring.common.AES256;

@Controller
public class KwcController {
	
	//===== #35. ������ü �����ϱ�(DI:Dependency Injection)  =====
	@Autowired
	private InterHYService service; // �������̽��� ��õ� �޼ҵ常 ��밡���ϴ�.
	
	// 45. ����� ��ȣȭ �˰����� AES256�� ����Ͽ� ��ȣȭ/��ȣȭ �ϱ� ���� Ŭ���� ������ü �����ϱ�(DI:Dependency Injection)
	@Autowired
	private AES256 aes;
	
	@RequestMapping(value = "/main.air", method = RequestMethod.GET)
	public String index_2() {
		return "main/index";
	}
}

