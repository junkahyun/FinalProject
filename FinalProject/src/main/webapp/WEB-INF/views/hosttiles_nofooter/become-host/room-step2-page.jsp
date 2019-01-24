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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>

<style type="text/css">
	  .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
          overflow-wrap: break-word;
          font-size: 24px;
          font-weight: 800;
          line-height: 1.25em;
          color: rgb(72, 72, 72);
          padding-top: 2px;
          padding-bottom: 20px;
          margin: 0px}  
</style>

 

<script type="text/javascript">

   $(document).ready(function(){
	
	   $("#second").hide();
	   $("#third").hide();
	   
   });// $(document).ready(function()

   // 버튼 함수들
   // first ---------------------------------------------------------
   function back1(){
	    var frm = document.roomtitle;
		frm.action = "roomstep2.air";
		frm.method = "GET";
		frm.submit();
	}
   
   function next1(){
	   $("#first").hide();
	   $("#second").show();
	}
   
	// second ---------------------------------------------------------
	function back2(){
	   $("#first").show();
	   $("#second").hide();
	}
	
	function next2(){
		$("#second").hide();
		$("#third").show();
	}
	
	// third ---------------------------------------------------------
	function back3(){
	   $("#second").show();
	   $("#third").hide();
	}
	
	function next3(){
		var frm = document.roomtitle; 
		frm.action="roomstep3.air";
		frm.method="GET";
		frm.submit();
	}

</script>

<form name="roomtitle">
	<div>
	   <div class="row" style="border: 0px solid green;">
	   
	   <!-- 진행상태바 -->
	   <div class="container col-md-12" style="border: 0px solid red;">
		  <div class="progress" style="height: 13px;"> 
		    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
		    </div>
		  </div>
	   </div>
	    
	    <!-- 입력창 반복되는 div 시작 -->
	    <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
	    
	    	<!-- 첫번째 입력창 시작-->
	    	<div class="row" id="first">
	    		사진사진사진
	    	
	    		<div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
			            <button type="button" onclick="back1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		         </div> 
	    	</div>
	    	<!-- 첫번째 입력창 끝-->
	    
	      	<!-- 두번째 입력창 시작 -->
	        <div class="row" id="second">
	         	<div class="col-md-8 title">숙소 설명하기</div>
	            <div class="col-md-8" style="font-size: 20px; color: #747474; padding-bottom: 10px;"> 요약 </div>
	            <div class="col-md-8"> 
	            	<textarea name="roomInfo" cols="45" rows="6" style="padding: 20px; border-radius: 4px; font-size: 18px; resize: none; outline: 0 solid transparent;" placeholder="이용시 주의사항, 주변정보 등을 입력하세요."></textarea>
	            </div>
	         
	
		         <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
			            <button type="button" onclick="back2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		         </div> 
	          </div> 
		      <!-- 두번째 입력창 끝 -->
		      
		      <!-- 세번째 입력창 시작-->
		      <div class="row" id="third">
	         	 <div class="col-md-8 title">이름 지정</div>
	             <div class="col-md-8"> 
	             	<textarea name="roomName" cols="45" rows="1" style="padding: 20px; border-radius: 4px; font-size: 18px; resize: none; outline: 0 solid transparent;" placeholder="숙소 제목"></textarea>
	             </div>
	          
	
		         <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
			            <button type="button" onclick="back3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		         </div> 
	          </div>
	    	  <!-- 세번째 입력창 끝-->

	    </div> <!-- 입력창 반복되는 div 끝 -->
	      
	
        <div class="col-md-4" style="border: 0px solid blue;">
       	  <img src="<%=request.getContextPath() %>/resources/images/boimg/roomenrollment.PNG" />
        </div>
	
	   </div>
	</div>
</form>
