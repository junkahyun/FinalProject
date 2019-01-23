package com.spring.bnb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.bnb.model.RoomVO;
import com.spring.bnb.service.boboService;
import com.spring.common.FileManager;
import com.spring.common.MyUtil;


@Controller
public class boboController {
	
	@Autowired
	private boboService service;
	
	//===== #139. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) ===== 
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
		for (String val : optionchk) {
			System.out.println(val);
		}
		

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
	public String roomstep3(RoomVO roomvo, MultipartHttpServletRequest req) {
		/*
		   웹페이지에 요청form이 enctype="multipart/form-data" 으로 되어있어서 Multipart 요청(파일처리 요청)이 들어올때 
		   컨트롤러에서는 HttpServletRequest 대신 MultipartHttpServletRequest 인터페이스를 사용해야 한다.
		  MultipartHttpServletRequest 인터페이스는 HttpServletRequest 인터페이스와 MultipartRequest 인터페이스를 상속받고있다.
		   즉, 웹 요청 정보를 얻기 위한 getParameter()와 같은 메소드와 Multipart(파일처리) 관련 메소드를 모두 사용가능하다.
		 
		 ===== 사용자가 쓴 글에 파일이 첨부되어 있는 것인지 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다. =====
		========= !!첨부파일이 있는지 없는지 알아오기 시작!! ========= */
		MultipartFile attach = roomvo.getAttach();
		System.out.println(attach);
		
		String[] roomMainImg = req.getParameterValues("roomMainImg");
		for(String a : roomMainImg) {
			System.out.println(a);
		}
		
		if(attach != null) {
			// attach 가 비어있지 않다면(즉, 첨부파일이 있는 경우라면) 
			/*
			    1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다. 
			    >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기   
			       우리는 WAS의 webapp/resources/files 라는 폴더로 지정해주겠다. 
			 */
			// WAS의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root+"resources"+File.separator+"files"; 
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			System.out.println(">>>> 확인용 path ==> " + path);
			// >>>> 확인용 path ==> C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files  
			
			
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화한 후 파일올리기
			String newFileName = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도
			
			long fileSize = 0;
			// 파일크기를 읽어오기 위한 용도 
			 
			try {
				bytes = attach.getBytes();
				// getBytes() 는 첨부된 파일을 바이트 단위로 파일을 다 읽어오는 것이다.
				
				newFileName = fileManager.doFileUpload(bytes, roomvo.getRoomMainImg(), path);
				// 첨부된 파일을 WAS(톰캣)의 디스크로 파일올리기를 하는 것이다.
				// 파일을 올린후 예를 들어, 20190107091235343253242345332432.png 와 같은 파일명을 얻어온다. 
				
				System.out.println(">>>> 확인용 newFileName ==> " + newFileName); 
				// >>>> 확인용 newFileName ==> 201901071126172769559848039192.jpg
				
			// 3. BoardVO boardvo 에 fileName 값과 orgFilename 값과 fileSize 값을 넣어주기 
				roomvo.setRoomImgfilename(newFileName);
				//roomvo.setImgorgFilename(attach.getOriginalFilename());
				
				fileSize =attach.getSize();
				// 첨부한 파일의 크기인데 리턴타입은 long 타입이다.
				
				//roomvo.setImgfileSize(String.valueOf(fileSize)); 
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! =========
		
		//int n = service.addimg(roomvo);		
		
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
