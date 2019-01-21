package com.spring.bnb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;

//===== #32. DAO 선언  =====
@Repository
//DB Exception Translation
public class SODAO implements InterSODAO {
	
	//===== #33. 의존 객체 주입하기 (DI:Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 나의 쿠폰 리스트 가져오기
	@Override
	public List<HashMap<String, String>> getMyCoupon(String loginuser) {
		
		List<HashMap<String, String>> getMyCoupon = sqlsession.selectList("cso.getMyCoupon",loginuser);
		return getMyCoupon;
	}

	@Override
	public MemberVO getMyInfo(String loginuser) {
		MemberVO myInfo = sqlsession.selectOne("cso.getMyInfo", loginuser);
		return myInfo;
	}
	
	// 나의 정보수정 하기
	@Override
	public int memberUpdate(MemberVO member) {
		int n = sqlsession.update("cso.memberUpdate",member);
		return n;
	}
	
	//나의 예약 내역 가져오기
	@Override
	public List<HashMap<String,String>> getMemberReservationList(String loginuser) {
		List<HashMap<String,String>> memberReservation = sqlsession.selectList("cso.getMemberReservationList",loginuser);
		return memberReservation;
	}

	//나의 예약 상세 내역 가져오기
	@Override
	public HashMap<String, String> getMemberReservationDetail(HashMap<String,String> paraMap) {
		 HashMap<String, String> resDetail = sqlsession.selectOne("cso.getMemberReservationDetail", paraMap);
		return resDetail;
	}

	@Override
	public HashMap<String, String> getMap(HashMap<String, String> paraMap) {
		HashMap<String, String> rsvLocation = sqlsession.selectOne("cso.getMap",paraMap);
		return rsvLocation;
	}

	// 내가 작성한 후기 
	@Override
	public List<HashMap<String, String>> getMyReview(String userid) {
		List<HashMap<String, String>> myWriteReview= sqlsession.selectList("cso.getMyReview", userid);
		
		/*A.review_idx,B.roomcode,B.fk_userid AS host_userid,A.correct,
A.communicate,A.clean,A.position,A.checkin,A.value
,A.review_content,A.hostanswer,A.review_writedate
*/
		
		List<ReviewVO> myReviewVO = new ArrayList<ReviewVO>();
		for(HashMap<String,String> map : myWriteReview) {
			int review_idx = map.get("review_idx");
			int correct = map.get("correct");
			String communicate = map.get("communicate");
			String clean= map.get("clean");
			String position=map.get("position");
			String checkin=map.get("checkin");
			String value=map.get("value");
			String review_content=map.get("review_content");
			String hostanswer =map.get("hostanswer");
			String review_writedate=map.get("review_writedate");
			
			String roomcode = map.get("roomcode");
			String fk_userid= map.get("fk_userid");
			
			RoomVO roomvo = new RoomVO();
			ReviewVO reviewvo = new ReviewVO();
			
			roomvo.setRoomcode(roomcode);
			roomvo.setFk_userid(fk_userid);
			
			reviewvo.setReview_idx(review_idx);
			reviewvo.setCorrect(correct);
			reviewvo.setCommunicate(communicate);
			reviewvo.setClean(clean);
			reviewvo.setPosition(position);
			reviewvo.setCheckin(checkin);
			reviewvo.setValue(value);
			reviewvo.setReview_content(review_content);
			reviewvo.setHostAnswer(hostAnswer);
			reviewvo.setReview_writedate(review_writedate);
			
			
			
		}
		
	}




	
}
