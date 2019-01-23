package com.spring.bnb.controller;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.PhotoVO;
import com.spring.bnb.model.ReportVO;
import com.spring.bnb.service.InterSHService;
import com.spring.common.AES256;
import com.spring.common.FileManager;
import com.spring.common.LargeThumbnailManager;
import com.spring.common.MyUtil;

@Controller
@Component
public class SHController {

	@Autowired
	private InterSHService service;
	
	@Autowired
	private AES256 aes;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private LargeThumbnailManager largeThumbnailManager;
	
	// 관리자 회원관리 페이지(페이징처리 전)
	@RequestMapping(value="/adminMember.air", method= {RequestMethod.GET})
	public String adminMember(HttpServletRequest req) {
		
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		memberList = service.getMemberList();
		
		String searchWord = req.getParameter("searchWord");
		String searchType = req.getParameter("searchType");

		if(searchType == null) {
			searchType = "username";
		}
		if(searchWord == null) {
			searchWord = "";
		}
		
		if(!"username".equals(searchType) &&
		   !"userid".equals(searchType) &&
		   !"addr".equals(searchType) ) {
			searchType = "username";
		}
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord", searchWord);
		paraMap.put("searchType", searchType);
		
		List<MemberVO> searchMember = service.getSearchMember(paraMap);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		System.out.println(str_currentShowPageNo);  
		
		
	    int totalCount = 0; // 총 게시물 건수
	    int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
	    int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서 , 초기치로는 1페이지로 설정한다.
	    int totalPage = 0; // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)	 
	    int startRno = 0; // 시작 행 번호
	    int endRno = 0; // 끝 행 번호
	    int blockSize = 10; // "페이지바" 에 보여줄 페이지의 갯수
	   
	    /*
	    	=== 총 페이지수(totalPage) 구하기 ===
	    	검색조건이 없을때의 총페이지수(search값이 null 또는 "" 인경우)와
	    	검색조건이 있을때의 총페이지수(search값이 null 이아니고  "" 도아닌경우)를 구해야 한다.
	    */
	    // 먼저, 총 게시물 건수를 구해야 한다.
	    // 총 게시물 건수는 검색조건이 있을때와 없을때로 나뉘어진다.
	    
	    totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
	    // 23.7 ==> 24.0 ==> 24
	   
	    if(str_currentShowPageNo == null) {
		    // 게시판 초기화면 일 경우
		   
		    currentShowPageNo = 1;
	    }
	    else {
		   // 특정페이지를 조회한 경우
		   try {
			   currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			   
			   if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {

				  currentShowPageNo = 1;
			   }
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
	    }
	    
	    // **** 가져올 게시글의 범위를 구한다.(공식!!!!) ****
	    /*
	    		currentShowPageNo	startRno	endRno
	    		======================================
	    		       1 페이지		   1		  10
	    			   1 페이지		   1		  10
	    			   1 페이지		   1		  10
	    			   ...			  ...        ...
	    */
	    
	    if(searchWord != null &&
			!searchWord.trim().equals("") &&
			!searchWord.trim().equals("null")) {
			// 검색이 있는경우(페이징 처리 한 것임)
			totalCount = service.getTotalCountWithSearch(paraMap);
		   
	    }
	    else {
			// 검색이 없는경우(페이징 처리 한 것임)
			totalCount = service.getTotalCountNoSearch();
	    }
	   
	    
	    startRno = ((currentShowPageNo-1)*sizePerPage) + 1;
	    endRno = (startRno + sizePerPage) - 1;
	    
	    paraMap.put("STARTRNO", String.valueOf(startRno));
	    paraMap.put("ENDRNO", String.valueOf(endRno));
	   
	    memberList = service.memberlistPaging(paraMap);
	    /*System.out.println("boardList.size() :"+boardList.size());*/
	    
	    // ===== #120. 페이지바 만들기 =====
	    String pagebar = "<ul>";
	    
	    System.out.println(totalCount);
	    System.out.println(sizePerPage);
	    System.out.println(currentShowPageNo);
	    System.out.println(totalPage);
	    System.out.println(startRno);
	    System.out.println(endRno);
	    System.out.println(blockSize);
	    
	    pagebar += MyUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, "", searchWord, null, "adminMember.air");
	   
	    pagebar += "</ul>";
		
		// ===== #68. 글조회수(readCount)증가 (DML문 update)는
		/*            반드시 해당 글제목을 클릭했을 경우에만 글조회수가 증가되고 
		                         이전글보기, 다음글보기를 했을 경우나 웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 안되도록 한다.
		  			 이것을 하기 위해서는 우리는 session을 이용하여 처리한다.===== 
		*/
	    
		HttpSession session = req.getSession();
		session.setAttribute("readCountPermission", "yes");
		
		req.setAttribute("memberList", memberList);
		req.setAttribute("searchMember", searchMember);
	    req.setAttribute("pagebar", pagebar); // view단에서 pagebar 넘기기
	   
	    String gobackURL = MyUtil.getCurrentURL(req);
	    req.setAttribute("gobackURL", gobackURL);
	    
	    
	    
		
		return "admin/adminMember.admintiles";
	}
	
	
	// 관리자 회원관리 페이지(ajax)
	@RequestMapping(value="/adminMemberJSON.air", method= {RequestMethod.GET})
	public String adminMemberJSON(HttpServletRequest req) {
		
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		memberList = service.getMemberList();
		
		String searchWord = req.getParameter("searchWord");
		String searchType = req.getParameter("searchType");

		if(searchType == null) {
			searchType = "username";
		}
		if(searchWord== null) {
			searchWord = "";
		}
		
		if(!"username".equals(searchType) &&
		   !"userid".equals(searchType) &&
		   !"addr".equals(searchType) ) {
			searchType = "username";
		}
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord", searchWord);
		paraMap.put("searchType", searchType);
		
		List<MemberVO> searchMember = service.getSearchMember(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(searchMember == null) {
			
			for(int i=0; i<memberList.size(); i++) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("USERID", memberList.get(i).getUserid());
				jsonObj.put("USERNAME", memberList.get(i).getUsername());
				jsonObj.put("BIRTHDAY", memberList.get(i).getBirthday());
				jsonObj.put("GENDER", memberList.get(i).getGender());
				jsonObj.put("PHONE", memberList.get(i).getPhone());
				jsonObj.put("ADDR", memberList.get(i).getAddr());
				jsonObj.put("DETAILADDR", memberList.get(i).getDetailAddr());
				
				jsonArr.put(jsonObj);
			}
			
			String str_jsonArr = jsonArr.toString();
			req.setAttribute("str_jsonArr", str_jsonArr);
		}
		
		else if(searchMember != null) {
			
			for(int i=0; i<searchMember.size(); i++) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("USERID", searchMember.get(i).getUserid());
				jsonObj.put("USERNAME", searchMember.get(i).getUsername());
				jsonObj.put("BIRTHDAY", searchMember.get(i).getBirthday());
				jsonObj.put("GENDER", searchMember.get(i).getGender());
				jsonObj.put("PHONE", searchMember.get(i).getPhone());
				jsonObj.put("ADDR", searchMember.get(i).getAddr());
				jsonObj.put("DETAILADDR", searchMember.get(i).getDetailAddr());
				
				jsonArr.put(jsonObj);			
				
			}
			
			String str_jsonArr = jsonArr.toString();
			req.setAttribute("str_jsonArr", str_jsonArr);
		}

		return "admintiles/admin/adminMemberJSON";
	}
	
	// 관리자 회원상세 페이지
	@RequestMapping(value="/memberDetail.air", method= {RequestMethod.GET})
	public String memberDetail(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		// System.out.println("userid : "+userid);
		
		if(userid != null) {
			MemberVO membervo = service.getMemberDetail(userid);
			// System.out.println("membervo : "+membervo);
			// System.out.println(membervo.getProfileimg());
		
			List<HashMap<String, String>> reservation = service.getReservation(userid);
			
			// System.out.println("reservation : "+reservation);
			
			List<HashMap<String, String>> mycoupon = service.getMycoupon(userid);			
			// System.out.println("mycoupon : "+mycoupon);
			
			req.setAttribute("membervo", membervo);
			req.setAttribute("reservation", reservation);
			req.setAttribute("mycoupon", mycoupon);

			return "admin/memberDetail.admintiles";
			
		}
		
		else {
			return "admin/adminMember.admintiles";
		}
	
	}
	 
	// 관리자 신고관리 페이지
	@RequestMapping(value="/adminVan.air", method= {RequestMethod.GET})
	public String adminVan(HttpServletRequest req) {
		
		/*List<ReportVO> reportvo = new ArrayList<ReportVO>();
		
		reportvo = service.getReport();
		// System.out.println(reportMap);
		
		String searchWord = req.getParameter("searchWord");
		String searchType = req.getParameter("searchType");

		if(searchType == null) {
			searchType = "username";
		}
		if(searchWord== null) {
			searchWord = "";
		}
		
		if(!"num".equals(searchType) &&
		   !"userid".equals(searchType) ) {
			searchType = "username";
		}
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord", searchWord);
		paraMap.put("searchType", searchType);
		
		List<MemberVO> searchMember = service.getSearchMember(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(searchMember == null) {
			
			for(int i=0; i<memberList.size(); i++) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("USERID", memberList.get(i).getUserid());
				jsonObj.put("USERNAME", memberList.get(i).getUsername());
				jsonObj.put("BIRTHDAY", memberList.get(i).getBirthday());
				jsonObj.put("GENDER", memberList.get(i).getGender());
				jsonObj.put("PHONE", memberList.get(i).getPhone());
				jsonObj.put("ADDR", memberList.get(i).getAddr());
				jsonObj.put("DETAILADDR", memberList.get(i).getDetailAddr());
				
				jsonArr.put(jsonObj);
			}
			
			String str_jsonArr = jsonArr.toString();
			req.setAttribute("str_jsonArr", str_jsonArr);
		}
		
		else if(searchMember != null) {
			
			for(int i=0; i<searchMember.size(); i++) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("USERID", searchMember.get(i).getUserid());
				jsonObj.put("USERNAME", searchMember.get(i).getUsername());
				jsonObj.put("BIRTHDAY", searchMember.get(i).getBirthday());
				jsonObj.put("GENDER", searchMember.get(i).getGender());
				jsonObj.put("PHONE", searchMember.get(i).getPhone());
				jsonObj.put("ADDR", searchMember.get(i).getAddr());
				jsonObj.put("DETAILADDR", searchMember.get(i).getDetailAddr());
				
				jsonArr.put(jsonObj);			
				
			}
			
			String str_jsonArr = jsonArr.toString();
			req.setAttribute("str_jsonArr", str_jsonArr);
		}*/
		
		return "admin/adminVan.admintiles";
	}
	
	// 신고 글쓰기 페이지 요청
	@RequestMapping(value="/vanWrite.air", method= {RequestMethod.GET})
	public String vanWrite(HttpServletRequest req) {

		
		return "home/vanWrite.hometiles";
	}
	
	// 신고 글쓰기 페이지 요청
	@RequestMapping(value="/vanWriteEnd.air", method= {RequestMethod.GET})
	public String vanWriteEnd(ReportVO reportvo, HttpServletRequest req) {
		
		int n = 0;
		n = service.add(reportvo);
		
		String loc = "";
		if(n==1) {	
			loc = req.getContextPath()+"/vanWrite.air";
			// getContextPath() => /board
		}
		else {		
			loc = req.getContextPath()+"/index.air";
		}
		
		req.setAttribute("n", n);
		req.setAttribute("loc", loc);
		
		return "home/vanWriteEnd.hometiles";
	}
	
	// 쿠폰등록 페이지 요청
	@RequestMapping(value="/couponRegs.air", method= {RequestMethod.GET})
	public String couponReg(HttpServletRequest req) {

		
		return "admin/couponRegs.admintiles";
	}
	
	// 쿠폰등록 완료 요청
	@RequestMapping(value="/couponRegsEnd.air", method= {RequestMethod.POST})
	public String couponRegEnd(HttpServletRequest req) {
		
		String cpname = req.getParameter("cpname");
		String dcmoney = req.getParameter("dcmoney");
		
		String randomNo = "";
		for(int i=0; i<6; i++) {
			randomNo += Integer.toString(MyUtil.myRandom(1, 9));
		}

		HashMap<String, String> paramap = new HashMap<String, String>();
		paramap.put("randomNo", randomNo);
		paramap.put("cpname", cpname);
		paramap.put("dcmoney", dcmoney);
		
		System.out.println(randomNo);
		System.out.println(cpname);
		System.out.println(dcmoney);
		
		int n = 0;
		n = service.cpAdd(paramap);
		
		String loc = "";
		if(n==1) {	
			loc = req.getContextPath()+"/couponRegs.air";
		}
		else {		
			loc = req.getContextPath()+"/admin.air";
		}
		
		req.setAttribute("n", n);
		req.setAttribute("loc", loc);
		
		return "admin/couponRegsEnd.admintiles";
	}
	
	
	
	// ==== #스마트에디터1. 단일사진 파일업로드 ====
	@RequestMapping(value="/image/phothUpload.action", method= {RequestMethod.GET})
	public String photoUpload(PhotoVO photovo, HttpServletRequest req) {
		
		String callback = photovo.getCallback();
	    String callback_func = photovo.getCallback_func();
	    String file_result = "";
	    
		if(!photovo.getFiledata().isEmpty()) {
			// 파일이 존재한다라면
			
			/*
			   1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
			   >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
			        우리는 WAS 의 webapp/resources/photo_upload 라는 폴더로 지정해준다.
			 */
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"photo_upload";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
		//	System.out.println(">>>> 확인용 path ==> " + path); 
			// >>>> 확인용 path ==> C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\photo_upload
			
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화한 후 파일올리기
			String newFilename = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
						
			try {
				bytes = photovo.getFiledata().getBytes(); 
				// getBytes()는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다. 
				/* 2-1. 첨부된 파일을 읽어오는 것
					    첨부한 파일이 강아지.png 이라면
					    이파일을 WAS(톰캣) 디스크에 저장시키기 위해
					    byte[] 타입으로 변경해서 받아들인다.
				*/
				// 2-2. 이제 파일올리기를 한다.
				String original_name = photovo.getFiledata().getOriginalFilename();
				//  photovo.getFiledata().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다. 
				newFilename = fileManager.doFileUpload(bytes, original_name, path);
				
		//      System.out.println(">>>> 확인용 newFileName ==> " + newFileName); 
				
				int width = fileManager.getImageWidth(path+File.separator+newFilename);
		//		System.out.println("확인용 >>>>>>>> width : " + width);
				
				if(width > 600) {
					width = 600;
					newFilename = largeThumbnailManager.doCreateThumbnail(newFilename, path);
				}
		//		System.out.println("확인용 >>>>>>>> width : " + width);
				
				String CP = req.getContextPath();  // board
				file_result += "&bNewLine=true&sFileName="+newFilename+"&sWidth="+width+"&sFileURL="+CP+"/resources/photo_upload/"+newFilename; 
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			// 파일이 존재하지 않는다라면
			file_result += "&errstr=error";
		}
	    
		return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	// ==== #스마트에디터4. 드래그앤드롭을 사용한 다중사진 파일업로드 ====
	@RequestMapping(value="/image/multiplePhotoUpload.action", method={RequestMethod.POST})
	public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {
	    
		/*
		   1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
		   >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
		        우리는 WAS 의 webapp/resources/photo_upload 라는 폴더로 지정해준다.
		 */
		
		// WAS 의 webapp 의 절대경로를 알아와야 한다. 
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/"); 
		String path = root + "resources"+File.separator+"photo_upload";
		// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
		
	//	System.out.println(">>>> 확인용 path ==> " + path); 
		  
		
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();
		
		String strURL = "";
		
		try {
			if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
	    		String filename = req.getHeader("file-name"); //파일명을 받는다 - 일반 원본파일명
	    		
	    //		System.out.println(">>>> 확인용 filename ==> " + filename); 
	    		// >>>> 확인용 filename ==> berkelekle%ED%8A%B8%EB%9E%9C%EB%94%9405.jpg
	    		
	    		InputStream is = req.getInputStream();
	    	/*
	          	요청 헤더의 content-type이 application/json 이거나 multipart/form-data 형식일 때,
	          	혹은 이름 없이 값만 전달될 때 이 값은 요청 헤더가 아닌 바디를 통해 전달된다. 
	          	이러한 형태의 값을 'payload body'라고 하는데 요청 바디에 직접 쓰여진다 하여 'request body post data'라고도 한다.

               	서블릿에서 payload body는 Request.getParameter()가 아니라 
            	Request.getInputStream() 혹은 Request.getReader()를 통해 body를 직접 읽는 방식으로 가져온다. 	
	    	 */
	    		String newFilename = fileManager.doFileUpload(is, filename, path);
	    	
				int width = fileManager.getImageWidth(path+File.separator+newFilename);
       //		System.out.println(">>>> 확인용 width ==> " + width);
				
				if(width > 600) {
					width = 600;
					newFilename = largeThumbnailManager.doCreateThumbnail(newFilename, path);
				}
		//		System.out.println(">>>> 확인용 width ==> " + width);
				// >>>> 확인용 width ==> 600
				// >>>> 확인용 width ==> 121
	    	
				String CP = req.getContextPath(); // board
			
				strURL += "&bNewLine=true&sFileName="; 
            	strURL += newFilename;
            	strURL += "&sWidth="+width;
            	strURL += "&sFileURL="+CP+"/resources/photo_upload/"+newFilename;
	    	}
		
	    	/// 웹브라우저상에 사진 이미지를 쓰기 ///
			PrintWriter out = res.getWriter();
			out.print(strURL);
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}// end of void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res)---------------- 
	
}
