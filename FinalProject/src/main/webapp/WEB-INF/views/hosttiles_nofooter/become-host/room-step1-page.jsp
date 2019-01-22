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
             
    #cklist{font-size: 16px;
    		color: #5D5D5D;}
	#cklistDetail{font-size: 13px;
	color: #5D5D5D;}

</style>

 

<script type="text/javascript">

   $(document).ready(function(){
	   
	   $("#second").hide();
	   $("#third").hide();
	   $("#fourth").hide();
	   $("#fifth").hide();
	   $("#sixth").hide();

   
	  //첫번째 입력창 스크립트 시작-----------------------------------------------------------------------------------------------------------	  
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
	   $(".bedAdd").click(function() {
		   if(flag == false){
			   var bed = $(".bedAdd").text("완료");   
			   $("#bedoqty").show();
			   flag = true;
		   }
		   else{
			  bed = $(".bedAdd").text("침대 추가하기");
			  $("#bedoqty").hide();
			  flag = false;
		   }
	   });	  
	   
 	   $("#bedroom").change(function(){
 	   		   
		   var addbed = $("#addbed").html();
		   
		   var html = "";
			
		   var bedroom = $("#bedroom").val();
			
			if(bedroom == "1"){
				$("#addarea").empty();
			}
			else{
				for(var i=1; i<=bedroom; i++){
					html += addbed;
				}				
			}
			
			$("#addarea").html(html);
				   
	   }); 
	   
      //두번째 입력창 스크립트 끝 -----------------------------------------------------------------------------------------------------------
      
      //우편번호 입력창 스크립트 시작 ----------------------------------------------------------------------------------------------------------
	  $("#bname").click(function() {
			    new daum.Postcode({
			         oncomplete: function(data) {
			        	// alert(JSON.stringify(data));
			        	 $("#address").val(data.address);
			             $("#postnum").val(data.zonecode);
			             $("#sido").val(data.sido);
			             $("#sigungu").val(data.sigungu);
			             $("#bname").val(data.bname);
			         }
			     }).open();
			   
		});
      //우편번호 입력창 스크립트 끝 -----------------------------------------------------------------------------------------------------------
      

   });// $(document).ready(function()

   // 버튼 함수들
   // first ---------------------------------------------------------
   function back1(){
	    var frm = document.roomtype;
		frm.action = "roomstep1.air";
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
		$("#fourth").show();
		$("#fifth").hide();
	}
	
	
	
	// sixth ---------------------------------------------------------
	function back6(){
	   $("#fifth").show();
	   $("#sixth").hide();
	}
	
	function next6(){
		var frm = document.roomtype; 
		frm.action="roomstep2.air";
		frm.method="GET";
		frm.submit();
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
	   var start = $("#doubleupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#doubleupdown").val(minus);
   }  
   
   //더블침대 증가 버튼
   function doubleplus() {
	   var start = $("#doubleupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#doubleupdown").val(plus);
   }
   
   //퀸침대 감소 버튼
   function queenminus() {
	   var start = $("#queenupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#queenupdown").val(minus);
   }  
   
   //퀸침대 증가 버튼
   function queenplus() {
	   var start = $("#queenupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#queenupdown").val(plus);
   }
   
   //싱글침대 감소 버튼
   function singleminus() {
	   var start = $("#singleupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#singleupdown").val(minus);
   }  
   
   //싱글침대 증가 버튼
   function singleplus() {
	   var start = $("#singleupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#singleupdown").val(plus);
   }
   
   //쇼파베드침대 감소 버튼
   function sofaminus() {
	   var start = $("#sofaupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("침대수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#sofaupdown").val(minus);
   }  
   
   //쇼파베드침대 증가 버튼
   function sofaplus() {
	   var start = $("#sofaupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#sofaupdown").val(plus);
   }
   
   //욕실 감소 버튼
   function bathroomsminus() {
	   var start = $("#bathroomsupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("욕실수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#bathroomsupdown").val(minus);
   }  
   
   //욕실 증가 버튼
   function bathroomsplus() {
	   var start = $("#bathroomsupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#bathroomsupdown").val(plus);
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
		                	<option selected value="0" disabled>하나를 선택해주세요.</option>
		                    <c:forEach items="${buildTypeList}" var="map">
		                   		<option value="${map.BUILDTYPE_IDX}">${map.BUILDTYPE}</option>
		                    </c:forEach>
		                </select>
		
		            </div>
		            <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
		                <div class="selecthead">건물 유형을 선택하세요</div>    
		                <select id="buildType_detail" class="select" name="fk_buildType_detail_idx" style="width: 100%; padding: 9px;" disabled>  
		                  	<option value="0">건물 유형 선택</option>
		                </select> 
		            </div>
		
		            <div id="guestroom" >
		               <div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
		                   <div class="selecthead">게스트가 묵게 될 숙소 유형을 골라주세요.</div>    
		                   <select  class="select" name="fk_roomType_idx" style="width: 100%; padding: 9px;">  
		                      <c:forEach items="${roomtype}" var="map">
								<option value="${map.ROOMTYPE_IDX}">${map.ROOMTYPE_NAME}</option> 
							</c:forEach>
		                   </select>
		               </div> 
		            </div>  		            
		         </div>
		         
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
		         <div class="title">숙소에 몇명이 숙박할 수 있나요?</div>
		         <div class="row" style="padding: 0; margin-bottom: 100px; border: 0px solid green;" >
		         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
		         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">최대 숙박 인원</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="peopleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
		         		</div>
		         		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
		         			<input type="text" id="peopleupdown" name="max_person" value="1" style="border: 0; width: 20px; height: 20px;" readonly>   
		         		</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="peopleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
		         		</div>
		         	</div>
		         	
		            <div class="col-md-10" style="margin-top: 50px; border: 0px solid red;">
		                <div class="selecthead">게스트가 사용할 수 있는 침실은 몇 개인가요?</div>  
		                <div class="col-md-9" style="padding: 0">
		                <select id="bedroom" class="select" name="roomCount" style="width: 100%; padding: 9px;">  
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
				         	<button type="button" class="bedAdd" style="padding-left: 30px; padding-right:30px; height: 48px; background-color: white; float: right; border: 1px solid gray; border-radius: 3px; font-weight: bold; font-size: 1.3em">침대 추가하기</button>
				         </div>
			        </div>
			      <hr/>
		         
		         <div class="col-md-12" id="bedoqty">
			         <div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
			       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">더블</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="doubleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
			       		</div>
			       		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 
							<input type="text" id="doubleupdown" name="doublebed" value="0" style="border: 0; width: 20px; height: 20px;" readonly>   
						</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="doubleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
			       		</div>
			       	</div>
			       	 <div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
			       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">퀸</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="queenminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
			       		</div>
			       		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
							<input type="text" id="queenupdown" name="queenubed" value="0" style="border: 0; width: 20px; height: 20px;" readonly>   
						</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="queenplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
			       		</div>
			       	</div>
			       	<div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
			       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">싱글</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="singleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
			       		</div>
			       		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
							<input type="text" id="singleupdown" name="singlebed" value="0" style="border: 0; width: 20px; height: 20px;" readonly>   
						</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="singleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
			       		</div>
			       	</div>
			       	<div class="col-md-9" style="margin-top: 10px; border: 0px solid blue;">
			       		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">쇼파베드</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="sofaminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
			       		</div>
			       		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
							<input type="text" id="sofaupdown" name="sofabed" value="0" style="border: 0; width: 20px; height: 20px;" readonly>   
						</div>
			       		<div class="col-md-2" style="border: 0px solid green;">
			       		 	<button type="button" onclick="sofaplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
			       		</div>
			       	</div>
		       	</div>
		       	<hr/>
		       	</div>
		       	<div class="row" id="addarea"></div>
		       	
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
	        
	        <!-- 세번째 입력창 시작 -->
			<div class="row" id="third">
		         <div class="title">욕실 수</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
		         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">욕실</div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="bathroomsminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
		         		</div>
		         		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
                        	<input type="text" id="bathroomsupdown" name="bathCount" value="0" style="border: 0; width: 20px; height: 20px;" readonly>   
                        </div>
		         		<div class="col-md-2" style="border: 0px solid green;">
		         		 	<button type="button" onclick="bathroomsplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
		         		</div>
		         	</div>                    			            
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
	        <!-- 세번째 입력창 끝 -->
	        
	        <!-- 네번째 입력창 끝 -->
	        <div class="row" id="fourth">
		         <div class="title">어떤 편의시설을 제공하시나요?</div>
		         <div class="row" style="padding: 0; border: 1px solid green;" >
		            <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 1px solid blue;">
		            
						<c:forEach items="${options}" var="map" varStatus="status"> 
						 	<div class="row" style="border: 1px solid red; padding-left: 2px;"> 
						 	  
		                        <div class="col-md-1" style="border: 1px solid black; ">
		                              <input type="checkbox" value="${map.OPTION_IDX}" name="optionchk" id="option"/>
		                        </div>
		                        <div class="col-md-11" style="border: 1px solid blue;" >		                        	
		                              <label for="option">
		                              	<span id="cklist">${map.OPTIONNAME }</span><br/>
		                              	<input type="text" value="${map.OPTION_IDX }"/>		                              
		                              </label>		                            
		                        </div>
		                        
		                 	</div>
		                 </c:forEach>	
		                 	                 
		            </div>
		  
		         </div>
		
		         <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
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
	        <div class="row" id="fifth">
		         <div class="col-md-10 title">숙소의 위치를 알려주세요.</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		         
		         	<div class="col-md-5" style="margin-top: 50px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">시/도</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="sido" name="roomSido" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 서울특별시" readonly="readonly"/>
						</div>
		            </div>
		            
		            <div class="col-md-5" style="margin-top: 50px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">시/군</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0">
							<input type="text" id="sigungu" name="roomSigungu" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 강남구" readonly="readonly"/>
						</div>
		            </div>
		         
		            <div class="col-md-10" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">동  / 도로명</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="bname" name="roomBname" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="이곳을 클릭해주세요" readonly="readonly"/>
							<input type="text" id="address" name="roomAddr" style="margin-top: 10px; margin-bottom : 0; margin-left:0; margin-right:0; padding: 25px;" class="input-data form-control" readonly="readonly"/>
						</div>
		            </div>
		            
		            <div class="col-md-10" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">상세주소(필수)</div>  
						<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="addrDetail" name="roomdetailAddr" style="margin: 0; padding: 25px" class="input-data form-control" placeholder="예) 35동 3층 301호"/>
						</div>
		            </div>
		            
		            <div class="col-md-11" style="margin-top: 25px; border: 0px solid red;">
		                <div class="col-md-12" style="font-size: 20px;">우편번호</div>  
						<div class="col-md-5" style="border: 0px solid blue; padding-right: 0;">
							<input type="text" id="postnum" name="roomPost" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 12345" readonly="readonly"/>
						</div>
		            </div> 
		            
		         </div>
		
		         <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
			            <button type="button" onclick="back5();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next5();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		        </div>
	        </div> 
	        <!-- 다섯번째 입력창 끝 -->
	        
	        <!-- 여섯번째 입력창 끝 -->
	        <div class="row" id="sixth">
		         <div class="title">핀이 놓인 위치가 정확한가요?</div>
		         <div class="row" style="padding: 0; border: 0px solid green;" >
		            <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 0px solid red;">
						숙소의 정확한 위치는 예약이 확정된 게스트만 볼 수 있습니다.
						<input type="text" id="ib" name="longitude"/><!-- 경도 -->
		            	<input type="text" id="jb" name="latitude"/><!-- 위도 -->
		            </div>
		            <div class="col-md-8" id="addrtext" style="margin-top: 25px; margin-bottom: 10px;"></div>
		            <div class="col-md-12" style="border: 0px solid red; ">
		            	<div id="map" style="width:100%;height:400px;"></div>
		            </div>		  
		         </div>
				
				<div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
		         	 <hr/>
			         <div class="col-md-3" style="padding: 0;">
			            <button type="button" onclick="back6();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
			         </div>
			         <div class="col-md-6" style="border: 0px solid red;"></div>
			         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
			            <button type="button" onclick="next6();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>		          
			         </div>
		        </div>
		    </div>
	        <!-- 여섯번째 입력창 끝 -->

	      </div> <!-- 입력창 반복되는 div -->
	      
	
	      <div class="col-md-4" style="border: 0px solid blue;">
	         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
	      </div>
	
	   </div>
	</div>
</form>

<script> 

function next5(){
	 
	 var address = $("#address").val();   	 
	     var form_data = {"address":address};

	 $.ajax({
		 url:"mapJSON.air",
		 type:"GET",
		 dataType:"JSON",
		 data:form_data,
		 success:function(json) {
			 
			$("#fifth").hide();
		    $("#sixth").show();
		    
		    $("#addrtext").html(json);
			 
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(0,0), // 지도의 중심좌표33.450701, 126.570667
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(json, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			       /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${address}'+'</div>'
			        });
			        infowindow.open(map, marker); */
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			        
			        var location = map.getCenter(coords);
			        $("#ib").val(location.ib); //경도
			        $("#jb").val(location.jb); //위도

			    } 
			});   			 		 	
		 },
		 error: function(request, status, error){
		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 }
	 });// end of $.ajax({ --- 	
	 
}
	
</script>

