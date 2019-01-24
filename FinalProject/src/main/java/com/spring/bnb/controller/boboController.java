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
	
	@RequestMapping(value="/roomstep3.air", method={RequestMethod.GET})
	public String roomstep3(RoomVO roomvo, HttpServletRequest request) {
		
		return "become-host/room-step3.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomstep3page.air", method={RequestMethod.GET})
	public String roomstep3page(HttpServletRequest req) {
		
		return "become-host/room-step3-page.hosttiles_nofooter";
	}
	
	@RequestMapping(value="/roomlaststep.air", method={RequestMethod.GET})
	public String roomlaststep(HttpServletRequest req) {
		
		return "become-host/room-lastStep.hosttiles_nofooter";
	}
	
	
	
	
	
	
	
	

	
	@RequestMapping(value="/roomimage.air", method={RequestMethod.GET})
	public String roomimage() {
		
		return "become-host/roomimage.hosttiles_nofooter";
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
