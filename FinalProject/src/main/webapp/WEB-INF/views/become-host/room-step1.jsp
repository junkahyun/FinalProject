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
		  
	#stap{font-size: 16px;}
	#stap2{font-size: 16px;}
	#stap3{font-size: 16px;
		   color: gray;}
</style>

<script>

	function start(){
		var frm = document.roomstart;
		frm.action = "roomstep1page.air";
		frm.method = "GET";
		frm.submit();
	}
	
</script>

<div>
	<img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width: 30px; height: 30px; margin-top: 20px; margin-left: 40px;">
	<hr/>
</div>

<form name="roomstart">
	<div>
		<div class="row">
		
			<div class="col-md-3" style="margin-left: 20%; margin-top: 3%; border: 0px solid blue;">
			
				<div class="row" style="border: 0px solid red;">
					<div class="col-md-12">
						<h2 style="font-weight: normal;">숙소 등록을 시작해보세요.</h2>
					</div>
					<div class="col-md-11" id="text" style="border: 0px solid red;">
						숙소의 유형, 침대 ,편의시설 등을 설정하겠습니다.
					</div>
				</div>
				
				<div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 25px; margin-bottom: 25px;"> 
					<div class="col-md-8" style="font-weight: bold; color: gray; border: 0px solid red;">1단계</div>
					<div class="col-md-11" id="stap" style="border: 0px solid red; margin-top: 20px;">
						침대, 욕실, 편의시설, 이용규칙 
					</div>  
					<div class="col-md-8" align="left" style="margin-top: 3%;">
						<button type="button" onclick="start();" class="form-control" style="width: 60px; height: 33px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold;">계속</button>
					</div>
				</div>
				
				<div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 25px; margin-bottom: 25px;">
					<div class="col-md-8" style="font-weight: bold; color: gray; border: 0px solid red;">2단계</div>
					<div class="col-md-8" style="border: 0px solid red;">
						<h3 style="color: gray;">상세 정보를 제공해 주세요</h3>
					</div>
					<div class="col-md-8" id="stap2" style="border: 0px solid red;">
						사진, 간단한 설명, 제목
					</div>
				</div>
				
				<div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 25px; margin-bottom: 25px;">
					<div class="col-md-8" style="font-weight: bold; color: gray; border: 0px solid red;">3단계</div>
					<div class="col-md-9" style="border: 0px solid red;">
						<h3 style="color: gray;">게스트를 맞이할 준비를 하세요</h3>
					</div>
					<div class="col-md-8" id="stap3" style="border: 0px solid red;">
						체크인아웃 시간, 요금설정
					</div>
				</div>
				
				
				
			</div>
			<div class="col-md-4">
				<img src="<%=request.getContextPath() %>/resources/images/boimg/roomenrollment.PNG" />
			</div>
		
		</div>
	</div>
</form>

