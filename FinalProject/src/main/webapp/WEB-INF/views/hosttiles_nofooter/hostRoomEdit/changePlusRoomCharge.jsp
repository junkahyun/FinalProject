<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.successbtn{background-color: #008489; color: white; padding: 1%; width: 5%; font-weight: bold; font-size: 12pt;
}


</style>

<script>

	$(document).ready(function(){
		
		
		$("#betta").click(function(){
			
			alert("베타 테스트 중입니다!");
			
		});
		
		
	});
	
	function changeCharge(){
		alert("이용요금 변경 확인");
		
		var frm = document.changeDefualt;
		frm.method="POST";
		frm.action="";
		//frm.submit();
	}

</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
   <i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; ">뒤로</a>

	<h3 >추가 요금</h3>
	
	<form name="changeDefualt">
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">청소비&nbsp;&nbsp;</span><br>
	<span>청소비는 모든 예약에 적용됩니다.</span>
	<div align="left" style="width: 50%; margin-bottom: 10%;">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input type="text" style="border: 0px; "/></div>
	  </div>
	</div>
	
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">성수기 요금&nbsp;&nbsp;</span><br>
	<span>성수기 요금은 모든 예약에 적용됩니다.</span>
	<div align="left" style="width: 50%; margin-bottom: 10%;">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input type="text" style="border: 0px; "/></div>
	  </div>
	</div>
	
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">추가 인원 요금&nbsp;&nbsp;</span><br>
	<span>추가 인원 요금은 모든 예약에 적용됩니다.</span>
	<div align="left" style="width: 50%; margin-bottom: 10%;">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input type="text" style="border: 0px; "/></div>
	  </div>
	</div>
	</form>
	
	<hr style="width: 50%;" align="left">
	<button class="btn successbtn" onClick="changeCharge();">저장</button>&nbsp;<button class="btn cancelbtn" onclick="javascript:history.back();">취소</button>
</div>
