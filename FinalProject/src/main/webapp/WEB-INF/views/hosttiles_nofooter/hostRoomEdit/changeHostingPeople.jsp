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
	
	function changeHosting(){
		
		var frm = document.changeHostingPeople;
		frm.method="POST";
		frm.action="";
		//frm.submit();
	}

</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
   <i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; ">뒤로</a>

	<h3 >숙박 인원</h3>
	<!-- 숙박 인원 -->
	<form name="changeHostingPeople">
	<hr style="width: 50%;" align="left">
	<div class="col-md-6" style="width:30%;">
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">기본 수용 인원&nbsp;&nbsp;</span><br>
	<div align="left" style="width: 80%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%; " >
	    <div class="panel-body">
	    <!-- 인원 선택 -->
	    	<select id="Guest" style="border-style: none; width: 100%; font-size: 12pt; ">
	    		<option selected="selected">인원 선택</option>
		    	<c:forEach var="cnt" begin="1" end="7" >
		    		<option value="${cnt}" >${cnt}명</option>
		    	</c:forEach>	
	    	</select>
	    </div>
	  </div>
	  </div>
	</div>
	
	<div class="col-md-6" style="width:30%; margin-bottom: 20%;">
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">최대 수용 인원&nbsp;&nbsp;</span><br>
	<div align="left" style="width: 80%; margin-bottom: 3%;" class="chargetext">
	  <div class="panel panel-default" style="margin-top: 3%; " >
	    <div class="panel-body">
	    <!-- 최대 수용 인원 선택 -->
	    	<select id="maxGuest" style="border-style: none; width: 100%; font-size: 12pt; ">
	    		<option selected="selected">수용 인원 선택</option>
		    	<c:forEach var="cnt" begin="1" end="7" >
	    			<option value="${cnt}" >${cnt}명</option>
		    	</c:forEach>	
	    	</select>
	    </div>
	  </div>
	</div>
	</div>
	</form>
	
	<img src="<%=request.getContextPath() %>/resources/images/host/unnamed.png" />
	<hr style="width: 50%;" align="left">
	<button class="btn successbtn" onClick="changeHosting();">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn cancelbtn" onclick="javascript:history.back();">취소</button>
</div>
