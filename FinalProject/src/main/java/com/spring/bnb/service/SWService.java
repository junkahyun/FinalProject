package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bnb.dao.InterSWDAO;
import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;

@Service
public class SWService implements InterSWService {
	
	@Autowired
	private InterSWDAO dao;

	@Override
	public List<String> getBuildList() {
		
		List<String> buildList = dao.getBuildList();
		
		return buildList;
	}

	@Override
	public List<String> getOptionList() {

		List<String> optionList = dao.getOptionList();
		
		return optionList;
	}

	@Override
	public List<String> getRoomType() {

		List<String> roomType = dao.getRoomType();
		
		return roomType;
	}

	@Override
	public List<String> getRoomRule() {

		List<String> roomRule = dao.getRoomRule();
		
		return roomRule;
	}

	@Override
	public List<String> getBuildDetailList(String buildName1) {
		
		List<String> buildDetailList = dao.getBuildDetailList(buildName1);
		
		return buildDetailList;
	}

	@Override
	public List<RoomVO> getRoomList() {

		List<RoomVO> roomList = dao.getRoomList();
		
		return roomList;
	}

	@Override
	public List<ReservationVO> getReservationList(String userid) {

		List<ReservationVO> reservationList = dao.getReservationList(userid);
		
		return reservationList;
	}

	

	/*@Override
	public List<RoomVO> getSWOptionList(HashMap<String, String> paraMap) {

		List<RoomVO> optionList = dao.getSWOptionList(paraMap);
			
		return optionList;
	}*/

	/*@Override
	public List<RoomVO> getSWOptionList(HashMap<String, Object> paraMap) {

		List<RoomVO> optionList = dao.getSWOptionList(paraMap);
		
		return optionList;
	}*/

	@Override
	public List<RoomVO> getSWOptionList(HashMap<String,String> paraMap) {

		List<RoomVO> optionByHomeList = dao.getSWOptionList(paraMap);
		
		return optionByHomeList;
	}
	
}
