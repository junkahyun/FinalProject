package com.spring.bnb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.boboService;
import com.spring.common.FileManager;

@Controller
public class boboController {
	
	@Autowired
	private boboService service;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/roomstep1.air", method={RequestMethod.GET})
	public String roomstep1(HttpServletRequest req) {
		
		/*// 세션에 입력값을 넣어서 한번에 insert하려고 RoomVO를 세션값에 저장
		HttpSession session = req.getSession();		
		RoomVO roomvo = new RoomVO();
		session.setAttribute("roomvo", roomvo);*/
		
		return "become-host/room-step1.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstep1page.air", method={RequestMethod.GET})
	public String roomstep1page(HttpServletRequest req) {
		
		List<HashMap<String, String>> buildTypeList = service.selectbuildType();// 건물유형 가져오기
		req.setAttribute("buildTypeList", buildTypeList);		

		List<String> roomtype = service.selectroomtype();// 숙소유형 가져오기
		req.setAttribute("roomtype", roomtype);
		
		List<String> options = service.selectoptions();// 옵션 가져오기
		req.setAttribute("options", options);
		
		List<String> rule = service.selectrule();// 이용규칙 가져오기
		req.setAttribute("rule", rule);
		
		return "become-host/room-step1-page.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtypeJSON.air", method={RequestMethod.GET})
	public String roomtypeJSON(HttpServletRequest req) {
		
		String buildType = req.getParameter("buildType");

		JSONArray jsonArr = new JSONArray();
		
		if(buildType != null && !buildType.trim().isEmpty()) {
			List<HashMap<String,String>> buildTypeList = service.selectbuildTypedetail(buildType);// 건물세부유형 가져오기
			
			if(buildTypeList != null && buildTypeList.size() > 0) {
				for(HashMap<String,String> map : buildTypeList) {
					JSONObject jsonObj = new JSONObject();
					
					jsonObj.put("BUILDTYPE_DETAIL_IDX", map.get("BUILDTYPE_DETAIL_IDX")); // 키값, xml에서 읽어온 키값
					jsonObj.put("BUILDTYPE_DETAIL_NAME", map.get("BUILDTYPE_DETAIL_NAME"));
					
					jsonArr.put(jsonObj);
		
				}// end of for
			}// end of if
			
		}
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		
		return "JSON";		
	}	
	
	// 주소를 받아와서 지도에 값을 넣기위해서 씀
	@RequestMapping(value="/mapJSON.air", method={RequestMethod.GET})
	public String mapJSON(HttpServletRequest req) {
		
		String address = req.getParameter("address");
		JSONArray jsonArr = new JSONArray();
		
		jsonArr.put(address);
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		
		return "JSON";		
	}	
	
	@RequestMapping(value="/roomstep2.air", method={RequestMethod.GET})
	public String roomstep2(RoomVO roomvo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();	
		
		// roomvo에 들어간 값들을 세션에 저장한다 
		session.setAttribute("roomvo", roomvo);
		
		String[] optionchk = req.getParameterValues("optionchk");
		String[] rulechk = req.getParameterValues("rulechk");
		
		// 체크된 옵션들 세션에 저장하고 마지막에 insert작업
		if(optionchk != null) {
			session.setAttribute("optionchk", optionchk);
			/*for (String val : optionchk) {
			System.out.println(val);
		}*/
		}
		
		// 체크된 이용규칙들 세션에 저장하고 마지막에 insert작업
		if(rulechk != null) {
			session.setAttribute("rulechk", rulechk);
			/*for(String val : rulechk) {
			System.out.println(val);
		}*/
		}
				
		return "become-host/room-step2.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstep2page.air", method={RequestMethod.GET})
	public String roomstep2page(HttpServletRequest req) {
		
		return "become-host/room-step2-page.hosttiles_nofooter";
	}
	
	// 이미지 파일 가져오기
	@RequestMapping(value="/fileListJOSN.air", method={RequestMethod.POST})
	public String fileListJOSN(MultipartHttpServletRequest req) throws Exception {
		
		List<MultipartFile> fileList = req.getFiles("file");
		
		HttpSession session = req.getSession();
		RoomVO roomvo = (RoomVO) session.getAttribute("roomvo");
		if(fileList != null) {  // 이미지첨부 다중파일을 받아왔다라면 
			// 이미지첨부 다중파일을 업로드할 WAS 의 webapp 의 절대경로를 알아와야 한다. 
			String root = req.getServletContext().getRealPath("/");
	        //System.out.println(root);
	        String realPath = root+"resources"+File.separator+"images"+File.separator+"becomehost";
	        //System.out.println(realPath);
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			String roomImgfilename = ""; // WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;    // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
			
			List<String> imgList = new ArrayList<String>();
			
			for(int i=1; i<fileList.size(); i++) { 
				 bytes = fileList.get(i).getBytes(); // 첨부파일의 내용물(byte)을 읽어옴.
				 
				 // 파일업로드 한 후 업로드되어진 파일명  가져오기
				 roomImgfilename = fileManager.doFileUpload(bytes, fileList.get(i).getOriginalFilename(), realPath);
				 // 예를들어 newFileName 에는  2019012519592316420706146795.png 와 같은 것이 들어옴.

				 imgList.add(roomImgfilename);

			}// end of for------------------------------------------------

			// file의 첫번째를 메인이미지로 한다.
			String roomMainImg = fileManager.doFileUpload(bytes, fileList.get(0).getOriginalFilename(), realPath);
			roomvo.setRoomMainImg(roomMainImg);
			
			// 나머지 이미지들을 set
			roomvo.setRoomimgList(imgList);
			
		}// end of if---------------------------------------


		
		
		//System.out.println(roomMainImg);
		
		/*List<String> roomimgList = new ArrayList<String>(); 
		
		for(int i=1; i<roomimgList.size(); i++) {
			String roomimgname = fileList.get(i).getOriginalFilename();
			roomimgList.add(roomimgname);
		}
		roomvo.setRoomimgList(roomimgList);
		*/
		
		// roomvo에 들어간 값들을 세션에 저장한다 
		session.setAttribute("roomvo", roomvo);
		
		JSONArray jsonArr = new JSONArray();

		jsonArr.put(fileList);
		
		String str_json = jsonArr.toString();
		req.setAttribute("str_json", str_json);
		
		return "JSON";
	}
	
	@RequestMapping(value="/roomstep3.air", method={RequestMethod.GET})
	public String roomstep3(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		RoomVO roomvo = (RoomVO) session.getAttribute("roomvo");
		
		// 파라미터 값에 RoomVO 안들어가서 이렇게 했다 
		String roomInfo = req.getParameter("roomInfo");
		String roomName = req.getParameter("roomName");
		
		roomvo.setRoomInfo(roomInfo);
		roomvo.setRoomName(roomName);
		
		// roomvo에 들어간 값들을 세션에 저장한다 
		session.setAttribute("roomvo", roomvo);
		
		return "become-host/room-step3.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstep3page.air", method={RequestMethod.GET})
	public String roomstep3page(HttpServletRequest req) {
		
		return "become-host/room-step3-page.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomlaststep.air", method={RequestMethod.GET})
	public String roomlaststep(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		RoomVO roomvo = (RoomVO) session.getAttribute("roomvo");
		
		String checkInTime = req.getParameter("checkInTime");
		String checkOutTime = req.getParameter("checkOutTime");
		String roomPrice = req.getParameter("roomPrice");
		String peakper = req.getParameter("peakper");
		String person_addpay = req.getParameter("person_addpay");
		String cleanPay = req.getParameter("cleanPay");
		String roomTel = req.getParameter("roomTel");
		
		roomvo.setCheckInTime(checkInTime);
		roomvo.setCheckOutTime(checkOutTime);
		roomvo.setRoomPrice(roomPrice);
		roomvo.setPeakper(peakper);
		roomvo.setPerson_addpay(person_addpay);
		roomvo.setCleanPay(cleanPay);
		roomvo.setRoomTel(roomTel);
		// roomvo에 들어간 값들을 세션에 저장한다 
		session.setAttribute("roomvo", roomvo);
		
		return "become-host/room-lastStep.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomfinish.air", method={RequestMethod.GET})
	public String roomfinish(HttpServletRequest req) {
		
		HttpSession session = req.getSession();		
		RoomVO roomvo = (RoomVO) session.getAttribute("roomvo");
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		roomvo.setHost(loginuser);
		System.out.println(roomvo.getHost().getUserid());
		
		int n = service.becomehost(roomvo);
		//int m = service.imgList(roomvo);
		if(n ==1) {
			return "host/hostroomList.hosttiles";
		}
		else return "become-host/error.hosttiles_nofooter";

		
	}
	

	
}
 