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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.InterSCService;
import com.spring.common.AES256;

@Controller
public class SCController {

	@Autowired
	private InterSCService service;

	@Autowired
	private AES256 aes;

	// 호스트 숙소 리스트
	@RequestMapping(value = "/hostroomList.air", method = { RequestMethod.GET })
	public String hostroomList(HttpServletRequest req) {
		List<RoomVO> roomList = null;

		/*
		 * HttpSession session = req.getSession(); MemberVO loginuser =
		 * (MemberVO)session.getAttribute("loginuser"); String userid = null;
		 * if(loginuser != null) { userid = loginuser.getUserid(); }
		 */
		String userid = null;
		userid = "leess";

		roomList = service.getRoomList(userid);
		System.out.println(userid);
		req.setAttribute("roomList", roomList);
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
	public String imgfileupload(MultipartHttpServletRequest req, @RequestParam("imgfile") MultipartFile[] multipartFile) {
		String roomcode = req.getParameter("roomcode");
		System.out.println("roomcode3 : "+roomcode);
		System.out.println(multipartFile.length);
		for(MultipartFile multi :multipartFile) {
			System.out.println("check"+multi.getOriginalFilename());
			System.out.println("End");
		}

		// 저장 경로 설정
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "files";
		//System.out.println(path);
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		/*
		 * for(int i=0; i<imgArr.size(); i++) {
		 * System.out.println(imgArr.get(i).getOriginalFilename()); String uploadFile =
		 * imgArr.get(i).getOriginalFilename(); MultipartFile mFile =
		 * req.getFile(uploadFile); String fileName =mFile.getOriginalFilename();
		 * System.out.println("실제 파일 이름 : " +fileName);
		 * 
		 * try { mFile.transferTo(new File(dir+fileName)); } catch
		 * (IllegalStateException | IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * }
		 */
		
		/*
		Iterator<String> files = req.getFileNames();
		// System.out.println("Iterator<String> files: "+files); --> 객체 이름 나옴
		while(files.hasNext()){
			String uploadFile = files.next(); 
			// System.out.println(uploadFile); -- > [object HTMLInputElement]
			MultipartFile mFile = req.getFile(uploadFile); 
			String fileName =mFile.getOriginalFilename(); 
			System.out.println("실제 파일 이름 : " +fileName); 
			try { 
				mFile.transferTo(new File(path+fileName)); 
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
		}*/

		return "hostRoomEdit/hrPhotoEdit.hosttiles_nofooter";
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
