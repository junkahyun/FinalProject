<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  
input{outline: none;
}
.error{cursor: wait;
}
#coupon:hover{color: tomato;
}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#name").focus();
		
		// 할인금액 있을시 할인금액 계산하기 // 
		var total = "${totalprice}";
		var tsplit = total.split(",");
		var tjoin = tsplit.join("");
		
		var dis = "${disCountMoney}";
		
		if(dis != 0){
			$("#finalprice").text(Number(parseInt(tjoin)-parseInt(dis)).toLocaleString());
		}
		else{
			$("#finalprice").text("${totalprice}");
		}
		// 할인금액 계산하기
		// 이름, 이메일, 전화번호 유효성검사 하기 
		$("#name").blur(function(){//이름 유효성 검사
			
			var name = $("#name").val();
			
			if(name == ""){
				$("#name_error").text("빈칸을 채워주세요!");
				$("#name").focus();
				return;
			}
			else{
				$("#name_error").empty();
			}
			
		});
		
		$("#email").blur(function(){//이메일 유효성 검사
			
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = $("#email").val();
			 
			 if(email == ""){
				$("#email_error").text("빈칸을 채워주세요!");
				$("#email").focus();
				return;
			}
			 else if(!regEmail.test(email)){
				 $("#email_error").text("이메일 형식에 맞게 작성해 주십시오!");
				 $("#email").val("");
				 $("#email").focus();
				 return;
			 }
			else{
				$("#email_error").empty();
			}
			
		});
		
		$("#phone").blur(function(){//전화번호 유효성 검사
			
			var phone = $("#phone").val();
			var regPhone = /\d{2,4}\d{3,4}\d{3,4}/;
			
			if(phone == ""){
				$("#phone_error").text("빈칸을 채워주세요!");
				$("#phone").focus();
				return;
			}
			else if (!regPhone.test(phone)){
				$("#phone_error").text("전화번호 형식에 맞게 입력해주세요!");
				$("#phone").val("");
				$("#phone").focus();
				return;
			}
			else{
				$("#phone_error").empty();
			}
			
		});
		
		$("#coupon").click(function(){//쿠폰적용하기 클릭시 나의 쿠폰 리스트 불러오기
			var url="<%=ctxPath%>/mycoupon.air";
			window.open(url,"mycoupon","width=1000, height=600, left=500, top=200");
			
			
		});//end of $("#coupon").click
		
		$("#btnsubmit").click(function(){
			
			//해당 칸이 공백일시 넘어가지 못하게 함.
			if($("input[id=name]").val() == "" || 
			   $("input[id=email]").val() == "" ||
			   $("input[id=phone]").val() == ""){
				return;
			}
			
			var total = $("#finalprice").text();
			var totalprice = total.split(",");
			var price = totalprice.join("");
			
			var frm = document.finalRev;
			frm.totalprice.value = price;
			frm.name.value = $("#name").val();
			frm.phone.value = $("#phone").val();
			frm.email.value = $("#email").val();
			
			
			frm.method="GET";//post로 바꿔야함
			frm.action = "<%=ctxPath%>/paymentGateway.air";
			frm.submit();
			
		});//
		
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
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 >  2. 게스트 정보 입력 >  3. 확인 및 결제  > </span> 4. 예약완료</div>
  </div>
</div>

<form name="reservationFinalConfirm">
<div class="container-fluid" style="margin-top: 3%; width: 55%;">
	<div class="col-md-12" style="margin-top: 3%; margin-bottom: 3%;">
		<h2 >확인 및 결제</h2>
		<br>
		<!-- 주문자 정보  -->
		<h3 >주문자 정보 <span style="font-size: 11pt;">(로그인한 유저와 주문자가 다를경우 정보를 다시 입력해주세요.)</span></h3>
		<hr style="border: 0.5px solid gray; margin-bottom: 3%;">
		<div class="col-md-4" >
			<span class="myinfomation" >이름</span><br><br>
			<input class="reservationInfo" type="text" value="${loginuser.username}" id="name" style="border: 1px solid gray;"/>
			<br><span class="error" style="color: red; font-size: 12pt;" id="name_error"></span>
		</div>
		
		<div class="col-md-4" >
			<span class="myinfomation" >전화번호</span><br><br>
			<input class="reservationInfo" type="text" value="${phone}"  id="phone" style="border: 1px solid gray;"/>
			<br><span class="error" style="color: red; font-size: 12pt;" id="phone_error"></span>
		</div>
		
		<div class="col-md-4" >
			<span class="myinfomation">이메일</span><br><br>
			<input class="reservationInfo" type="email" value="${email}" id="email" style="border: 1px solid gray;"/>
			<br><span class="error" style="color: red; font-size: 12pt;" id="email_error"></span>
		</div>
	</div>
	<div class="col-md-12" style="margin-bottom: 3%;">
		<h3 >결제 정보</h3>
		<hr style="border: 0.5px solid gray;">
		<div class="col-md-3"  align="center">
			<span class="myinfomation">숙소이미지</span><br><br>
			<img src="<%=request.getContextPath() %>/resources/images/becomehost/${oneRoom.roomMainImg}" style="width: 80%; height: 14%;"/>
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">여행지</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomSigungu}"/><br><br>
			
			<span class="myinfomation">숙박시설 호스트</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).fk_userid}님" /><br><br>
			
			<span class="myinfomation">숙소주소</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomSido}&nbsp;${(sessionScope.oneRoom).roomBname}" /><br><br>
		</div>
		
		<div class="col-md-3">
			<span class="myinfomation">기간</span><br>
			<input class="reservationInfo" type="text" id="datebetween" value="${day_between}박"/><br><br>
			
			<span class="myinfomation">체크인</span><br>
			<input class="reservationInfo" type="text" value="${checkin} " /><br><br>
			
			<span class="myinfomation">총인원</span><br>
			<input class="reservationInfo" type="text" value="성인 : ${guestcount}명" /><br>
			<input class="reservationInfo" type="text" value="유아 : ${babycount}명" /><br><br>
		</div>
		
		<div class="col-md-3" >
			<span class="myinfomation">숙소종류</span><br>
			<input class="reservationInfo" type="text" value="${(sessionScope.oneRoom).roomType_name}"/><br><br>
			
			<span class="myinfomation">체크아웃</span><br>
			<input class="reservationInfo" type="text" value="${checkout}" /><br><br>
		</div>
	</div>
	<div class="col-md-12" style="font-size: 13pt; font-weight: bold;">
		<span id="coupon" style="cursor: pointer;">쿠폰적용하기</span>
	</div>
	
	<div class="col-md-12">
		<hr style="border: 0.5px solid gray;">
		<div align="right" style="font-size: 14pt;">
			<span style="margin-right: 20%;">총합계(KWR)</span>
			₩ <span id="totalprice">${totalprice}</span><br>
			<span style="margin-right: 25.7%;" >할인금액(KWR)</span>
			₩ <span id="disprice"><fmt:formatNumber value="${disCountMoney}" pattern="#,###"/></span><br>
			<hr>
			<span style="margin-right: 25.7%; color: tomato;">결제금액(KWR)</span>
			₩ <span id="finalprice"></span>
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

<form name="finalRev">
	<input type="hidden" value="" name="totalprice"/>
	<input type="hidden" value="" name="name"/>
	<input type="hidden" value="" name="phone"/>
	<input type="hidden" value="" name="email"/>
</form>

</body>
</html>
