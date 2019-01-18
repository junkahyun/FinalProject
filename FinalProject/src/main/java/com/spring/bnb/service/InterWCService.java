package com.spring.bnb.service;

import java.util.List;

import com.spring.bnb.model.ReviewVO;
import com.spring.bnb.model.RoomVO;

public interface InterWCService {

	List<RoomVO> getRecommandRoomList();

	List<ReviewVO> getBestReviewList();

}
