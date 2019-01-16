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
	   
	   $("#second").hide();
	   $("#third").hide();
	   $("#fourth").hide();
	   $("#fifth").hide();
	   $("#sixth").hide();	   
   
	  //첫번째 입력창 스크립트 시작-----------------------------------------------------------------------------------------------------------
	  $("#buildType").val("${buildType}"); // 옵션값 hold
	  $("#buildType_detail").val("${buildType_detail}"); // 옵션값 hold
	  
      $("#guestroom").hide(); 

      $("#buildType_detail").change(function() {
    	  $("#guestroom").show();
      });
      
      // 건물타입 (첫번째)셀랙박스 
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
      
      //첫번째 입력창 스크립트 끝 -----------------------------------------------------------------------------------------------------------
      
      //두번째 입력창 스크립트 시작 -----------------------------------------------------------------------------------------------------------
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
	   
/* 	   $("#bedroom").change(function(){
		   
		   var g = $("#addbed").html();
		   
		   var html = "";
			
		   var bedroom = $("#bedroom").val();
			
			if(bedroom == "1"){
				$("#addarea").empty();
			}
			else{
				for(var i=1; i<=bedroom; i++){
					html += g;
				
				}
				
			}
			
			$("#addarea").html(html);
				
				
		   
	   }); */
	   
      //두번째 입력창 스크립트 끝 -----------------------------------------------------------------------------------------------------------
      

   });// $(document).ready(function()

   // 버튼 함수들
   // first ---------------------------------------------------------
   function back1(){
	    var frm = document.roomtype;
		frm.action = "roomstap1.air";
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
		$("#third").hide();
		$("#fourth").show();
	}
	
	// fourth ---------------------------------------------------------
	function back4(){
	   $("#third").show();
	   $("#fourth").hide();
	}
	
	function next4(){
		$("#fourth").hide();
		$("#fifth").show();
	}
	
	// fifth ---------------------------------------------------------	
	function back5(){
	   
	}
	
	function next5(){
		
	}
	
	// sixth ---------------------------------------------------------	
	function back6(){
	   $("#second").show();
	   $("#third").hide();
	}
	
	function next6(){
		
	}		
   
   //최대숙박인원 감소 버튼
   function peopleminus() {
	   var start = $("#peopleupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("인원수는 1명 이상이여야 합니다.");
		   minus = 1;
	   }
	   $("#peopleupdown").val(minus);
   }  
   
   //최대숙박인원 증가 버튼
   function peopleplus() {
	   var start = $("#peopleupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#peopleupdown").val(plus);
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
   
   //욕실 감소 버튼
   function bathroomsminus() {
	   var start = $("#bathroomsupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("욕실수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#bathroomsupdown").text(minus);
   }  
   
   //욕실 증가 버튼
   function bathroomsplus() {
	   var start = $("#bathroomsupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#bathroomsupdown").text(plus);
   }


</script>

<form name="roomtype">
	<div>
	   <div class="row" style="border: 0px solid green;">
	   
	   <!-- 진행상태바 -->
	   <div class="container col-md-12" style="border: 0px solid red;">
		  <div class="progress" style="height: 13px;"> 
		    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
		    </div>
		  </div>
		</div>
	    
	    <!-- 입력창 반복되는 div -->
	    <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
	      
	        <!-- 첫번째 입력창 시작-->
	      	<div class="row" id="first">
		         <div class="title">등록하실 숙소 종류는 무엇인가요?</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		            <div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
		                <div class="selecthead">우선 범위를 좁혀볼까요?</div>    
		                <select id="buildType" class="select" name="buildType" style="width: 100%; padding: 9px;">  
		                	<option value="0" disabled>하나를 선택해주세요.</option>
		                    <c:forEach items="${buildTypeList}" var="map">
		                   		<option value="${map.BUILDTYPE_IDX}">${map.BUILDTYPE}</option>
		                    </c:forEach>
		                </select>
		
		            </div>
		            <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
		                <div class="selecthead">건물 유형을 선택하세요</div>    
		                <select id="buildType_detail" class="select" name="buildType_detail" style="width: 100%; padding: 9px;" disabled>  
		                  	<option value="0">건물 유형 선택</option>
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
		            </div>  
		            
		         </div>
		         
		         <div class="col-md-8" style="z-index:10; padding: 0">
		         <div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 0;" >
			         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
			            <button type="button" onclick="back1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		        </div> 
		       </div>
	       </div>
	       <!-- 첫번째 입력창 끝-->
	       
	       
	       <!-- 두번째 입력창 시작 -->
	       <div class="row" id="second">
		         <div class="title">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</div>
		         <div class="row" style="padding: 0; margin-bottom: 100px; border: 0px solid green;" >
		         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
		         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">최대 숙박 인원</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="peopleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
		         		</div>
		         		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
		         			<input type="text" id="peopleupdown" name="people" value="1" style="border: 0; width: 20px; height: 20px;" readonly>   
		         		</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="peopleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
		         		</div>
		         	</div>
		         	
		            <div class="col-md-10" style="margin-top: 50px; border: 0px solid red;">
		                <div class="selecthead">게스트가 사용할 수 있는 침실은 몇 개인가요?</div>  
		                <div class="col-md-9" style="padding: 0">
		                <select id="bedroom" class="select" name="bedroom" style="width: 100%; padding: 9px;">  
		                   <%for(int i=1; i<=50; i++){ %>
		                   <option value="<%=i%>"><%="침실 "+i+"개"%></option>
		                   <%} %>
		                </select>
		                </div>  
		            </div>              			            
		         </div>
		         
		         <h3> 침대 유형 </h3>
		         
		         <div class="row" style="border: 0px solid black" id="addbed">
		         <hr/>
		         	<div class="col-md-12">
				         <div class="col-md-6" style="border: 0px solid blue">
				         	<div style="font-size: 19px;">1번 침실</div>
				         	<div style="font-size: 19px; color: #767676;">침대 0개</div>
				         </div>
				         <div class="col-md-6" style="border: 0px solid red; height: 56px; padding-right: 0;"  >
				         	<button type="button" id="bedAdd" style="padding-left: 30px; padding-right:30px; height: 48px; background-color: white; float: right; border: 1px solid gray; border-radius: 3px; font-weight: bold; font-size: 1.3em">침대 추가하기</button>
				         </div>
			        </div>
			      <hr/>
		         
		         <div class="col-md-12" id="bedoqty">
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
		       	</div>
		       	<div class="row" id="addarea"></div>
		       	
		       	
		       	<div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
			         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
			            <button type="button" onClick="back2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
			         </div>
		        </div>
	        
	        </div> 
	        <!-- 두번째 입력창 끝 -->
	        
	        <!-- 세번째 입력창 시작 -->
			<div class="row" id="third">
		         <div class="title">욕실 수</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
		         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">욕실</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="bathroomsminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
		         		</div>
		         		<div class="col-md-1" id="bathroomsupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 1 </div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="bathroomsplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
		         		</div>
		         	</div>                    			            
		         </div>
		
		       	<div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
			         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
			            <button type="button" onClick="back3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
			         </div>
		        </div>
	        </div>        	
	        <!-- 세번째 입력창 끝 -->
	        
	        <!-- 네번째 입력창 끝 -->
	        <div class="row" id="fourth">
		         <div class="col-md-10 title">숙소의 위치를 알려주세요.</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		         
		         	<div class="col-md-4" style="margin-top: 50px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">시/도</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="sido" name="sido" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 서울특별시" readonly="readonly"/>
						</div>
		            </div>
		            
		            <div class="col-md-4" style="margin-top: 50px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">시/군</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0">
							<input type="text" id="sigungu" name="sigungu" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 강남구" readonly="readonly"/>
						</div>
		            </div>
		         
		            <div class="col-md-8" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">동  / 도로명</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="bname" name="bname" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="이곳을 클릭해주세요" readonly="readonly"/>
							<input type="text" id="address" name="address" style="margin-top: 10px; margin-bottom : 0; margin-left:0; margin-right:0; padding: 25px;" class="input-data form-control" readonly="readonly"/>
						</div>
		            </div>
		            
		            <div class="col-md-8" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">상세주소(필수)</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="addrDetail" name="addrDetail" style="margin: 0; padding: 25px" class="input-data form-control" placeholder="예) 35동 3층 301호"/>
						</div>
		            </div>
		            
		            <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">우편번호</div>  
						<div class="col-md-5" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="postnum" name="postnum" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 12345" readonly="readonly"/>
						</div>
		            </div> 
		            
		         </div>
		
		         <div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 10px; padding-top: 20px; padding-left: 0; padding-right: 0;" >
			         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
			            <button type="button" onclick="back4();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next4();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
			         </div>
		        </div>
	        </div>
	        <!-- 네번째 입력창 끝 -->
	        
	        <!-- 다섯번째 입력창 끝 -->
	        <!-- 다섯번째 입력창 끝 -->
	        
	        <!-- 여섯번째 입력창 끝 -->
	        <!-- 여섯번째 입력창 끝 -->
	       
	       
	       
	       
	      </div>
	      <!-- 입력창 반복되는 div -->
	
	      <div class="col-md-4" style="border: 0px solid blue;">
	         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
	      </div>
	
	   </div>
	</div>
	
</form>
