<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
	    //전역변수
	    var obj = [];
	    
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "report_content",
	        sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	    	}
		});
		
		$(".error1").hide();
		$(".error2").hide();
		$(".error3").hide();
	    
	    $("#btnWrite").click(function(){
	    	
	       //id가 content인 textarea에 에디터에서 대입
	       obj.getById["report_content"].exec("UPDATE_CONTENTS_FIELD", []);
	       /*  obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); */
	        
	       var reporttype = $("#reporttype").val();
	       if(reporttype == "") {
	    	   alert("게시글 유형을 선택해주세요.");
	    	   return;
	       }
	       else {
	    	   $(".error2").hide();
	   		   $(".error3").hide();
	    	   var report_subject = $("#report_subject").val().trim();
		       if(report_subject == "") {
		    	   $(".error2").show();
		    	   return;
		       }
		       else {
		    	   $(".error2").hide();
		   		   $(".error3").hide();
		    	   var report_content = $("#report_content").val().trim();
			       if(report_content == "") {
			    	   $(".error3").show();
			    	   return;
		       	   }
			       else {
			    	   $(".error2").hide();
			   		   $(".error3").hide();
			       }
		       }
	       }   
	       
	        //폼 submit
	        var writeFrm = document.writeFrm;
	        writeFrm.reportidx.value = $("#reportidx").val();
			writeFrm.action = "<%= request.getContextPath() %>/boardEditEnd.air";
			writeFrm.method = "POST";
			writeFrm.submit();
	    });

	});  
	
</script>    
    
<div style="padding: 3%; width: 60%; margin:0 auto;">  

	<form name="writeFrm" enctype = multipart/form-data>
		<div style="padding-bottom: 2%; padding-left: 2%; padding-right: 2%; text-align: center; font-weight: bold;"><h2>글쓰기</h2></div>
		
		<div class="input-group mb-3" style="padding: 2%;">
		  <div class="input-group-prepend" style="padding: 1%;">
		    <label class="input-group-text" for="inputGroupSelect01">유형</label>
		  </div>
		  <select class="custom-select" id="reporttype" name="reporttype" style="width: 200px; height: 30px; padding-left: 10px; font-size: 18px; color: #352c31; border: 1px solid #352c31; border-radius: 3px;">
		    <option selected value="">선택하기</option>
		    <option value="0">투숙객</option>
		    <option value="1">호스트</option>
		    <option value="2">자유글</option>
		  </select>
		</div>

		<div style="padding: 2%;">
			<label class="input-group-text" for="inputGroupSelect02">제목</label>
			<input type="text" class="form-control" placeholder="제목을 써주세요" id="report_subject" name="report_subject" value="${reportvo.report_subject}">
			<span class="error2" style="font-weight: bold; color: red; font-size: 14pt;"></span>
		</div>
		
		<div style="padding-left: 2%; padding-right: 2%; padding-bottom: 2%;">
			<label class="input-group-text" for="inputGroupSelect03">내용</label>
			<textarea name="report_content" rows="10" cols="100" style="width:100%; height:412px;" id="report_content">${reportvo.report_content}</textarea>
			<span class="error3" style="font-weight: bold; color: red; font-size: 14pt;"></span>
		</div>
		
		<div style="display:inline; text-align: center;">
			<div style="float:left; width:50%;"><button type="button" class="btn btn-success" id="btnWrite" style="width: 20%;">확인</button></div>
			<div style="float:left; width:50%;"><button type="button" class="btn" style="width: 20%;" onClick="javascript:history.back();">취소</button></div>
		</div>
	</form>
	
</div>