<%@page import="com.spring.common.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   String ctxPath = request.getContextPath(); 
%>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">

   .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif ;
          overflow-wrap: break-word ;
          font-size: 24px ;
          font-weight: 800 ;
          line-height: 1.25em ;
          color: rgb(72, 72, 72) ;
          padding-top: 2px ;
          padding-bottom: 2px ;
          margin: 0px ;}       

   .select{font-size: var(--font-form-element-font-size, 16px) ;
          line-height: var(--font-form-element-line-height, 24px) ;
          letter-spacing: var(--font-form-element-letter-spacing, normal) ;
          font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) ;
          text-transform: var(--font-form-element-text-transform, undefined) ;
          color: #484848 ;
          padding-top: var(--spacing-form-element-vertical, 10px) ;
          padding-bottom: var(--spacing-form-element-vertical, 10px) ;
          font-weight: var(--font-light-font-weight, normal) ;
          background-color: transparent ;
          border-radius: 3px;}  

   .selecthead{font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif ;
             overflow-wrap: break-word ;
             font-size: 16px ;
             font-weight: 600 ;
             line-height: 1.375em ;
             color: rgb(118, 118, 118) ;
             margin-bottom: 8px ;} 

</style>

 

<script type="text/javascript">

   $(document).ready(function(){
	   
      $("#guestroom").hide(); 

      $("#buildType_detail").change(function() {
    	  $("#guestroom").show();
      });
      
      // 건물타입 셀랙박스 
      $("#buildType").change(function(){
    	  
    	 // 건물유형선택 셀랙박스 선택가능하게
    	 $("#buildType_detail").attr("disabled", false);

    	  var buildType = $("#buildType").val();   	 
    	  var form_data = {"buildType":buildType};
 		 
 		  $.ajax({
	 		 url:"roomtypeJSON.air",
	 		 type:"GET",
	 		 dataType:"JSON",
	 		 data:form_data,
	 		 success:function(json) {
		 		 var result = "<option selected value='0' disabled>건물 유형 선택</option>";
		 		 
		 		 $.each(json, function(entryIndex, entry){
		 			
		 			 result += "<option value="+entry.BUILDTYPE_DETAIL_IDX+">"+entry.BUILDTYPE_DETAIL_NAME+"</option>";
		 		 });
		 		 
		 		 $("#buildType_detail").html(result);  
	 		  
	 		 },
	 		 error: function(request, status, error){
	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		 }
	 	 });// end of $.ajax({ --- 	
 			 
      });// $("#buildType").change(function()
    		  
    		  
      $("#testbtn").click(function(){
    	  $("#gobackURL").val("<%=MyUtil.getCurrentURL(request) %>");
      });

   });// $(document).ready(function()
		   
   function back(){
		var frm = document.roomtype;
		frm.action = "roomstap1.air";
		frm.method = "GET";
		frm.submit();
	}
   
   function next(){
		var frm = document.roomtype;
		frm.gobackURL.value = gobackURL;
		frm.action = "bedroom.air";
		frm.method = "GET";
		frm.submit();
	}

</script>

<form name="roomtype">
	<div>
	   <div class="row" style="border: 0px solid green;">
	   <div class="container col-md-12" style="border: 0px solid red;">
		  <div class="progress" style="height: 13px;"> 
		    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
		    </div>
		  </div>
		</div>
	
	      <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
	         <div class="title">등록하실 숙소 종류는 무엇인가요?</div>
	         <div class="row" style="padding: 0; border: 0px solid green;" >
	            <div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
	                <div class="selecthead">우선 범위를 좁혀볼까요?</div>    
	                <select id="buildType" class="select" name="buildType" style="width: 100%; padding: 9px;">  
	                	<option selected value="0" disabled>하나를 선택해주세요.</option>
	                    <c:forEach items="${buildType}" var="map">
	                   		<option value="${map.BUILDTYPE_IDX}">${map.BUILDTYPE}</option>
	                    </c:forEach>
	                </select>
	
	            </div>
	            <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
	                <div class="selecthead">건물 유형을 선택하세요</div>    
	                <select id="buildType_detail" class="select" name="buildType_detail" style="width: 100%; padding: 9px;" disabled>  
	                  	<option selected value="0">건물 유형 선택</option>
	                </select>
	            </div>
	
	            <div id="guestroom" >
	               <div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
	                   <div class="selecthead">게스트가 묵게 될 숙소 유형을 골라주세요.</div>    
	                   <select  class="select" name="room_type" style="width: 100%; padding: 9px;">  
	                      <c:forEach items="${roomtype}" var="map">
							<option value="${map.ROOMTYPE_IDX}">${map.ROOMTYPE_NAME}</option> 
						</c:forEach>
	                   </select>
	
	               </div> 
	               <div class="col-md-9" style="margin-top: 30px; border: 0px solid red;">
	                  <div class="row" style="border: 0px solid blue; padding-left: 15px;">
	                     <div class="selecthead">게스트만 사용하도록 만들어진 숙소인가요?</div> 
	                     <div class="row" style="border: 0px solid red; padding-left: 2px;">   
	                        <div class="col-md-1" style="border: 0px solid black;">
	                              <input type="radio" id="yesradio" name="yesno" checked="checked"/>
	                        </div>
	
	                        <div class="col-md-11" style="border: 0px solid blue;" >
	                              <label for="yesradio"><span style="font-size: 15px;">예. 게스트용으로 따로 마련된 숙소입니다.</span></label>
	                        </div>
	                     </div>
	
	                     <div class="row" style="border: 0px solid red; padding-left: 2px;">   
	                        <div class="col-md-1" style="border: 0px solid black; ">
	                              <input type="radio" id="noradio" name="yesno"/>
	                        </div>
	
	                        <div class="col-md-11" style="border: 0px solid blue;" >
	                              <label for="noradio"><span style="font-size: 15px;">아니요. 제 개인 물건이 숙소에 있습니다.</span></label>
	                        </div>
	                     </div>
	                  </div>
	
	                  <div class="row" style="border: 0px solid blue; padding-left: 15px; margin-top: 30px;">
	                     <div class="selecthead">숙박업체로 에어비앤비에 숙소를 등록하시나요?</div> 
	                     <div class="row" style="border: 0px solid red; padding-left: 2px;">   
	                        <div class="col-md-1" style="border: 0px solid black;">
	                              <input type="radio" id="yesradio2" name="yesno2" checked="checked"/>
	                        </div>
	
	                        <div class="col-md-11" style="border: 0px solid blue;" >
	                              <label for="yesradio2"><span style="font-size: 15px;">예, 저는 숙박업체의 운영자 또는 직원입니다</span></label>
	                        </div>
	                     </div>
	
	                     <div class="row" style="border: 0px solid red; padding-left: 2px;">   
	                        <div class="col-md-1" style="border: 0px solid black; ">
	                              <input type="radio" id="noradio2" name="yesno2"/>
	                        </div>
	
	                        <div class="col-md-11" style="border: 0px solid blue;" >
	                              <label for="noradio2"><span style="font-size: 15px;">아니요, 숙박업체가 아닙니다.</span></label>
	                        </div>
	                     </div>
	                  </div>
	               </div>
	            </div>  
	         </div>
	
	         <div class="col-md-8" style="z-index:10; padding: 0">
	         <div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 0;" >
		         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
		            <button type="button" onclick="back();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
		         </div>
		         <div class="col-md-6" style="border: 0px solid red;"></div>
		         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
		            <button type="button" onclick="next();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
		         </div>
	        </div> 
	       </div>
	      </div>
	
	      <div class="col-md-4" style="border: 0px solid blue;">
	         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
	      </div>
	
	   </div>
	</div>
	
</form>
