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
		
		List<HashMap<String, String>> reviewList =sqlsession.selectList("wc.getBestReviewList");
		
		for(HashMap<String,String> review : reviewList) {
			 String fk_userid  = review.get("FK_USERID");
			 String review_content = review.get("REVIEW_CONTENT");
			 String review_writedate = review.get("REVIEW_WRITEDATE");
			 String profileimg = review.get("PROFILEIMG"); 
		}
		
		return rList;
	}
}
 