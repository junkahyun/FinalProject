package com.spring.bnb.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterSCService;

@Controller
public class SCController {

	@Autowired
	private InterSCService service; 

	@RequestMapping(value = "/hostroomList.air", method = RequestMethod.GET)
	public String hostroomList(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		String userid = null;
		HttpSession session = req.getSession(); 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
		
		if(loginuser != null) { 
			userid = loginuser.getUserid(); 
		}
		roomList = service.getRoomList(userid);
		
		req.setAttribute("roomList", roomList);
		return "host/hostroomList.hosttiles";
	}

	// 호스트 등록된 숙소 수정하기
	@RequestMapping(value = "/hostRoomEdit.air", method = { RequestMethod.GET })
	public String hostRoomEdit(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		String roomcode = req.getParameter("roomcode");
		//System.out.println("roomcode1 : " + roomcode);

		HttpSession session = req.getSession(); 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
		String userid = null;
		if(loginuser != null) { 
			userid = loginuser.getUserid(); 
		}
		
		roomList = service.getRoomList(userid);
		RoomVO roomvo = (RoomVO) service.getRoomInfo(roomcode);

		req.setAttribute("roomList", roomList);
		req.setAttribute("roomvo", roomvo);

		return "hostRoomEdit/hostRoomEdit.hosttiles_nofooter";
	}
	
	// 숙소 수정페이지에서 검색 
	@RequestMapping(value = "/roomnameSearch.air", method = { RequestMethod.POST })
	public String roomnameSearch(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		String searchWord = req.getParameter("searchWord");
		System.out.println("searchWord:"+searchWord);
		
		HttpSession session = req.getSession(); 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
		String userid = null;
		if(loginuser != null) { 
			userid = loginuser.getUserid(); 
		}
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("userid", userid);
		paraMap.put("searchWord", searchWord);
		
		roomList = service.roomnameSearch(paraMap); 
		
		JSONArray jsonArr = new JSONArray(); // [] null이 아니다.
		
		for(int i=0; i<roomList.size(); i++) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("roomcode", roomList.get(i).getRoomcode());
			jsonobj.put("roomName", roomList.get(i).getRoomName());
			jsonobj.put("roomstatus", roomList.get(i).getRoomstatus());
			jsonobj.put("roomMainImg", roomList.get(i).getRoomMainImg());
			System.out.println(jsonobj);
			jsonArr.put(jsonobj);
		}
		String str_json = jsonArr.toString();
		System.out.println(str_json);
		req.setAttribute("str_json", str_json);
		return "JSON";
	}

	// 호스트 숙소사진 수정
	@RequestMapping(value = "/hrPhotoEdit.air", method = { RequestMethod.GET })
	public String hrPhotoEdit(HttpServletRequest req) {

		String roomcode = req.getParameter("roomcode");
	//	System.out.println("roomcode2 : " + roomcode);
		RoomVO roomvo = (RoomVO) service.getRoomInfo(roomcode);
		req.setAttribute("roomvo", roomvo);
		return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
	}
	
	// 이미지파일 추가
	@RequestMapping(value = "/imgfileupload.air", method = { RequestMethod.POST })
	public String imgfileupload(MultipartHttpServletRequest req) throws IllegalStateException, IOException {
		
		String roomcode = req.getParameter("roomcode");
		//System.out.println("roomcode3 : "+roomcode);
		
		// 저장 경로 설정
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator+ "images" +File.separator+"becomehost";		
		//System.out.println("root"+root);
		//System.out.println(path);
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		
		List<MultipartFile> mfList = req.getFiles("imgfile");
		int n =0;
		for(int i=0; i<mfList.size(); i++) {
			String filename = mfList.get(i).getOriginalFilename();
			//System.out.println(filename);
			
			String newFilename = null;
			String fileExt = filename.substring(filename.lastIndexOf(".")); 
			if(fileExt == null || fileExt.equals("")) 
				return null;
			// 서버에 저장할 새로운 파일명을 만든다.
			newFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", 
					         Calendar.getInstance());
			newFilename += System.nanoTime();
			newFilename += fileExt;			
			//System.out.println(newFilename);
			
			mfList.get(i).transferTo(new File(path+File.separator+newFilename));
			HashMap<String,String> paraMap = new HashMap<String,String>();
			paraMap.put("roomcode", roomcode);
			paraMap.put("newFilename", newFilename);
			
			n = service.setRoomImg(paraMap);
		}
		
		if(n==1) {
			RoomVO roomvo = service.getRoomInfo(roomcode);
			List<String> roomimgList = roomvo.getRoomimgList();
			
			JSONArray jsonArr = new JSONArray(); // [] null이 아니다.
			//JSONObject jsonobj = new JSONObject();
			for(int i=0; i<roomimgList.size(); i++) {
				//jsonobj.put("roomimg", roomimgList.get(i));
				//System.out.println(jsonobj);
				jsonArr.put(roomimgList.get(i));
			}
			String str_json = jsonArr.toString();
			req.setAttribute("str_json", str_json);
		}
		
		return "JSON";
		
		//return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
	}
	
	// 이미지파일 삭제 
	@RequestMapping(value = "/imgfiledelete.air", method = { RequestMethod.POST })
	public String imgfiledelete(HttpServletRequest req){
		
		String deleteFilename = req.getParameter("img");
		String roomcode = req.getParameter("roomcode");
		System.out.println(deleteFilename);
		System.out.println(roomcode);
		
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator+ "images"+File.separator+"becomehost";	
		File file = new File(path+File.separator+deleteFilename);
		System.out.println(file);
		
		if(file.exists()) {
			file.deleteOnExit();
			service.deleteFile(deleteFilename);
			
			RoomVO roomvo = service.getRoomInfo(roomcode);
			List<String> roomimgList = roomvo.getRoomimgList();
			
			JSONArray jsonArr = new JSONArray(); // [] null이 아니다.
			//JSONObject jsonobj = new JSONObject();
			for(int i=0; i<roomimgList.size(); i++) {
				//jsonobj.put("roomimg", roomimgList.get(i));
				//System.out.println(jsonobj);
				jsonArr.put(roomimgList.get(i));
			}
			//System.out.println(jsonArr);
			String str_json = jsonArr.toString();
			req.setAttribute("str_json", str_json);
		}
		
		return "JSON";
	}
	
	// 커버이미지 변경 하는 메소드 
	@RequestMapping(value="/coverChange.air", method= {RequestMethod.GET})
	public String coverChange(HttpServletRequest req) {
		String imgFilename = req.getParameter("imgFilename");
		System.out.println(imgFilename);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("imgFilename", imgFilename);
		
		String str_json = jsonobj.toString();
		req.setAttribute("str_json", str_json);
		return "JSON";
	}
	
	@RequestMapping(value="/saveCover.air", method= {RequestMethod.GET})
	public String saveCover(HttpServletRequest req) {
		String roomcode = req.getParameter("roomcode");
		String changeImg = req.getParameter("changeImg");
		String mainImg = req.getParameter("mainImg");
		HashMap<String,String> paraMap = null;
		System.out.println(roomcode);
		System.out.println(changeImg);
		System.out.println(mainImg);
		
		int n = 0; 
		int n1 = 0; 
		int n2 = 0;
		
		paraMap = new HashMap<String,String>();
		paraMap.put("roomcode", roomcode);
		paraMap.put("changeImg", changeImg);
		n = service.updateCoverImg(paraMap);
		
		if(n==1) {
			n1 = service.deleteFile(changeImg);
		}
		
		if(n1==1) {
			paraMap = new HashMap<String,String>();
			paraMap.put("roomcode", roomcode);
			paraMap.put("newFilename", mainImg);

			n2 = service.setRoomImg(paraMap);
		}
		
		if(n2==1) {
			RoomVO roomvo = (RoomVO) service.getRoomInfo(roomcode);
			req.setAttribute("roomvo", roomvo);
		}
		return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
	}
	
	// 호스트 숙소 제목 수정
	@RequestMapping(value = "/hrTitleEdit.air", method = { RequestMethod.GET })
	public String hrTitleEdit() {
		return "hostRoomEdit/hrTitleEdit.hosttiles_nofooter";
	}

	// 호스트 숙소 침실 수정
	@RequestMapping(value = "/bedroomEdit.air", method = { RequestMethod.GET })
	public String bedroomEdit() {
		return "hostRoomEdit/bedroomEdit.hosttiles_nofooter";
	}

	// 숙소 페이지
	@RequestMapping(value = "/hostroomPage.air", method = { RequestMethod.GET })
	public String hostroomPage() {
		return "host/hostroomPage.hosttiles";
	}

	// 숙소 평점, 수입, 성취도 페이지
	@RequestMapping(value = "/hostroomMark.air", method = { RequestMethod.GET })
	public String hostroomMark(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		HttpSession session = req.getSession(); 
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
		String userid = null;
		if(loginuser != null) { 
			userid = loginuser.getUserid(); 
		}
		roomList = service.getRoomList(userid);
		req.setAttribute("roomList", roomList);
		return "host/hostroomMark.hosttiles";
	}
	
	@RequestMapping(value = "/rankShowJSON.air", method = { RequestMethod.POST })
	@ResponseBody
	public String rankShowJSON(HttpServletRequest req, HttpServletResponse res) {
		
		String roomcode = req.getParameter("roomcode");
		System.out.println("char roomcode:"+roomcode);
		
		
		return roomcode;
	}

	///////////////////////////////////////////////////////////////////////////////////
	
	// ***** 호스트 등록된 숙소 수정하기(기본요금 수정) ***** //
	@RequestMapping(value="/changeDefaultRoomCharge.air", method= {RequestMethod.GET})
	public String changeDefaultRoomCharge (HttpServletRequest req) {
		return "hostRoomEdit/changeDefaultRoomCharge.hosttiles_nofooter";
	}
	
	// ***** 호스트 등록된 숙소 수정하기(추가요금 수정) ***** //
	@RequestMapping(value="/changePlusRoomCharge.air", method= {RequestMethod.GET})
	public String changePlusRoomCharge (HttpServletRequest req) {
		return "hostRoomEdit/changePlusRoomCharge.hosttiles_nofooter";
	}
	
	// ***** 호스트 등록된 숙소 수정하기(체크인과 체크아웃 수정) ***** //
	@RequestMapping(value="/changeCheckInCheckOut.air", method= {RequestMethod.GET})
	public String changeCheckInCheckOut (HttpServletRequest req) {
		return "hostRoomEdit/changeCheckInCheckOut.hosttiles_nofooter";
	}

	// ***** 호스트 등록된 숙소 수정하기(숙박인원 수정) ***** //
	@RequestMapping(value="/changeHostingPeople.air", method= {RequestMethod.GET})
	public String changeHostingPeople (HttpServletRequest req) {
		return "hostRoomEdit/changeHostingPeople.hosttiles_nofooter";
	}

	// ***** 호스트 등록된 숙소 수정하기(편의시설 및 이용규칙 수정) ***** //
	@RequestMapping(value="/changeConvenienceAndRule.air", method= {RequestMethod.GET})
	public String changeConvenienceAndRule (HttpServletRequest req) {
		
		return "hostRoomEdit/changeConvenienceAndRule.hosttiles_nofooter";
	}
}
