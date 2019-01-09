<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css"> 
   .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
          overflow-wrap: break-word;
          font-size: 24px;
          font-weight: 800;
          line-height: 1.25em;
          color: rgb(72, 72, 72);
          padding-top: 2px;
          padding-bottom: 2px;
          margin: 0px}        

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
	   
	   $("#bedoqty").hide(); // 처음에 침대종류 숨기기
	   
	   // 침대 추가하기 버튼 클릭시 
	   var flag = false;
	   $("#bedAdd").click(function() {
		   if(flag == false){
			   var bed = $("#bedAdd").text("완료");   
			   $("#bedoqty").show();
			   flag = true;
		   }
		   else{
			  bed = $("#bedAdd").text("침대 추가하기");
			  $("#bedoqty").hide();
			  flag = false;
		   }
	   });
	   
	   
	   
   });// end of ready---
   
  
   
   //최대숙박인원 감소 버튼
   function peopleminus() {
	   var start = $("#peopleupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("인원수는 1명 이상이여야 합니다.");
		   minus = 1;
	   }
	   $("#peopleupdown").text(minus);
   }  
   
   //최대숙박인원 증가 버튼
   function peopleplus() {
	   var start = $("#peopleupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#peopleupdown").text(plus);
   }
   
   //침대수 감소 버튼
   function bedminus() {
	   var start = $("#bedupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("침대수는 1개 이상이여야 합니다.");
		   minus = 1;
	   }
	   $("#bedupdown").text(minus);
   }  
   
   //침대수 증가 버튼
   function bedplus() {
	   var start = $("#bedupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#bedupdown").text(plus);
   }
   
   //더블침대 감소 버튼
   function doubleminus() {
	   var start = $("#doubleupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#doubleupdown").text(minus);
   }  
   
   //더블침대 증가 버튼
   function doubleplus() {
	   var start = $("#doubleupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#doubleupdown").text(plus);
   }
   
   //퀸침대 감소 버튼
   function queenminus() {
	   var start = $("#queenupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#queenupdown").text(minus);
   }  
   
   //퀸침대 증가 버튼
   function queenplus() {
	   var start = $("#queenupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#queenupdown").text(plus);
   }
   
   //싱글침대 감소 버튼
   function singleminus() {
	   var start = $("#singleupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#singleupdown").text(minus);
   }  
   
   //싱글침대 증가 버튼
   function singleplus() {
	   var start = $("#singleupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#singleupdown").text(plus);
   }
   
   //쇼파베드침대 감소 버튼
   function sofaminus() {
	   var start = $("#sofaupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#sofaupdown").text(minus);
   }  
   
   //쇼파베드침대 증가 버튼
   function sofaplus() {
	   var start = $("#sofaupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#sofaupdown").text(plus);
   }

   
   
</script> 



<!-- header -->

<div>
   <div class="row" style="border: 0px solid green;">
 
   <!-- 진행상태 바 -->
   <div class="container col-md-12" style="border: 0px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:10%; background-color: #148487;">
	    </div>
	  </div>
	</div>
  

      <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
         <div class="title">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</div>
         <div class="row" style="padding: 0; border: 0px solid green;" >
         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">최대 숙박 인원</div>
         		<div class="col-md-2" style="border: 0px solid green;">
         		 	<button type="button" onclick="peopleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
         		</div>
         		<div class="col-md-1" id="peopleupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 1 </div>
         		<div class="col-md-2" style="border: 0px solid green;">
         		 	<button type="button" onclick="peopleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
         		</div>
         	</div>
         	
            <div class="col-md-10" style="margin-top: 50px; border: 0px solid red;">
                <div class="selecthead">게스트가 사용할 수 있는 침실은 몇 개인가요?</div>  
                <div class="col-md-9" style="padding: 0">
                <select id="roomselect1" class="select" name="room_type" style="width: 100%; padding: 9px;">  
                   <option value="1">침실 1개</option>
                   <option value="2">침실 2개</option>
                   <option value="3">침실 3개</option>
                   <option value="4">침실 4개</option>
                </select>
                </div>  
            </div>

            <div class="col-md-10" style="margin-top: 25px; margin-bottom: 25px; border: 0px solid red;">
                <div class="selecthead">게스트가 사용할 수 있는 침대는 몇 개인가요?</div>     
                <div class="col-md-5" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">침대</div>
         		<div class="col-md-2" style="padding-left: 25px; border: 0px solid green;">
         		 	<button type="button" onclick="bedminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
         		</div>
         		<div class="col-md-1" id="bedupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 1 </div>
         		<div class="col-md-2" style="border: 0px solid green;">
         		 	<button type="button" onclick="bedplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
         		</div>
            </div>                			            
         </div>
         
         <h3> 침대 유형 </h3>
         <hr/>
         <div class="row" style="border: 0px solid black">
	         <div class="col-md-7" style="border: 0px solid blue">
	         	<div style="font-size: 19px;">1번 침실</div>
	         	<div style="font-size: 19px; color: #767676;">침대 0개</div>
	         </div>
	         <div class="col-md-5" style="border: 0px solid red; height: 56px; padding-right: 0;"  >
	         	<button type="button" id="bedAdd" style="padding-left: 30px; padding-right:30px; height: 48px; background-color: white; float: right; border: 1px solid gray; border-radius: 3px; font-weight: bold; font-size: 1.3em">침대 추가하기</button>
	         </div>
         </div>
         
         <div class="row" id="bedoqty" style="border: 0px solid red;">
	         <div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
	       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">더블</div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="doubleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	       		</div>
	       		<div class="col-md-1" id="doubleupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 0 </div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="doubleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	       		</div>
	       	</div>
	       	 <div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
	       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">퀸</div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="queenminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	       		</div>
	       		<div class="col-md-1" id="queenupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 0 </div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="queenplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	       		</div>
	       	</div>
	       	<div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
	       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">싱글</div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="singleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	       		</div>
	       		<div class="col-md-1" id="singleupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 0 </div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="singleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	       		</div>
	       	</div>
	       	<div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
	       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">쇼파베드</div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="sofaminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	       		</div>
	       		<div class="col-md-1" id="sofaupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 0 </div>
	       		<div class="col-md-2" style="border: 0px solid green;">
	       		 	<button type="button" onclick="sofaplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	       		</div>
	       	</div>
       	</div>
       	<hr/>
       	
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

<!-- footer -->


