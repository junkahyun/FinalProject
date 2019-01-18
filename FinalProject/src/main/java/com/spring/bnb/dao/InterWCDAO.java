package com.spring.bnb.dao;

import java.util.List;

import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;

public interface InterWCDAO {

	List<RoomVO> getRecommandRoomList();

	List<ReviewVO> getBestReviewList();

}
