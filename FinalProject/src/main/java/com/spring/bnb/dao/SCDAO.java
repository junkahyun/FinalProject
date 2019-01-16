package com.spring.bnb.dao;

import org.springframework.stereotype.Repository;

import com.spring.bnb.model.RoomVO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class SCDAO implements InterSCDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 해당유저의 숙소리스트 가져오기
	@Override
	public List<RoomVO> getRoomList(String userid) {
		List<RoomVO> roomList = sqlsession.selectList("sc.getRoomList", userid);
		return roomList;
	}
	
	// 룸정보 가져오기
	@Override
	public RoomVO getRoomInfo(String roomcode) {
		RoomVO roomvo = sqlsession.selectOne("sc.getRoomInfo",roomcode);

		String fk_buildType_detail_idx= roomvo.getFk_buildType_detail_idx();
		if(fk_buildType_detail_idx != null) {
			List<HashMap<String,String>> buildtypeList = sqlsession.selectOne("sc.getBuildType",fk_buildType_detail_idx);
			String buildtype = buildtypeList.get(0).get("buildType");
			roomvo.setBuildType(buildtype);
			String buildtype_detail_name = buildtypeList.get(1).get("buildType_detail_name");
			roomvo.setBuildType_detail_name(buildtype_detail_name);
		}
		List<String> roomimgList = sqlsession.selectList("sc.getRoomImgList", roomcode);// 숙소 사진 리스트
		roomvo.setRoomimgList(roomimgList);
		
		List<HashMap<String,String>> optionList = sqlsession.selectList("sc.getRoomOptionList", roomcode); // 숙소 옵션 리스트
		roomvo.setOptionList(optionList);

		return roomvo;
	}
}
