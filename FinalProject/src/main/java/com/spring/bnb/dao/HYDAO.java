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
		List<String> optionList = sqlsession.selectList("hy.getOptionList", roomcode);
		roomvo.setOptionList(optionList);
		// 관심 수 가져오기
		int likeCount = sqlsession.selectOne("hy.getRoomLikeCount", roomcode);
		roomvo.setLikeCount(likeCount);
		
		return roomvo;
	}

}
