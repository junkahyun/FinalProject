<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

h2,h3{font-weight: bold;
  }
tr,td{border: 1px solid gray; font-size: 12pt;
}

h3{font-size: 14pt; color: #008489; font-weight: bold; 
}

.btn{font-size: 14pt;
}
.myinfomation{font-size: 14pt; color: #008489; font-weight: bold; 
    }
.reservationInfo{font-size: 12pt; border: 0px; margin-bottom: 15%; 
}
  
input{outline: none;
}

#QuestionToHost:hover{cursor: pointer;
}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#binkan").hide();
		
		$("#btnsubmit").click(function(){
			location.href = "<%=ctxPath%>/index.air"; 
		});//
		
		//취소 사유 선택
		$("#cancelReason").bind("change",function(){
			var option = $(this).val();
			if(option == 1 || option == 3 ||option == 4){
				$("#textToHost").focus();
				$("#h4text").show();
				$("#textToHost").show();
			}
			else{
				$("#textToHost").hide();
				$("#h4text").hide();
			}
		});
		
	});//end of $(document).ready------------

	
	
</script>

</head>
<body>
<!-- Channel Plugin Scripts -->
<script>
  ;window.channelPluginSettings = {
    "pluginKey": "6f3362e0-0256-424f-9493-b4dc969bc2d0" //please fill with your plugin key
  };
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
</script>
<!-- End Channel Plugin -->
<div class="container-fluid">
  <div class="row" style="margin-top: 0.6%; ">
  		<div class="col-sm-1" style="margin-top: 0.7%; margin-left: 1%;">
    	<img src="<%=ctxPath %>/resources/images/airLogo.png" style="width: 30px; cursor: pointer;" onclick="javascript:location.href='<%=request.getContextPath() %>/index.air'"/>
    	</div>
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 >  2. 게스트 정보 입력 >  3. 확인 및 결제  >  4. 예약완료 </span></div>
  </div>
</div>

<div class="container-fluid" style="margin-top: 3%; width: 55%;">
	<div class="col-md-12" style="margin-top: 3%; margin-bottom: 3%;">
		<h2 >예약이 완료되었습니다!</h2>
		<h3 >${reName}님의 이메일로 예약내역이 전송되었습니다!</h3>
		<br>
		<!-- 주문자 정보  -->
		
		<h3 >예약코드 : ${revcode}<span style="padding-left: 50%; color: tomato;" id="QuestionToHost"><!-- 호스트와 1:1채팅하기 --></span></h3>
		<hr style="border: 0.5px solid gray; margin-bottom: 3%;">
		<div class="col-md-3" >
			<span class="myinfomation" >이름</span><br>
			<input class="reservationInfo" type="text" value="${reName}" readonly="readonly"/><br>
			
			<span class="myinfomation">숙소주소</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomName}"  readonly="readonly"/><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomSido}&nbsp;${(sessionScope.oneRoom).roomBname}"  readonly="readonly"/><br><br>
			
			<span class="myinfomation">총 인원</span><br>
			<input class="plusfee" type="text" value="게스트 : ${guestcount}명" style="border: 0px; font-size: 12pt;" readonly="readonly"/><br>
			<input class="plusfee" type="text" value="유아 : ${babycount}명" style="border: 0px; font-size: 12pt;" readonly="readonly"/>
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">여행지</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomSigungu}" readonly="readonly"/><br>
			
			<span class="myinfomation">숙박시설 호스트</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).fk_userid}님"  readonly="readonly"/><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomTel}"  readonly="readonly"/><br>
		</div>
		
		<div class="col-md-3">
			<span class="myinfomation">기간</span><br>
			<input class="reservationInfo" type="text"  readonly="readonly" value="${day_between}박"/><br>
			
			<span class="myinfomation">체크인</span><br>
			<input class="reservationInfo" type="text" value="${checkin}" readonly="readonly"/><br>
			
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">숙소종류</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomType_name}" readonly="readonly"/><br>
			
			<span class="myinfomation">체크아웃</span><br>
			<input class="reservationInfo" type="text" value="${checkout}" readonly="readonly"/><br>
			
		</div>
		
	</div>
	
	
	<div class="col-md-12" style="margin-bottom: 5%;">
		<hr style="border: 0.5px solid gray; margin-bottom: 3%;">
		<h2 style="margin-bottom: 3%;">숙박대금</h2>
		<table class="table table-bordere" style="border: 1px solid gray; width: 80%;">
			<%-- <c:forEach begin="1" end="3"> --%>
				<tr style="border: 1px solid gray; ">
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">₩1박요금×<span id="day_between1">${day_between}</span></td>
					<td >₩${price}</td>
				</tr>
				
				<tr>
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">청소비</td>
					<td >₩<fmt:formatNumber value="${oneRoom.cleanPay}" pattern="#,###"/></td>
				</tr>
				
				<tr >
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">성수기 추가 요금</td>
					<td >₩<fmt:formatNumber value="${(oneRoom.peakper)}" pattern="#,###"/></td>
				</tr>
				
				<c:if test="${disCountMoney != 0 }">
				<tr>
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">할인 요금</td>
					<td >₩<fmt:formatNumber value="${disCountMoney}" pattern="#,###"/></td>
				</tr>
				</c:if>
				
				<tr >
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">추가 인원 요금</td>
					<td >₩<fmt:formatNumber value="${oneRoom.person_addpay}" pattern="#,###"/>(해당하는 경우만)</td>
				</tr>
				
				<tr >
					<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">합계</td>
					<td >₩<fmt:formatNumber value="${totalprice}" pattern="#,###"/></td>
				</tr>
			<%-- </c:forEach> --%>		
		</table>
		
		<table class="table table-bordere" style="border: 1px solid gray; width: 80%;">
			<tr style="border: 1px solid gray; ">
				<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">결제금액 수령완료 : ${year}년 ${month}월 ${day}일</td>
				<td >₩<fmt:formatNumber value="${totalprice}" pattern="#,###"/></td>
			</tr>
			
			<tr>
				<td style="width: 20%; font-weight: bold; background-color: #e5e5e5">잔액</td>
				<td >0</td>
			</tr>
		</table>
	</div>
	<div class="col-md-12">
		<button type="button" class="btn btn-danger" id="btnsubmit"><span style="color: white; ">확인</span></button> 
		<!-- <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#cancelModal" id="btnCancel"  style="margin-left: 3%;"><span style="color: white; ">예약 취소하기</span></button> --> 
	</div>	
</div>

 <!-- 예약취소 Modal -->
  <div class="modal fade" id="cancelModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-weight: bold;">예약을 취소하시겠습니까?</h4>
        </div>
        <div class="modal-body" style="margin-bottom: 3%;" >
			<h3>예약을 취소하시려는 이유를 선택해주세요.</h3>
			<select id="cancelReason" style="font-size: 13pt; ">
				<option selected="selected">==== 취소 사유 선택 ====</option>
				<option value="1">그냥 갑자기 취소하고 싶어요.</option>
				<option value="2">잘못눌렀어요.</option>
				<option value="3">가기 싫어졌습니다.</option>
				<option value="4">잘못예약했습니다.</option>
			</select><br><br>
			<h4 id="h4text" style="font-weight: bold;">to 호스트에게...</h4>
			<input type="text" id="textToHost" name="textToHost" placeholder="호스트에게 사죄의 말씀을 짧고 간결하게 남기세요." style="width: 70%; height: 4%; font-size: 13pt;"/>
        	<br><span id="binkan" style="font-size: 13pt; color: red;">빈칸을 입력해주세요.</span>
        	
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelModal" onclick="goCancel()">확인</button>
        </div>
      </div>
      
    </div>
  </div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
<hr>
</div>


</body>
</html>

