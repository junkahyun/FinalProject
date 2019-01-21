package com.spring.bnb.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.spring.bnb.model.*;

@Repository
public class WCDAO implements InterWCDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<RoomVO> getRecommandRoomList() { 
		List<HashMap<String, String>> roomList = sqlsession.selectList("wc.getAllRoomList");
		
		List<RoomVO> rList = new ArrayList<RoomVO>();
		
		for(HashMap<String,String> room : roomList) {
			String roomCode = room.get("ROOMCODE");
			String roomName = room.get("ROOMNAME");
			String roomMainImg = room.get("ROOMMAINIMG");
			String roomPrice = room.get("ROOMPRICE");
			String profileImg = room.get("PROFILEIMG");
			
			RoomVO rvo = new RoomVO();
			MemberVO mvo = new MemberVO();
			
			mvo.setProfileimg(profileImg);
			
			rvo.setRoomcode(roomCode);
			rvo.setRoomName(roomName);
			rvo.setRoomMainImg(roomMainImg);
			rvo.setRoomPrice(roomPrice);
			rvo.setHost(mvo);
			
			rList.add(rvo);
			
		}
		
		return rList;
	}

	@Override
	public List<ReviewVO> getBestReviewList() {
		List<ReviewVO> rList = new ArrayList<ReviewVO>();
		
		List<HashMap<String, String>> reviewList = sqlsession.selectList("wc.getBestReviewList");
		
		for(HashMap<String,String> review : reviewList) {
			 String fk_userid  = review.get("FK_USERID");
			 String review_content = review.get("REVIEW_CONTENT");
			 String review_writedate = review.get("REVIEW_WRITEDATE");
			 String profileimg = review.get("PROFILEIMG"); 
			 String roomname = review.get("ROOMNAME");
			 
			 ReviewVO rvo = new ReviewVO();
			 RoomVO roomvo = new RoomVO();
			 MemberVO mvo = new MemberVO();
			 
			 roomvo.setRoomName(roomname);
			 mvo.setProfileimg(profileimg);
			 
			 rvo.setFk_userid(fk_userid);
			 rvo.setReview_content(review_content);
			 rvo.setReview_writedate(review_writedate);
			 rvo.setUser(mvo);
			 rvo.setRoom(roomvo);
			 
			 rList.add(rvo);
			 
		}
		
		return rList;
	}

	
	@Override
	public List<RoomVO> getAllRoomList() {
		List<HashMap<String,String>> rList = sqlsession.selectList("wc.getWCAllRoomList");
		
		List<RoomVO> roomList = new ArrayList<RoomVO>();
		
		for(HashMap<String,String> map : rList) {
			String roomMainImg = map.get("ROOMMAINIMG");
			String roomName = map.get("ROOMNAME");
			String roomSido = map.get("ROOMSIDO");
			String roomSigungu = map.get("ROOMSIGUNGU");
			String roomBname = map.get("ROOMBNAME");
			String username = map.get("USERNAME");
			String roomPrice = map.get("ROOMPRICE");
			
			RoomVO rvo = new RoomVO();
			MemberVO mvo = new MemberVO();
			mvo.setUsername(username);
			
			rvo.setRoomMainImg(roomMainImg);
			rvo.setRoomName(roomName);
			rvo.setRoomSido(roomSido);
			rvo.setRoomSigungu(roomSigungu);
			rvo.setRoomBname(roomBname);
			rvo.setRoomPrice(roomPrice);
			rvo.setHost(mvo);
			
			roomList.add(rvo);
		}
		 
		return roomList;
	}
}
 