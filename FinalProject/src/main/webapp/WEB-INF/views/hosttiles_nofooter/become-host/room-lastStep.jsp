<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
	#text{color: #767676;
		  font-size: 16px;
		  margin-top: 15px;
		  margin-bottom: 25px;}
	.step {
	    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
	    overflow-wrap: break-word;
	    font-size: 16px;
	    font-weight: 600;
	    line-height: 1.375em;
	    color: rgb(72, 72, 72);
	    margin: 0px;
	}
	
	.complete {
	    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
	    overflow-wrap: break-word !important;
	    font-size: 18px !important;
	    font-weight: 600 !important;
	    line-height: 1.44444em !important;
	    color: rgb(72, 72, 72) !important;
	    margin: 0px !important;
	}
</style>

<script>

	function start(){
		var frm = document.roomstep3;
		frm.action = "roomstep3page.air";
		frm.method = "GET";
		frm.submit();
	}
	
</script>

<form name="roomstep3">
<div class="row">

	<div class="col-md-6" style="margin-left: 20%; margin-top: 3%; border:0px solid gray;">
		<h2 style="font-weight: normal;">모든 단계의 작성을 완료했습니다!</h2>
		<div class="col-md-2" style="border: 1px solid #EAEAEA; width: 280px; height: 290px; margin-right: 15px; margin-top: 30px;">
			 <img src="<%=request.getContextPath() %>/resources/images/boimg/laststep1.PNG" />
			 <div style="margin-top: 20px;" class="step">1. 조건에 부합하는 게스트가 숙소를 찾습니다</div>
		</div>
		<div class="col-md-3" style="border: 1px solid #EAEAEA; width: 280px; height: 290px; margin-right: 15px; margin-top: 30px;">
			<img src="<%=request.getContextPath() %>/resources/images/boimg/laststep2.PNG" />
			<div style="margin-top: 20px;" class="step">1. 예약할 수 있는 게스트 조건을 호스트가 설정할 수 있습니다</div>
		</div>
		<div class="col-md-3" style="border: 1px solid #EAEAEA; width: 280px; height: 290px; margin-bottom: 50px; margin-top: 30px;">
			<img src="<%=request.getContextPath() %>/resources/images/boimg/laststep3.PNG" />
			<div style="margin-top: 20px;" class="step">1. 게스트가 예약하면 회원님에게 알림이 전송됩니다</div>
		</div>
		
		<div class="col-md-4 complete" style="border: 0px solid red; padding: 0; float: right;">
			숙소등록을 완료하시겠습니까?<br/>
			<button id="" type="button" style="margin-top:25px; width: 250px; height: 50px; font-size:18px; background-color: #fd5a61; border: none; border-radius: 3px; color: white; ">완료하기</button>
		</div>
	</div>

</div>
</form>

