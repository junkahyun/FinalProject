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
.cancelbtn{background-color: white; color: #008489; border: 1.5px solid #008489; width: 5%; padding: 1%; font-weight: bold; font-size: 12pt;
}
.successbtn{background-color: #008489; color: white; padding: 1%; width: 5%; font-weight: bold; font-size: 12pt; cursor: auto;
}
input:focus {
  outline: none; 
}
select:focus {
  outline: none; 
}
.click{border: 1px solid #008489; }
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
	-webkit-appearance: none;
    margin: 0;

}
.noEmpty{border: 1px solid #ff6600;
}
.error{font-weight: bold; color: #ff6600;
}

</style>

<script>



	$(document).ready(function(){
		
		$(".successbtn").css('opacity',0.5);
		$(".error").hide();
		
		$(".panel-default").click(function(){
			$(this).addClass("click");
			$(".successbtn").css('opacity',1); 
		});
		
		$("#peopleNum").bind("change",function(){
			var num = $(this).val();
			$("#appendNum").empty().text(num);
		});
		
	});
	
	
	function changeRoomCharge(){
		
		var frm = document.changeRoomCharge;
		frm.method="POST";
		frm.action="";
		//frm.submit();
	}
</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%; height: 1000px; ">
   <i class="fas fa-angle-left"></i>&nbsp;
   <a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; " >뒤로</a>

	<h3 >추가 요금</h3>
	
	<!-- 청소비 -->
	<form name="changeRoomCharge">
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">청소비&nbsp;&nbsp;</span><br>
	<span>청소비는 모든 예약에 적용됩니다.</span>
	<div align="left" style="width: 35%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input  class="chargeNum" type="number" style="border: none; font-size: 13pt; "/></div>
	  </div>
	  <span class="error">기본 요금(은)는 필수 입력사항입니다.</span>
	</div>
	
	<!-- 성수기 요금 -->
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">성수기 요금&nbsp;&nbsp;</span><br>
	<span>성수기 요금은 모든 예약에 적용됩니다.</span>
	<div align="left" style="width: 35%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input class="chargeNum" type="number" style=" border: none; font-size: 13pt;"/></div>
	  </div>
	  <span class="error">기본 요금(은)는 필수 입력사항입니다.</span>
	</div>
	
	<!-- 추가인원요금 -->
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">추가 인원 요금&nbsp;&nbsp;</span><br>
	<span>숙박 인원이 <span id="appendNum" style="font-weight: bold;">1</span>명을 초과하면 추가 1인당 ₩0/박의 요금이 부과됩니다.</span>
	<div align="left" style="width: 35%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%; " >
	    <div class="panel-body">₩&nbsp;&nbsp;<input  class="chargeNum" type="number" style="border: none; font-size: 13pt;" /></div>
	  </div>
	  <span class="error">기본 요금(은)는 필수 입력사항입니다.</span>
	</div>
	
	<!-- 추가인원요금 -->
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">다음 인원 초과 시 인원당 요금&nbsp;&nbsp;</span><br>
	<div align="left" style="width: 35%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%; " >
	    <div class="panel-body">
	    <!-- 인원선택 옵션 -->
	    	<select id="peopleNum" style="border-style: none; width: 100%; font-size: 12pt; ">
		    	<c:forEach var="cnt" begin="1" end="16" >
		    		<c:if test="${cnt <= 15 }">
		    		<option value="${cnt}">${cnt}</option>
		    		</c:if>
		    		<c:if test="${cnt > 15 }">
			    		<option value="16+">${cnt}+</option>
			    	</c:if>
		    	</c:forEach>	
	    	</select>
	    </div>
	  </div>
	</div>
	</form>
	<hr  style="width: 75%; " align="left">
	<button class="btn successbtn" onclick="changeRoomCharge();">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn cancelbtn" onclick="javascript:history.back();">취소</button>
</div>

