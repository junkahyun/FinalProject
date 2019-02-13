<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<style>
.line{width: 45%;

}
.line2{
	width: 78%;
}
.homeimg{
	width: 100%;
}
p{font-size: 12pt; 
}

body{color: #484848;
}

a{font-weight: bold; color: #008489; font-size: 10pt; 
}

h4,h3{font-weight: bold; margin-top: 2%; 
}

div{border:  0px solid gray;  
}

/* Style the tab */
.tab {
  overflow: hidden;
  border-bottom: 1px solid #ccc;
  font-weight: bold;
  display: inline-block;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  
}
.number{font-weight: bold; font-size: 12pt;
}

/* Change background color of buttons on hover */

.tab button:focus{
   color: #008489;
   font-weight: bold;
   display: inherit;
   text-decoration: underline;
}

.tablinks{border-bottom: 1px solid #008489;
}
/* Style the tab content */
.tabcontent {
  width: 70%;
}
.btn{font-size: 12pt; background-color: white; border: 1px solid #008489;
}
.editbtn{color: #008489; font-weight: bold;
}
.bedAndPeople{font-size: 12pt; margin-bottom: 3%;
}

.fa-angle-left:focus{text-decoration: underline;
}

.gohostroomEdit{
	font-size: 13pt; 
	color: #008489; 
	cursor: pointer; 
	font-weight: bold;
}

  .select{font-size: var(--font-form-element-font-size, 16px);
          line-height: var(--font-form-element-line-height, 24px);
          letter-spacing: var(--font-form-element-letter-spacing, normal);
          font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif);
          text-transform: var(--font-form-element-text-transform, undefined);
          color: #484848;
          padding-top: var(--spacing-form-element-vertical, 10px);
          padding-bottom: var(--spacing-form-element-vertical, 10px);
          font-weight: var(--font-light-font-weight, normal);
          background-color: transparent;
          border-radius: 3px;}  
</style>

<script>

$(document).ready(function(){
	
	$("#bedType").hide();
    // 건물타입 (첫번째)셀랙박스 
    $("#buildType").change(function(){ 

  	 // 건물유형선택 셀랙박스 선택가능하게
  	 $("#buildType_detail").attr("disabled", false);

  	  var buildType = $("#buildType").val();   	 
  	  var form_data = {"buildType":buildType};
  	  
		  $.ajax({
	 		 url:"getRoomtypeList.air",
	 		 type:"GET",
	 		 dataType:"JSON",
	 		 data:form_data,
	 		 success:function(json){
	 			 
	 		 var result = "<option selected value='0' disabled>건물 유형 선택</option>";
	 		 
	 		 $.each(json, function(entryIndex, entry){
	 			
	 			 result += "<option value="+entry.buildtype_detail_idx+">"+entry.buildtype_detail_name+"</option>";
	 		 });
	 		 
	 		 $("#buildType_detail").html(result); 

	 		 },
	 		 error: function(request, status, error){
	 		 	//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		 }
	 	 });// end of $.ajax({ --- 	
			 
    });// $("#buildType").change(function()
    
/* 	$("#bedroom").change(function(){
		var bedroom = {bedroom:$("#bedroom").val()};
		console.log(bedroom);
		$.ajax({
			url:"changebedroomcount.air",
			type:"GET",
			data:bedroom,
			dataType:"JSON",
			success:function(json){
				
				$(".bedroom").empty();
				var html ="";
	 			for(var i=0; i<parseInt(json.bedroom); i++){
	 				html += 
	 				'<div class="row bedroom" style="margin-top: 1%;">'+
	 					'<div class="col-md-3" style="border: 0px solid blue">'+
	 						'<div class="bedroomNum" style="font-size: 19px;">'+(i+1)+'번 침실</div>'+
	 						'<div class="bedCountinFor" style="font-size: 19px; color: #767676;">침대 '+(i+1)+'개</div>'+
	 					'</div>'+
	 					'<div class="col-md-3" style="border: 0px solid red; height: 56px; padding-right: 0;">'+
	 						'<input type="button" class="bedAdd" value="침대 추가하기" onclick="bedAdd('+(i+1)+');" style="padding-left: 30px; padding-right:30px; height: 48px; background-color: white; float: right; border: 1px solid gray; border-radius: 3px; font-weight: bold; font-size: 1.3em"/>'+
	 					'</div>'+
	 					'<div id="bedroomCount'+(i+1)+'" class="col-md-12 bedoqty"></div>'+
	 				'</div>';
	 				$(".bedroom").append().html(html);
	 			}
		 	},
		 	error: function(request, status, error){
	 		 	//alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		}
		});
		
	}); */
			
    $("#cancelbtn").click(function(){
    	location.href = "bedroomEdit.air?roomcode="+${roomvo.roomcode};
    });
    
   
});

function svaeBedRoomAndPerson(){
	
	if(parseInt($("#peopleupdown").val()) < parseInt($("#basic_person").val())){
		alert("최대숙박 인원은 기본 수용 인원보다 작을 수 없습니다.");
		location.reload();
		return;
	}
	var form_data = {"fk_buildType_detail_idx":$("#buildType_detail").val()
					, "fk_roomType_idx":$("#fk_roomType_idx").val()
					, "basic_person":$("#basic_person").val()
					, "max_person":$("#peopleupdown").val()
					, "roomCount":$("#roomupdown").val()
					, "bathCount":$("#bathroomsupdown").val()
					, "roomcode":$("#roomcode").val()};

	console.log(form_data);
	$.ajax({
		url:"bedAndPersonEdit.air",
		data:form_data,
		type:"POST",
		dataType:"JSON",
		success:function(json){
			
			if(json.n == "1"){
				alert("저장완료");
				location.href = "bedroomEdit.air?roomcode="+json.roomcode;
			}
	 	},
	 	error: function(request, status, error){
 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
 		}
	});
}
    
function goRoomEdit(roomcode){
	location.href="hostRoomEdit.air?roomcode="+roomcode;
}

//기본수용인원 감소 버튼
function basicminus() {
	   var start = $("#basic_person").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("인원수는 1명 이상이여야 합니다.");
		   minus = 1;
	   }
	   $("#basic_person").val(minus);
}  

//기본수용인원 증가 버튼
function basicplus() {
	   var start = $("#basic_person").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#basic_person").val(plus);
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
	   var basic_person = $("#basic_person").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#peopleupdown").val(plus);
}

//욕실 감소 버튼
function bathroomsminus() {
	   var start = $("#bathroomsupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("욕실수는 1개 이상이여야 합니다.");
		   minus = 1;
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

//방개수 증가
function roomminus() {
	   var start = $("#roomupdown").val();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<1){
		   alert("방개수는 1개 이상이여야 합니다.");
		   minus = 1;
	   }
	   $("#roomupdown").val(minus);
}  

//방개수 감소
function roomplus() {
	   var start = $("#roomupdown").val();
	   var plus = parseInt(start);
	   plus++;
	   $("#roomupdown").val(plus);
}

/* //침대 추가 버튼
function bedAdd(bedroomCount){
	$("#bedroomCount"+bedroomCount).html($("#bedType").show());
} */
</script>

<form id="bedAndPersonEdit" name="bedAndPersonEdit">
<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%; margin-bottom: 5%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a class="gohostroomEdit" onclick="goRoomEdit('${roomvo.roomcode}')">수정으로 돌아가기</a>
	<input id="roomcode" name="roomcode" type="hidden" value="${roomvo.roomcode }">
	<h3 align="left" style="font-weight: bold;">숙소</h3>
	<div class="row" style="padding: 0; border: 0px solid green;" >
		<div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
			<p>게스트가 머물게 될 공간에 대해 자세히 설명해 주세요.</p>
			<p>회원님의 숙소에 가장 적합한 유형을 선택하세요.</p>
		    <div class="selecthead">우선 범위를 좁혀볼까요?</div>    
		    <select id="buildType" class="select error1" name="buildType" style="width: 35%; padding: 9px;" >  
		    	<option selected value="${roomvo.buildtype_idx}" disabled>${roomvo.buildType }</option>
		        <c:forEach items="${buildTypeList}" var="map">
		       		<option value="${map.buildtype_idx}">${map.buildtype}</option>
		        </c:forEach>  
			</select>
			<!-- <div class="error1_text">옵션을 선택하세요.</div> -->
		</div>
		<div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
	    	<div class="selecthead">건물 유형을 선택하세요</div>    
	    	<select id="buildType_detail" class="select error2" name="fk_buildType_detail_idx" style="width: 35%; padding: 9px;" disabled>  
	      	<option selected value="${roomvo.fk_buildType_detail_idx }">${roomvo.buildType_detail_name }</option>
	    	</select> 
	    <!-- <div class="error2_text">옵션을 선택하세요.</div> -->
	</div>
	
		<div id="guestroom" >	
		   <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
		       	<div class="selecthead">게스트가 묵게 될 숙소 유형을 골라주세요.</div>    
		       	<select id="fk_roomType_idx" class="select" name="fk_roomType_idx" style="width: 35%; padding: 9px;">
		       		<option selected value="${roomvo.fk_roomType_idx }">${roomvo.roomType_name }</option>
		        	<c:forEach items="${roomtype}" var="map">
						<option value="${map.roomtype_idx}">${map.roomtype_name}</option> 
					</c:forEach>
				</select>
			</div> 
		</div>  		            
	</div>

	<br>
	
	<div class="row" style="padding: 0; margin-bottom: 2%; border: 0px solid green;" >
		<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
	   		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">기본 수용 인원</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="basicminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	   		</div>
	   		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
	   			<input type="text" id="basic_person" name="basic_person" value="${roomvo.basic_person }" style="border: 0; width: 20px; height: 20px;" readonly>   
	   		</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="basicplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	   		</div>
		</div>
		<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
	   		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">최대 숙박 인원</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="peopleminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	   		</div>
	   		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
	   			<input type="text" id="peopleupdown" name="max_person" value="${roomvo.max_person }" style="border: 0; width: 20px; height: 20px;" readonly>   
	   		</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="peopleplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	   		</div>
		</div>
		<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
	   		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">방 개수</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="roomminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	   		</div>
	   		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
	   			<input type="text" id="roomupdown" name="roomCount" value="${roomvo.roomCount }" style="border: 0; width: 20px; height: 20px;" readonly>   
	   		</div>
	   		<div class="col-md-1" style="border: 0px solid green;">
	   		 	<button type="button" onclick="roomplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	   		</div>
		</div>
		<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
    		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">욕실</div>
    		<div class="col-md-1" style="border: 0px solid green;">
    		 	<button type="button" onclick="bathroomsminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
    		</div>
    		<div class="col-md-1" style="font-weight: bolder; font-size: 18px; margin-top: 6px;">
                 	<input type="text" id="bathroomsupdown" name="bathCount" value="1" style="border: 0; width: 20px; height: 20px;" readonly>   
            </div>
    		<div class="col-md-1" style="border: 0px solid green;">
    		 	<button type="button" onclick="bathroomsplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
    		</div>
    	</div>
	</div>

	<hr class="line" align="left">
	<input id="savebtn" type="button" class="btn editbtn" value="저장하기" onclick="svaeBedRoomAndPerson();"/>
	<button id="cancelbtn" class="btn" style="background-color:  #008489;"><span style="color: white; font-weight: bold;">취소하기</span></button>
</div>
</form>
