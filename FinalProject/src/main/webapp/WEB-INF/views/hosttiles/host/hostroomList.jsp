<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hostheader.css">

<style type="text/css">

.img-thumbnail{
	border: none;
	padding: 0;
}

.panel-heading{
	background-color: #fff
}

.panel-heading:hover{
	background-color: gray;
	cursor: pointer;
}
.a-btn:hover{
	cursor: pointer;
}
.category{
	font-weight: bold;
}
.tab:hover{
	cursor: pointer;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".container1").show();
		$("#reservation").removeClass("category");
		$("#roomPage").removeClass("category");
		
		$("#roomList").click(function(){
			$("#roomList").addClass("category");
			$("#reservation").removeClass("category");
			$("#roomPage").removeClass("category");
			
			$(".container1").show();
			$(".container2").hide();
			$(".container3").hide();
		});
		
		$("#reservation").click(function(){
			$("#roomList").removeClass("category");
			$("#reservation").addClass("category");
			
			$(".container1").hide();
			$(".container2").show();
			$(".container3").hide();
		});
		
		
	});

	function goRoomEdit(roomcode){
		location.href="hostRoomEdit.air?roomcode="+roomcode;
	}
</script>

   <div class="container">
       <div class="panel panel-default">
            <div class="panel-body">
            	<div class="col-md-1"><img alt="" src="<%=request.getContextPath()%>/resources/images/home.png"></div>
            	<div class="col-md-11">게스트가 예약을 취소할 경우에도 수입을 올리세요 환불 불가 조건으로 10% 할인된 요금에 예약할 수 있는 옵션을 제공해보세요. 숙소의 경쟁력을 한층 높일 수 있으며 예약이 취소되어도 수입이 보장됩니다.
               <a>자세히 알아보기.</a></div>
       		</div>
   		</div>
   </div>
   <div class="row">
      <div class="col-md-1" style="margin-left: 20%;">
         <div id="roomList" class="tab category">숙소 목록</div><br>
         <div id="reservation" class="tab category">예약 필수조건</div><br>
         <div id="roomPage" class="tab category">숙소 페이지</div><br>
      </div>
      
      <div class="col-md-6 container1" style="padding-left: 10%;">
          <div class="panel panel-default">
               <div class="panel-body">
               <img alt="" src="<%=request.getContextPath()%>/resources/images/light.png">
               	원하시는 대금 수령 방법을 알려주세요. <a>대금 수령 방법을 설정하세요.</a></div>
          </div>
		<c:if test="${roomList != null }">
			<c:forEach  var="room" items="${roomList }">
				<div class="col-md-12">
					<c:if test="${room.roomstatus == 1 }">
						<h2>운영 중</h2>
					</c:if>

					<c:if test="${room.roomstatus == 0 }">
						<h2>운영 중지</h2>
					</c:if>
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row" onclick="goRoomEdit('${room.roomcode}')">
								<div class="col-md-8">
									<span style="font-size: 15pt;">${room.roomName }</span> <br /> <br /> <br />
									<br /> <span style="font-size: 9pt;">최종업데이트 날짜:</span>
								</div>
								<div class="col-md-4 ">
									<img class="img-thumbnail" alt="" src="${room.roomMainImg }" >
								</div>
							</div>
						</div>
						<c:if test="${room.roomstatus == 0 }">
							<div class="panel-body">
								<img alt=""src="<%=request.getContextPath()%>/resources/images/back (1).png">
								<span><span style="font-weight: bold;">숙소 재설정</span><br />
									현재 휴식모드 입니다. 숙소를 '운영 재개'로 설정하시면 검색 결과에 다시 표시됩니다.</span>
							</div>
						</c:if>
						<div class="panel-footer" style="background-color: white;">
							<a class="a-btn" onclick="goRoomEdit('${room.roomcode}');">수정하기</a>&nbsp;&nbsp;
							<a class="a-btn">미리보기</a> &nbsp;&nbsp;
							<a class="a-btn">달력</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
      </div>
      
      <div class="col-md-6 container2" style="padding-left: 10%;">
      	
      </div>
   </div>
