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
         <div class="row" style="padding: 0; border: 0px solid green; padding-bottom: 20px;" >
         	<div class="col-md-12 title">체크인시간 체크아웃시간 정하기</div>
            <div class="col-md-11" id="text"> 체크인 가능 시간을 선택해 주세요. </div>
         </div>
         
        <div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 20px;  margin-bottom: 20px;" >
	         <div class="col-md-12" style="padding-left: 0;">
	         	<div class="col-md-5" style="font-size: 17px; color: #747474; padding-bottom: 10px"> 체크인시간: </div>
	         	<div class="col-md-6" style="font-size: 17px; color: #747474; padding-bottom: 10px"> 체크아웃시간: </div>
	         	<div class="col-md-5">
	         		<select name="room_type" style="width: 100%; padding: 13px; border-radius: 3px;">  
						<option value="NOT_SELECTED" disabled="">시간 선택</option>
						<option value="FLEXIBLE">조정가능</option>
						<option value="8">08:00</option>
						<option value="9">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
						<option value="24">00:00</option>
						<option value="25">01:00(다음 날)</option>
					</select>
	         	</div>
	         	
	         	<div class="col-md-5">
	         		<select name="room_type" style="width: 100%; padding: 13px; border-radius: 3px;">  
						<option value="NOT_SELECTED" disabled="">시간 선택</option>
						<option value="FLEXIBLE">조정가능</option>
						<option value="9">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
						<option value="24">00:00</option>
						<option value="25">01:00(다음 날)</option>
						<option value="26">02:00(다음 날)</option>
					</select>
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
