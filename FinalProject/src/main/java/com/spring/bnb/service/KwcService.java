package com.spring.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterHYDAO;

//===== #31. Service ����  =====
@Service
public class KwcService implements InterHYService {
	//===== #34. ������ü �����ϱ�(DI:Dependency Injection)  =====
	@Autowired
	private InterHYDAO dao; // �������̽��� ��õ� �޼ҵ常 ��밡���ϴ�.
}
