package com.spring.bnb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterHYService;


import com.spring.bnb.service.InterSCService;

@Controller
public class SCController {

	@Autowired
	private InterSCService service; 

	@RequestMapping(value = "/hostroomList.air", method = RequestMethod.GET)
	public String hostroomList() {

		return "host/hostroomList.hosttiles";
	}

	// 호스트 등록된 숙소 수정하기
	@RequestMapping(value = "/hostRoomEdit.air", method = { RequestMethod.GET })
	public String hostRoomEdit(HttpServletRequest req) {
		List<RoomVO> roomList = null;
		String roomcode = req.getParameter("roomcode");
		//System.out.println("roomcode1 : " + roomcode);

		/*
		 * HttpSession session = req.getSession(); MemberVO loginuser =
		 * (MemberVO)session.getAttribute("loginuser"); String userid = null;
		 * if(loginuser != null) { userid = loginuser.getUserid(); }
		 */
		String userid = null;
		userid = "leess";

		roomList = service.getRoomList(userid);
		RoomVO roomvo = (RoomVO) service.getRoomInfo(roomcode);

		/*
		 * List<String> roomimgList = new ArrayList<String>(); roomimgList =
		 * service.getRoomImg(roomcode);
		 * 
		 * List<String> optionList = new ArrayList<String>(); optionList =
		 * service.getOption(roomcode);
		 */

		req.setAttribute("roomList", roomList);
		req.setAttribute("roomvo", roomvo);

		return "hostRoomEdit/hostRoomEdit.hosttiles_nofooter";
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

	@RequestMapping(value = "/imgfileupload.air", method = { RequestMethod.POST })
	public String imgfileupload(MultipartHttpServletRequest req) throws IllegalStateException, IOException {
		
		String roomcode = req.getParameter("roomcode");
		//System.out.println("roomcode3 : "+roomcode);
		
		// 저장 경로 설정
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator+ "images";		
		//System.out.println("root"+root);
		//System.out.println(path);
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		
		List<MultipartFile> mfList = req.getFiles("imgfile");
		
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
			
			service.setRoomImg(paraMap);
		}
		
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
		
		return "JSON";
		
		//return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
	}
	
	@RequestMapping(value = "/imgfiledelete.air", method = { RequestMethod.POST })
	public String imgfiledelete(HttpServletRequest req){
		
		String imgfilename = req.getParameter("img");
		String roomcode = req.getParameter("roomcode");
		System.out.println(imgfilename);
		System.out.println(roomcode);
		
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator+ "images";	
		File file = new File(path+File.separator+imgfilename);
		System.out.println(file);
		
		if(file.exists()) {
			file.deleteOnExit();
			service.deleteFile(imgfilename);
			
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
	
	

	// 호스트 숙소세부사진 수정
	@RequestMapping(value = "/hrDetailPhotoEdit.air", method = { RequestMethod.GET })
	public String hrDetailPhotoEdit() {
		return "hostRoomEdit/hrDetailPhotoEdit.hosttiles_nofooter";
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
	public String hostroomMark() {
		return "host/hostroomMark.hosttiles";
	}
}
