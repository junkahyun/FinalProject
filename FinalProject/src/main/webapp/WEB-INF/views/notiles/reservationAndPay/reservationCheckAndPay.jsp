<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
h3{font-size: 14pt;
}

.btn{font-size: 14pt;
}
.myinfomation{font-size: 14pt; color: #008489; font-weight: bold; 
    }
.reservationInfo{font-size: 12pt; border: 0px;
}
  

</style>

<script type="text/javascript">

	$(document).ready(function(){
		$("#btnsubmit").click(function(){
			
			<%-- var frm = document.reservationFinalConfirm;
			frm.method="get";//post로 바꿔야함
			frm.action = "<%=ctxPath%>/paymentGateway.air";
			frm.submit(); --%>
			var url ="<%=ctxPath%>/paymentGateway.air";
			window.open(url,"예약결제", "width=880, height=630, top=200, left=500");
		});//
		
	});//end of $(document).ready------------

	
</script>

</head>
<body>

<div class="container-fluid">
  <div class="row" style="margin-top: 0.6%; ">
  		<div class="col-sm-1" style="margin-top: 0.7%; margin-left: 1%;">
    	<img src="<%=ctxPath %>/resources/images/airLogo.png" style="width: 30px; cursor: pointer;" onclick="javascript:location.href='<%=request.getContextPath() %>/list.air'"/>
    	</div>
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 >  2. 게스트 정보 입력 >  3. 확인 및 결제  > </span> 4. 예약완료</div>
  </div>
</div>

<form name="reservationFinalConfirm">
<div class="container-fluid" style="margin-top: 3%; width: 55%;">
	<div class="col-md-12" style="margin-top: 3%; margin-bottom: 3%;">
		<h2 >확인 및 결제</h2>
		<br>
		<!-- 주문자 정보  -->
		<h3 >주문자 정보</h3>
		<hr style="border: 0.5px solid gray; margin-bottom: 3%;">
		<div class="col-md-4" >
			<span class="myinfomation" >이름</span><br><br>
			<input class="reservationInfo" type="text" value="이름" readonly="readonly"/>
		</div>
		
		<div class="col-md-4" >
			<span class="myinfomation" >전화번호</span><br><br>
			<input class="reservationInfo" type="text" value="전화번호" readonly="readonly" />
		</div>
		
		<div class="col-md-4" >
			<span class="myinfomation">이메일</span><br><br>
			<input class="reservationInfo" type="text" value="이메일" readonly="readonly"/>
		</div>
	</div>
	<div class="col-md-12" style="margin-bottom: 3%;">
		<h3 >결제 정보</h3>
		<hr style="border: 0.5px solid gray;">
		<div class="col-md-3"  align="center">
			<span class="myinfomation">숙소이미지</span><br><br>
			<img src="<%=ctxPath %>/resources/img/숙소사진.JPG" style="width: 80%;"/>
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">여행지</span><br>
			<input class="reservationInfo" type="text" value="타이페이"/><br><br>
			
			<span class="myinfomation">숙박시설 호스트</span><br>
			<input class="reservationInfo" type="text" value="5박" /><br><br>
			
			<span class="myinfomation">숙소주소</span><br>
			<input class="reservationInfo" type="text" value="숙소주소" /><br><br>
		</div>
		
		<div class="col-md-3">
			<span class="myinfomation">기간</span><br>
			<input class="reservationInfo" type="text" value="5박" /><br><br>
			
			<span class="myinfomation">체크인</span><br>
			<input class="reservationInfo" type="text" value="2019년 10월 15일 12:00시" /><br><br>
			
			<span class="myinfomation">여행지</span><br>
			<input class="reservationInfo" type="text" value="타이베이" /><br><br>
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">숙소종류</span><br>
			<input class="reservationInfo" type="text" value="아파트전체"/><br><br>
			
			<span class="myinfomation">체크아웃</span><br>
			<input class="reservationInfo" type="text" value="2019년 10월 25일 18:00시" /><br><br>
			
			<span class="myinfomation">총인원</span><br>
			<input class="reservationInfo" type="text" value="5명" /><br><br>
		</div>
	</div>
	
	<div class="col-md-12">
		<hr style="border: 0.5px solid gray;">
		<div align="right" style="font-size: 14pt;">
			<span style="margin-right: 20%;">총합계(KWR)(수수료포함)</span>
			<span>₩101,610</span>
		</div>
	</div>
	<div class="col-md-12">
		<button type="button" class="btn btn-danger" id="btnsubmit"><span style="color: white; ">예약 요청하기</span></button> 
	</div>	
</div>
</form>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
<hr>
</div>

</body>
</html>
