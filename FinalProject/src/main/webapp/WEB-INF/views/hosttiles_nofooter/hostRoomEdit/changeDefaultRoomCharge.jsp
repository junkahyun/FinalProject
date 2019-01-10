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

</style>

<script>

	$(document).ready(function(){
		$(".successbtn").css('opacity',0.5);
		
		$(".panel-default").click(function(){
			$(this).addClass("click");
			$(".successbtn").css('opacity',1); 
		});
		
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

	<h3 >기본 요금</h3>
	<span style="font-size: 12pt; font-weight: bold;">스마트 요금&nbsp;&nbsp;</span><button type="button" class="btn" id="betta">베타테스트중</button><br><br>
	<span style="font-size: 12pt;">수요에 따라 요금이 자동으로 조정됩니다. 요금은 회원님이 설정하신 범위 안에서 책정되며,<br> 언제든 변경하실 수 있습니다.</span>
	<hr width="50%;" align="left" style="margin-top: 2%;">	
	
	<form name="changeDefualt">
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">기본 요금&nbsp;&nbsp;</span>
	<div align="left" style="width: 35%; margin-bottom: 10%;">
	  <div class="panel panel-default" style="margin-top: 3%;" >
	    <div class="panel-body">₩&nbsp;&nbsp;<input type="number" class="chargetext" type="text" style="border: none; font-size: 13pt; "/></div>
	  </div>
	</div>
	</form>
	
	<hr style="width: 50%;" align="left">
	<button class="btn successbtn" onClick="changeCharge();">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn cancelbtn" onclick="javascript:history.back();">취소</button>
</div>
