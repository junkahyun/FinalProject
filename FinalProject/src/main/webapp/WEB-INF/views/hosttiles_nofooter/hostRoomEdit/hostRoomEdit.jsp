<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
hr{width: 85%; 
}

p{font-size: 12pt; 
}

body{color: #484848;
}

a{font-weight: bold; color: #008489; font-size: 13pt; 
}

h4,h3{font-weight: bold; margin-bottom: 5%; margin-top: 5%; 
}

div{border: /* 1px solid gray;  */
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

/* Create an active/current tablink class */
/* .tab button.active {
  border-bottom-color: #008489;
} */
.tablinks{border-bottom: 1px solid #008489;
}
/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
/*   border: 1px solid gray; */
  width: 65%;
}
.btn{font-size: 12pt; background-color: white; border: 1px solid #008489;
}
.editbtn{color: #008489; font-weight: bold;
}
.bedAndPeople{font-size: 12pt; margin-bottom: 3%;
}
.changeColor{border: 1px solid #fc642d;
}
.emailSend{outline: none;
}
.error_emailSend{color: #fc642d; font-weight: bold;
}
</style>

<script>

	$(document).ready(function(){
		$(".error_emailSend").hide();
		
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		$(".emailSend").click(function(){
			
			$(this).addClass("changeColor");
			
		});
		
	});

	function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
	}
	
	// 사진 수정
	function goPhotoEdit(roomcode){
		location.href="hrPhotoEdit.air?="+roomcode;
	}
	
	// 제목 수정
	function goTitleEdit(){
		location.href="<%=request.getContextPath()%>/hrTitleEdit.air";
	}
	
	// 침실 수정
	function goBedroomEdit(){
		location.href="<%=request.getContextPath()%>/bedroomEdit.air";
	}
	
	
</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
	<div class="col-md-8">
	<h2 align="left" style="font-weight: bold; margin-left: 1.2%;">${roomvo.roomName }</h2>
	</div>
	<button type="button" class="btn" style="margin-left: 50%;"><span class="editbtn">달력보기</span></button>
	<button type="button" class="btn" style="background-color: #008489;">
	<span style="color: white; font-weight: bold;">숙소미리보기</span>
	</button>
	
	
	
	<!-- 드롭다운 -->
	<div class="dropdown" align="left" style="margin-top: 2%;">
    <span class="dropdown-toggle" data-toggle="dropdown" style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; margin-left: 1.2%;">숙소변경하기
    <span class="caret"></span></span>
	    <ul class="dropdown-menu" style="width: 45%; font-size: 15pt; ">
	      <li style="border-bottom: 1px solid gray; padding: 2%;">
		      <img src="<%=request.getContextPath() %>/resources/images/검색.JPG" style="cursor: pointer; margin-left: 3%;"/>
		      <input type="text" id="search" style="border: 0px; margin-left: 2%; font-size: 12pt;" value="숙소 검색"/>
	      </li>
	      <li style="border-bottom: 1px solid gray; padding: 2%;">
		      <a href="#"><span style="font-weight: bold; font-size: 12pt; ">모든숙소</span></a>

	      </li><!-- 숙소 리스트로 -->
	      <c:forEach var="room" items="${roomList }">
		      <li style=" padding: 2%;">
			      <a href="#"><span style="font-weight: bold; font-size: 12pt; ">${room.roomName }</span><br>
			      <c:if test="${room.roomstatus == 1 }">
			      	<span style="font-size: 11pt;">운영중</span>
			      </c:if>
			      <c:if test="${room.roomstatus == 0 }">
			      	<span style="font-size: 11pt;">운영중지</span>
			      </c:if>
			      <img src="${room.roomMainImg }" style="width: 20%; margin-left:55%; margin-bottom: 5%;"/></a>
		      </li>
	      </c:forEach>
	    </ul>
	</div>
	<!-- 드롭다운 -->
	
	<!-- 탭 메뉴 -->
	<div class="tab" style="margin-top: 4%;  width: 75%;" align="left">
	  <button class="tablinks" onclick="openCity(event, 'detail')" id="defaultOpen">숙소 세부정보</button>
	  <button class="tablinks" onclick="openCity(event, 'detailSetting')">예약설정</button>
	  <button class="tablinks" onclick="openCity(event, 'localRaw')">현지법규</button>
	  <button class="tablinks" onclick="openCity(event, 'co-host')">공동 호스트</button>
	</div>
	
	<!-- 숙소 세부정보 탭 -->
	<div id="detail" class="tabcontent" style=" height: 1650px; ">
	<!-- 숙소 사진변경 -->
		<div class="col-md-12" >
		<div class="col-md-9" align="left" id="detail" class="tabcontent">
			<h4 style="font-weight: bold; margin-bottom: 5%; margin-top: 5%;">사진</h4>
			<img src="${roomvo.roomMainImg }" alt="숙소사진" style="width: 30%; margin-bottom: 6%;"/>
		</div>
		
		<div class="col-md-2" style="margin-top: 3%; ">
	  		<button type="button" class="btn" onclick="goPhotoEdit('${roomvo.roomcode}');"><span class="editbtn">수정</span></button>
	    </div>
	    </div>
		<hr align="left" > 
		<!-- 제목 및 설명 -->
		<div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h4 >제목 및 설명</h4>
				<span style="font-weight: bold; font-size: 11pt;">${roomvo.roomName }</span><br><br>
				<span style=" font-size: 13pt; ">${roomvo.roomInfo }</span><br><br>
				<a href="#">숙소 이름 변경</a><br><br>
				<a href="#">숙소 상세설명</a><br><br>
				<a href="#">기타 메모 추가</a><br><br>
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn" onclick="goTitleEdit();"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	    <hr align="left" > 
	    <!-- 침실과 숙박인원 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h4 >침실과 숙박인원</h4>
				<div class="bedAndPeople" >
					<span style="margin-right: 45%;">최대숙박가능인원: <span class="number">5</span></span>
					<span>침대 수: <span class="number">${roomvo.max_person }</span></span>
				</div>
				<div class="bedAndPeople">
					<span style="margin-right: 55%;">욕실: <span class="number">${roomvo.bathCount }</span></span>
					<span>건물유형: <span class="number">${roomvo.buildType }</span></span>
				</div>
				<div class="bedAndPeople">
					<span style="margin-right: 46%;">침대종류: <span class="number">침대</span></span>
					<span>숙소유형: <span class="number">개인실</span></span>
				</div >
				<div class="bedAndPeople">
					<span style="margin-right: 45%;">침실: <span class="number">8</span></span>
				</div>
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn" onclick="goBedroomEdit()"><span class="editbtn">수정</span></button>
		    </div>
	    </div>   
	    <hr align="left" > 
	    <!-- 편의시설 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h4 >편의시설 및 이용규칙</h4>
				<div class="bedAndPeople" >
					<span style="margin-right: 45%;">숙박가능인원: <span class="number">5</span></span>
					<span>침대 수: <span class="number">5</span></span>
				</div>
				<div class="bedAndPeople">
					<span style="margin-right: 55%;">욕실: <span class="number">1</span></span>
					<span>건물유형: <span class="number">${roomvo.buildType }</span></span>
				</div>
				<div class="bedAndPeople">
					<span style="margin-right: 46%;">침대종류: <span class="number">침대</span></span>
					<span>숙소유형: <span class="number">개인실</span></span>
				</div >
				<div class="bedAndPeople">
					<span style="margin-right: 45%;">침실: <span class="number">8</span></span>
				</div>
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	    <hr align="left" > 
	    
	    <!-- 위치 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 3%;">
				<h4 >위치</h4>
				<div class="bedAndPeople" >
					<span style="font-size: 12pt; ">45 Apgujeong-ro 42-gil 35동, Apgujeong-dong, Gangnam-gu, 
					서울 135-120, 한국</span>
				</div>
				<span style="font-size: 12pt;">예약하지 않은 게스트는 이 숙소가 속한 지역만 볼 수 있습니다.</span>
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	    <hr align="left" > 
	    
	    <!-- 숙소상태 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h4 >숙소상태</h4>
				<div class="bedAndPeople">
					<span style="font-size: 12pt; "><span style="color:#008489; ">● </span>운영중</span>
				</div>
				<span style="font-size: 12pt; font-weight: bold;">숙소를 조회하고 예약할 수 있는 게스트</span><br><br>
				<span style="font-size: 12pt;">에어비앤비 이용자 모두.</span>
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	</div>
	<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
	
	
	<!-- 예약설정 탭-->
	<div id="detailSetting" class="tabcontent" style="height: 1400px; ">
	  <!-- 기본요금 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h3>기본요금</h3>
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 61%;">스마트 요금 </span>
					<span class="number">사용 안 함</span>
				</div>
				<hr align="left" style="width: 90%;">
				
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 65%;">기본요금 </span>
					<span class="number">₩135120</span>
				</div>
				<hr align="left" style="width: 90%;">
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn" onclick="">수정</span></button>
		    </div>
	    </div>
	    
	    <!-- 추가요금 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h3 >추가요금</h3>
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right:74%;">청소비 </span>
					<span class="number">없음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 68%;">성수기 요금 </span>
					<span class="number">없음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 65%;">추가 인원 요금 </span>
					<span class="number">없음</span>
				</div>
				<hr align="left" style="width: 90%;">
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	    
	    <!-- 체크인과 체크아웃 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h3 >체크인과 체크아웃</h3>
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right:52%;">체크인 가능 시간 </span>
					<span class="number">설정되지 않음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 55%;">체크아웃 시간</span>
					<span class="number">설정되지 않음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	    
	    <!-- 숙박인원 -->
	    <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 2%;">
				<h3 >숙박 인원</h3>
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right:55%;">기본 수용 인원 </span>
					<span class="number">설정되지 않음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
				<div class="bedAndPeople" style="margin-top: 8%;">
					<span style="margin-right: 55%;">최대 수용 인원</span>
					<span class="number">설정되지 않음</span>
				</div>
				<hr align="left" style="width: 90%;">
				
			</div>
			
			<div class="col-md-2" style="margin-top: 3%; ">
		  		<button type="button" class="btn"><span class="editbtn">수정</span></button>
		    </div>
	    </div>
	</div>
	<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- 현지법규 탭-->
	<div id="localRaw" class="tabcontent" style=" height: 900px; ">
		<div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" >
			  <h3>현지법규<img src="<%=request.getContextPath() %>/resources/images/아이콘3.JPG" /></h3>
			  <p>에어비앤비에 숙소를 등록하기 전에 숙소 관할 지역의 법규를 잘 검토해주세요.</p>
		      <p>대부분의 도시에는 주거공유 관련 규정이 있으며, 구역 설정, 건설, 인허가 또는 조세 관련 법령과 조례가 있습니다. 
		      	대부분의 도시에서 숙소를 에어비앤비에 등록하거나 호스팅을 시작하기 전에 등록, 
		      	허가 또는 면허를 취득해야 하며, 호스트가 특정 세금을 수금하여 납부해야 하는 경우도 있습니다. 
		      	일부 도시에서는 단기 임대를 완전히 금지하기도 합니다.</p>
		      <p>숙소를 등록 또는 예약하는 것은 전적으로 회원님의 결정사항이므로 에어비앤비에 숙소를 등록하기 전에 적용되는 법을 잘 숙지하셔야 합니다.</p>
		      <p>에어비앤비 서비스 약관에 동의하고 숙소를 등록하는 것은 회원님의 거주 지역의 법과 규정을 준수하겠다는 것을 의미합니다.</p>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- 공동호스트 탭-->
	<div id="co-host" class="tabcontent" style="height: 900px; ">
	  <div class="col-md-12" >
			<div class="col-md-9" align="left" id="detail" class="tabcontent" style="margin-bottom: 7%;">
			  <h3 style="margin-top: 10%;">호스팅에 도움이 필요하신가요?</h3>
			  <p>공동 호스트의 도움을 받아 회원님의 공간을 숙소로 운영할 수 있습니다. 또한 공동 호스트는 본인의 계정을 사용해 메시지를 확인하고 응답하므로, 
			         회원님과 공동 호스트 모두 수월하게 호스팅을 제공할 수 있습니다.</p>
			</div>
			<hr align="left">
			<div class="col-md-6">
				<h4>친구와 함께 호스팅 하기</h4>
				<span style="font-size: 12pt;">신뢰할수 있는 지인을 공동호스트로 초대하여 도움을 받으세요.</span><br><br>
				<button type="button" class="btn invitemodal" data-toggle="modal" data-target="#myModal" style="background-color: #008489; padding: 3%;">
					<span style="color: white; font-weight: bold;">친구초대하기</span>
				</button>
			</div>
			
		
			<div class="col-md-6"><img src="<%=request.getContextPath() %>/resources/images/친구와함께.JPG" /></div>
		</div>
	</div>
	
</div>

<!-- 친구초대하기 modal -->
<div class="container" >
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="margin-top: 20%;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
         	<span style="font-size: 18pt; font-weight: bold;">친구 초대하기</span>
        </div>
        <div class="modal-body" >
          <strong style="font-size: 12pt; ">이메일 주소</strong><br>
          <input class="emailSend" type="email" style="width: 100%; height:48px; margin-top: 3%;"/><br>
          <span class="error_emailSend">정확한 이메일 주소를 입력해주세요.</span><br>
          <label for="emailCheckbox">
	          <input type="checkbox" id="emailCheckbox"/>&nbsp;&nbsp;
	          <span style="font-size: 12pt;"><strong style="color: #008489;">공동 호스트 서비스</strong>약관에 동의합니다.</span>
          </label><br>
          <p style="font-size: 10pt;">공동 호스트를 추가하시면 공동 호스트는 회원님을 대신해서 호스트 역할을 합니다. 하지만 회원님 숙소의 호스팅을 위해 공동 호스트가 하는 행위에 대한 책임은 회원님께 있습니다.
          </p><br>
          <button type="button" class="btn invitebtn" style="background-color: #008489; padding: 2%; width: 10%;"><span style="color: white; font-weight: bold;">초대</span></button>
        </div>
      </div>
      
    </div>
  </div>
</div>
<!-- 친구초대하기 modal -->


