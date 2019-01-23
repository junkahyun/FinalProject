package com.spring.bnb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
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

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.boboService;
import com.spring.common.FileManager;

@Controller
public class boboController {
	
	@Autowired
	private boboService service;
	
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
		
		/*List<String> options = service.selectoptions();// 옵션 가져오기
		req.setAttribute("options", options);*/
		
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
		
		String[] optionchk = req.getParameterValues("optionchk");
		HttpSession session = req.getSession();	
		session.setAttribute("optionchk", optionchk);
		
		/*for (String val : optionchk) {
			System.out.println(val);
		}*/
				
		return "become-host/room-step2.hosttiles_nofooter";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/map.air", method={RequestMethod.GET})
	public String map(HttpServletRequest req) {
		
		String address = req.getParameter("address");
		req.setAttribute("address", address);
		
		return "become-host/map.hosttiles_nofooter";
	}			

	@RequestMapping(value="/roomtype.air", method={RequestMethod.GET})
	public String roomtype(HttpServletRequest req) {	
			
			// 뒤로가기를 위한 작업
			String currentURL = req.getRequestURL().toString();
			req.setAttribute("currentURL", currentURL);


			// 옵션 hold를 위한 작업
			String buildType = req.getParameter("buildType");
			if(buildType == null) buildType="0";
			req.setAttribute("buildType", buildType);
			String buildType_detail = req.getParameter("buildType_detail");	
			if(buildType_detail == null) buildType_detail="0";
			req.setAttribute("buildType_detail", buildType_detail);
			

			List<HashMap<String, String>> buildTypeList = service.selectbuildType();// 건물유형 가져오기
			req.setAttribute("buildTypeList", buildTypeList);		

			List<String> roomtype = service.selectroomtype();// 숙소유형 가져오기
			req.setAttribute("roomtype", roomtype);
			
			return "become-host/roomtype.hosttiles_nofooter";

	}
	
	
	@RequestMapping(value="/bedroom.air", method={RequestMethod.GET})
	public String bedroom(HttpServletRequest req) {
		
		//뒤로가기를 위한 작업
		String currentURL = req.getParameter("currentURL");
		//System.out.println(currentURL);		
		String queryString = req.getQueryString();
		//System.out.println(queryString);		
		currentURL += "?" + queryString;
		//System.out.println(currentURL);		
		req.setAttribute("currentURL", currentURL);
		
		
		String buildType_detail = req.getParameter("buildType_detail");
		String room_type = req.getParameter("room_type");
		
		// RoomVO에 입력값 저장(나중에 한번에 insert하려고)
		RoomVO roomvo = new RoomVO();
		roomvo.setFk_buildType_detail_idx(buildType_detail);
		roomvo.setFk_roomType_idx(room_type);
			
		return "become-host/bedroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/bathroom.air", method={RequestMethod.GET})
	public String bathroom() {
		
		return "become-host/bathroom.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/location.air", method={RequestMethod.GET})
	public String location() {
		
		return "become-host/location.hosttiles_nofooter";
	} 
	
	@RequestMapping(value="/option.air", method={RequestMethod.GET})
	public String option() {
		
		return "become-host/option.hosttiles_nofooter";
	}	
	
	@RequestMapping(value="/roomimage.air", method={RequestMethod.GET})
	public String roomimage() {
		
		return "become-host/roomimage.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roominfo.air", method={RequestMethod.GET})
	public String roominfo() {
		
		return "become-host/roominfo.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomtitle.air", method={RequestMethod.GET})
	public String roomtitle() {
		
		return "become-host/roomtitle.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstep3.air", method={RequestMethod.POST})
	public String roomstep3(RoomVO roomvo,HttpServletRequest request, @RequestParam("file") MultipartFile multipartFile) throws Exception{
		
		String filename = null; // 파일명 초기화
		if (!multipartFile.isEmpty()) { // 파일 있으면(업로드 했으면)
			ServletContext application = request.getServletContext();
			System.out.println(application);
			String realPath = application.getRealPath("/roomImgUpload");
			
			filename = multipartFile.getOriginalFilename(); // 업로드한 파일명 가져오기
			// 엣지 브라우저 요청 파일이름 처리
			int index = filename.lastIndexOf("\\");
			filename = filename.substring(index + 1);
	        
	        File file = new File(realPath, filename);
	        if (file.exists()) { // 해당 경로에 동일한 파일명이 이미 존재하는 경우
	        	// 파일명 앞에 업로드 시간 밀리초 붙여서 파일명 중복을 방지
	        	filename = System.currentTimeMillis() + "_" + filename;
	        	file = new File(realPath, filename);
	        }
	        
	        System.out.println("업로드 경로: " + realPath);
	        System.out.println("업로드 파일명: " + filename);
	        
	        // 업로드 수행
	        IOUtils.copy(multipartFile.getInputStream(), new FileOutputStream(file));
		} else {
			System.out.println("파일이 존재하지 않거나 파일크기가 0 입니다.");
		}
		
        // DB insert

		
		return "become-host/room-step3.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/guestrule.air", method={RequestMethod.GET})
	public String guestrule() {
		
		return "become-host/guestrule.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/checkInOutTime.air", method={RequestMethod.GET})
	public String checkInOutTime() {
		
		return "become-host/checkInOutTime.hosttiles_nofooter";
	}
	
	///// 테스트
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String dragAndDrop(Model model) {
         
        return "fileUpload";
         
    }
     
    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
          
        Iterator<String> itr =  multipartRequest.getFileNames();
         
        String filePath = "C:/test"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
             //기존 주석처리
         /*   MultipartFile mpff = multipartRequest.getFile(itr.next());
            String originFileName = mpff.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
*/           
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                          
       }
          
        return "success";
    }
	
	
 
    
    
    
	
	
}
