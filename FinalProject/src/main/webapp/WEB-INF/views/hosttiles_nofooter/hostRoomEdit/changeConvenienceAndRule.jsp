<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<style>

.fa-angle-left:focus{text-decoration: underline;
}

h3{font-weight: bold; margin-top: 5%; margin-bottom: 3%;
}
.btn{background-color: #008489; color: white; 
}
.cancelbtn{background-color: white; color: #008489; border: 1px solid #008489; width: 5%; padding: 1%; font-weight: bold; font-size: 12pt;
}
.successbtn{background-color: #008489; color: white; padding: 1%; width: 5%; font-weight: bold; font-size: 12pt; cursor: auto;
}
input:focus {
  outline: none; 
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
	-webkit-appearance: none;
    margin: 0;

}
.click{border: 1px solid #008489; }

select:focus {
  outline: none; 
}
</style>

<script>

	$(document).ready(function(){
		
		$(".successbtn").css('opacity',0.5);
		
		$(".panel-default").click(function(){
			$(this).addClass("click");
			$(".successbtn").css('opacity',1); 
		});
		
		
	});
	
	function changeCheckInOut(){
		alert("이용요금 변경 확인");
		
		var frm = document.changeInOut;
		frm.method="POST";
		frm.action="";
		//frm.submit();
	}

</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
   <i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; ">뒤로</a>

	<h3 >어떤 편의시설을 제공하시나요?</h3>
	<!-- 체크인과 체크아웃 -->
	<hr style="width: 50%;" align="left">
	
	<div class="col-md-6" style="width:25%;">
		<div style="font-size: 0.7rem; margin-bottom: 5%;">
			<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
			<span style="font-size: 13pt; color: black;">필수품목</span>
		</div>
		
		<div style="font-size: 0.7rem; margin-bottom: 5%;">
			<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
			<span style="font-size: 13pt; color: black;">필수품목</span>
		</div>
	</div>
	
	<div class="col-md-6" style="width:30%; margin-bottom: 10%;">
		<div style="font-size: 0.7rem; margin-bottom: 5%;">
			<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
			<span style="font-size: 13pt; color: black;">필수품목</span>
		</div>
		
		<div style="font-size: 0.7rem; margin-bottom: 5%;">
			<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
			<span style="font-size: 13pt; color: black;">필수품목</span>
		</div>
	</div>
	<hr style="width: 50%;" align="left">
	<!-- 이용규칙 -->
	<h3 >어떤 이용규칙이 있나요?</h3>
	
	<hr style="width: 50%;" align="left">
	<button class="btn successbtn" onClick="changeCheckInOut();">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn cancelbtn" onclick="javascript:history.back();">취소</button>
</div>
