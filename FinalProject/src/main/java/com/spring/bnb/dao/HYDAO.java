package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;


@Repository
public class HYDAO implements InterHYDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.

	@Override
	public RoomVO getRoomByCode(String roomcode) {		
		
		// 숙소정보 가져오기
		RoomVO roomvo = sqlsession.selectOne("hy.getRoomByCode", roomcode);
		// 호스트정보가져오기
		MemberVO host = sqlsession.selectOne("hy.getHost", roomvo.getFk_userid());
		roomvo.setHost(host);
		// 리뷰가져오기
		List<ReviewVO> reviewList = sqlsession.selectList("hy.getReviewListDAO", roomcode);
		for(ReviewVO review:reviewList){
			MemberVO reviewer = sqlsession.selectOne("hy.getReviewer",review.getFk_userid());
			review.setUser(reviewer);
		}
		roomvo.setReviewList(reviewList);
		// 침실정보 가져오기
		List<HashMap<String,String>> bedroomList = sqlsession.selectList("hy.getBedroomList", roomcode);
		roomvo.setBedroomList(bedroomList);
		// 옵션정보 가져오기
		List<HashMap<String,String>> optionList = sqlsession.selectList("hy.getOptionList", roomcode);
		roomvo.setOptionList(optionList);
		// 관심 수 가져오기
		int likeCount = sqlsession.selectOne("hy.getRoomLikeCount", roomcode);
		roomvo.setLikeCount(likeCount);
		// 숙소 이미지 리스트 가져오기
		/*List<String> roomimgList = sqlsession.selectList("hy.getRoomImgList", roomcode);
		roomvo.setRoomimgList(roomimgList);*/
		
		return roomvo;
	}

	@Override
	public MemberVO logincheck(MemberVO member) {
		MemberVO loginuser = sqlsession.selectOne("hy.logincheck",member); 
		if(loginuser!=null) {
			List<RoomVO> myroom = sqlsession.selectList("hy.checkHostUser",member);
			if(myroom != null) {
				loginuser.setMyroomList(myroom);
			}
		}
		return loginuser;
	}

	@Override
	public int insertLikeRoom(HashMap<String, Object> paraMap) {
		int n = sqlsession.insert("hy.insertLikeRoom", paraMap);
		return n;
	}

	@Override
	public List<HashMap<String, Object>> getMyLikeRoomList(String userid) {
		List<HashMap<String, Object>> resultMap = sqlsession.selectList("hy.getMyLikeRoomList",userid);
		return resultMap;
	}

	@Override
	public List<ReviewVO> getSearchReview(HashMap<String, String> paraMap) {
		List<ReviewVO> reviewList = sqlsession.selectList("hy.getSearchReview", paraMap);
		return reviewList;
	}

	@Override
	public int checkDuplicateID(String userid) {
		int n = sqlsession.selectOne("hy.checkDuplicateID", userid);
		return n;
	}

	@Override
	public int insertMember(MemberVO member) {
		int n = sqlsession.insert("hy.insertMember", member);
		return n;
	}

	@Override
	public List<RoomVO> getRecommendRoomList(String sigungu) {
		List<RoomVO> recommendRoomList = sqlsession.selectList("hy.getRecommendRoomList", sigungu);
		return recommendRoomList;
	}

}
