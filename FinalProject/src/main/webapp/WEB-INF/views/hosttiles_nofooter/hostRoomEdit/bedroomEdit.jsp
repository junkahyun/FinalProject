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
	
});

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
</script>


<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%; margin-bottom: 5%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a class="gohostroomEdit" onclick="goRoomEdit('${roomvo.roomcode}')">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">숙소</h3>
	<div class="row" style="padding: 0; border: 0px solid green;" >
		<div class="col-md-9" style="margin-top: 50px; border: 0px solid red;">
			<p>게스트가 머물게 될 공간에 대해 자세히 설명해 주세요.</p>
			<p>회원님의 숙소에 가장 적합한 유형을 선택하세요.</p>
		    <div class="selecthead">우선 범위를 좁혀볼까요?</div>    
		    <select id="buildType" class="select error1" name="buildType" style="width: 35%; padding: 9px;" >  
		    	<option selected value="${roomvo.buildType}" disabled>${roomvo.buildType }</option>
		        <c:forEach items="${buildTypeList}" var="map">
		       		<option value="${map.buildtype_idx}">${map.buildtype}</option>
		        </c:forEach>  
			</select>
			<!-- <div class="error1_text">옵션을 선택하세요.</div> -->
		</div>
		<div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
	    	<div class="selecthead">건물 유형을 선택하세요</div>    
	    	<select id="buildType_detail" class="select error2" name="fk_buildType_detail_idx" style="width: 35%; padding: 9px;" disabled>  
	      	<option value="0">${roomvo.buildType_detail_name }</option>
	    	</select> 
	    <!-- <div class="error2_text">옵션을 선택하세요.</div> -->
	</div>
	
		<div id="guestroom" >	
		   <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
		       	<div class="selecthead">게스트가 묵게 될 숙소 유형을 골라주세요.</div>    
		       	<select  class="select" name="fk_roomType_idx" style="width: 35%; padding: 9px;">
		       		<option selected value="${roomvo.roomType_name }" disabled>${roomvo.roomType_name }</option>
		        	<c:forEach items="${roomtype}" var="map">
						<option value="${map.roomtype_idx}">${map.roomtype_name}</option> 
					</c:forEach>
				</select>
			</div> 
		</div>  		            
	</div>

	<br>
	
	<div class="row" style="padding: 0; margin-bottom: 100px; border: 0px solid green;" >
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
	</div>

	<hr class="line" align="left">
	<div class="row">
	<div class="col-md-10" style="margin-top: 50px; border: 0px solid red;">
        <div class="selecthead">게스트가 사용할 수 있는 침실은 몇 개인가요?</div>  
        <div class="col-md-9" style="padding: 0">
        <select id="bedroom" class="select" name="roomCount" style="width: 35%; padding: 9px;">  
        	<option value="${roomvo.bedCount }">${roomvo.bedCount }</option>	
           	<c:forEach var="i" begin="1" end="30" step="1">
           	<option value="${i }">침실 ${i }개</option>
           	</c:forEach>
		</select>
        </div>  
    </div>
	</div>
	<hr class="line" align="left">
    <div class="row" style="padding: 0; border: 0px solid green;" >
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
	<button type="button" class="btn"><span class="editbtn">저장하기</span></button>
	<button class="btn" style="background-color:  #008489;"><span style="color: white; font-weight: bold;">취소하기</span></button>
</div>

