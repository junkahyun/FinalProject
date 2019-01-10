<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
          
     #text{font-size: 18px; 
     		padding-bottom: 10px;}      

</style>

<div>
   <div class="row" style="border: 0px solid green;">

   <div class="container col-md-12" style="border: px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
	    </div>
	  </div>
	</div> 

      <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">   
         <div class="row" style="padding: 0; border: 0px solid green;" >
         	<div class="col-md-12 title">에어비앤비의 게스트 필수 요건을 검토합니다.</div>
            <div class="col-md-11" id="text"> 모든 에어비앤비 게스트는 예약 전에 다음 정보를 제공해야 합니다. </div>
         </div>
         
        <div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 20px;  margin-bottom: 20px;" >
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-5" id="text">
	        		이메일 주소
	        	</div>
	         </div>
	         
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-5" id="text">
	        		전화번호 인증
	        	</div>
	         </div>
	         
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-5" id="text">
	        		결제 정보
	        	</div>
	         </div>
         </div>

         
         <div class="row" style="padding: 0; border: 0px solid green;" >
            <div class="col-md-11" id="text"> 게스트는 예약 전에 다음을 이행해야 합니다.</div>
         </div>

         <div class="row" style="padding-bottom: 20px;" >
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-11" id="text">
	        		숙소 이용규칙에 동의합니다.
	        	</div>
	         </div>
	         
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-11" id="text">
	        		호스트에게 메시지를 보내 여행에 관해 알리기
	        	</div>
	         </div>
	         
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-11" id="text">
	        		숙박 인원이 몇 명인지 알리기
	        	</div>
	         </div>
	         
	         <div class="col-md-12" style="padding-left: 0; border: 0px solid green; padding-top: 5px;">
	         	<div class="col-md-1">
	         		<img src="<%=request.getContextPath() %>/resources/boimg/check.png" />
	        	</div>
	        	<div class="col-md-11" id="text">
	        		게스트가 2일 이내에 도착할 예정이라면 체크인 시간을 확정하세요.
	        	</div>
	         </div>
         </div>

         <div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
	         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
	            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
	         </div>
	         <div class="col-md-6" style="border: 0px solid red;"></div>
	         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
	            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
	         </div>
        </div> 

      </div>

      <div class="col-md-4" style="border: 0px solid blue;">
         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
      </div>

   </div>
</div>
