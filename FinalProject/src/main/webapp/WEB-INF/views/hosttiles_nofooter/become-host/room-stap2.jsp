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
		  margin-bottom: 25px;}
		  
	#stap{font-size: 16px;}
</style>

<div>
	<div class="row">
	
		<div class="col-md-4" style="margin-left: 20%; margin-top: 3%; border: 1px solid blue;">
		
			<div class="row" style="border: 1px solid red;">
				<div class="col-md-9">
					<h2 style="font-weight: normal;">숙소 등록을 계속 진행해 볼까요?</h2>
				</div>
				<div class="col-md-9" id="text" style="border: 1px solid red;">
					이제 숙소를 등록할 수 있도록 몇 가지 세부정보를 추가하도록 하겠습니다.
				</div>
			</div>
			
			<div class="row" style="border-bottom: 1px solid #D8D8D8; padding-bottom: 25px;"> 
				<div class="col-md-8" id="stap" style="border: 1px solid red;">
					침대, 욕실, 편의시설 등<br/>
					<a> 변경</a>
				</div>  
				<div class="col-md-1" style="border: 1px solid blue; padding: 0;">
					<img style="border: 1px solid red;  width: 50px; height: 50px;" src="<%=request.getContextPath() %>/resources/boimg/success.png" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-8" style="font-weight: bold; color: gray; border: 1px solid red;">2단계</div>
				<div class="col-md-8" style="padding-top: 0; border: 1px solid red;">
					<h3 style="padding-top: 0;">상세 정보를 제공해 주세요</h3>
				</div>
				<div class="col-md-8" id="stap" style="border: 1px solid red;">
					사진, 간단한 설명, 제목
				</div>
				<div class="col-md-8" align="left" style="margin-top: 3%;">
				<button type="button" class="form-control" style="width: 60px; height: 33px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold;">계속</button>
			</div>
		
			</div>
			
			
			
		</div>
		<div class="col-md-4">
			<img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
		</div>
	
	</div>
</div>

