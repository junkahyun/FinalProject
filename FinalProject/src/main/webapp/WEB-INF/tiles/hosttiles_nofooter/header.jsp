<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<script>
	function goLogout(){
		$.ajax({
			url: "logout.air",
			type: "POST",
			dataType:"json",
			success:function(json){
				alert(json.msg);
				location.reload();
			},
			error: function(request, status, error){
	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		}
		});
	}
	function goRegistHost(){
		location.href="roomstap1.air";
	}
	function goMypage(){
		location.href="myEdit.air";
	}
	function goHostMain(){
		location.href="hostMain.air";
	}
	
	function hostroomList() {
		location.href="hostroomList.air";
	}
	
	function hostroomMark() {
		location.href="hostroomMark.air";
	}
	function reservationList() {
		location.href="reservationList.air";
	}
	function hostMain() {
		location.href="hostMain.air";
	}

</script>
<div id="header">
	<div class="row height_maxPer">
		<div id="headerlogo">
			<img src="<%=request.getContextPath() %>/resources/images/호스트아이콘.JPG " onclick="hostMain()" style="padding:0;" />
		</div>
		<div class="hostheadermenus" style="margin-left: 1%;">
			<div class="headermenu" onClick="hostMain()">홈</div>
			<div class="headermenu" onClick="">메시지</div>
			<div class="headermenu" onClick="reservationList()">예약현황</div>
			<div class="headermenu" onClick="hostroomList()">숙소</div>
			<div class="headermenu" onClick="hostroomMark()">성취도</div>
		</div>
		<div class="row" style="padding-right:2.5%;">
			<div class="headermenu dropdown resize2" onClick="" style="padding:0;float:right;padding-top:1%;">
            	<div class="dropdown-toggle" data-toggle="dropdown" style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
            		<img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
            	</div>
            	<ul class="dropdown-menu dropdown-menu-right" style="padding:0;text-align:right;text-weight:500;">
			      <li style="padding:0; width:50px; margin:0 auto;margin-top:5%;padding-bottom:2%; font-size:12pt;">${loginuser.userid }</li>
			      <li class="profileDrop" style="border-top:1px solid lightgray;" onClick="goLogout();">로그아웃</li>
			      <li class="profileDrop" onClick="goMypage();">마이페이지</li>
			    </ul>
            </div>
			<div class="headermenuButton" onClick="" style="float:right; padding:1% 1.5%;">
				<button class="btn" style="background-color: #008489;">
					<span style="color: white; font-weight: bold;">숙소등록하기</span>
				</button>
			</div>
		</div>
	</div>
</div>

