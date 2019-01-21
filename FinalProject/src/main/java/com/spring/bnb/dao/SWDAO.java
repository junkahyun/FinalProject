package com.spring.bnb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.ReservationVO;
import com.spring.bnb.model.RoomVO;


@Repository
public class SWDAO implements InterSWDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.

	@Override
	public List<String> getBuildList() {
		
		List<String> buildList = sqlsession.selectList("sw.getBuildList");
		
		return buildList;
	}

	@Override
	public List<String> getOptionList() {

		List<String> optionList = sqlsession.selectList("sw.getOptionList");
		
		return optionList;
	}

	@Override
	public List<String> getRoomType() {

		List<String> roomType = sqlsession.selectList("sw.getRoomType");
		
		return roomType;
	}

	@Override
	public List<String> getRoomRule() {
		
		List<String> roomRule = sqlsession.selectList("sw.getRoomRule");
		
		return roomRule;
	}

	@Override
	public List<String> getBuildDetailList(String buildName1) {
		
		List<String> buildDetailList = sqlsession.selectList("sw.getBuildDetailList", buildName1);
		
		return buildDetailList;
	}

	@Override
	public List<RoomVO> getRoomList() {

		List<RoomVO> roomList = sqlsession.selectList("sw.getRoomList");
		
		return roomList;
	}

	@Override
	public List<ReservationVO> getReservationList(String userid) {

		List<ReservationVO> reservationList = sqlsession.selectList("sw.getReservationList", userid);
		
		return reservationList;
	}

	@Override
	public List<String> getOptionList(String roomcode) {

		List<String> optionList = sqlsession.selectList("sw.getOptionList", roomcode);
			
		return optionList;
	}

	

}
