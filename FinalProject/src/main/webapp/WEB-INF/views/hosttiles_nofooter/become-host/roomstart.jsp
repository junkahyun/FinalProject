<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<!-- header -->

<body>
<div>
	<div class="row">
	
		<div class="col-md-4" style="margin-left: 20%; margin-top: 3%;">
			<h2 style="font-weight: normal; margin-bottom: 5%;">숙소 등록을 시작해볼까요?</h2>
			<div style="font-weight: bold; color: gray;">1단계</div>
			<h3 style="margin: 0%;">등록하시려는 숙소 유형은<br/> 무엇인가요?</h3>
			<div class="row" style="margin-top: 3%; padding-left: 15px;">
				<div class="col-md-4" style="padding-left: 0;">
					<select name="room_type" style="width: 100%; padding: 9px;">  
						<option value="entire_home">집 전체</option> 
						<option value="private_room">개인실</option>
						<option value="shared_room">다인실</option>
					</select>
				</div> 
				<div class="col-md-4" style="padding-left: 0;">     
					<select name="person_capacity" style="width: 100%; padding: 9px;">
						<option value="1">최대 1명 숙박 가능</option>  
						<option value="2">최대 2명 숙박 가능</option>
						<option value="3">최대 3명 숙박 가능</option>
						<option value="4">최대 4명 숙박 가능</option>
						<option value="5">최대 5명 숙박 가능</option>
						<option value="6">최대 6명 숙박 가능</option>
						<option value="7">최대 7명 숙박 가능</option>
						<option value="8">최대 8명 숙박 가능</option>
						<option value="9">최대 9명 숙박 가능</option> 
						<option value="10">최대 10명 숙박 가능</option>
						<option value="11">최대 11명 숙박 가능</option>
						<option value="12">최대 12명 숙박 가능</option>
						<option value="13">최대 13명 숙박 가능</option>
						<option value="14">최대 14명 숙박 가능</option>
						<option value="15">최대 15명 숙박 가능</option>
						<option value="16">최대 16명 숙박 가능</option>
					</select>
				</div>
				<div class="col-md-8" style="padding-left: 0;">
					<input type="text" style="width: 100%; margin-top: 2%; padding: 2%;" value="대한민국 서울 특별시"; />  
				</div>
				   
			</div>
			<div align="left" style="margin-top: 3%;">
				<button type="button" class="form-control" style="width: 60px; height: 33px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold;">계속</button>
			</div>
		</div>
		<div class="col-md-4">
			<img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
		</div>
	
	</div>
</div>

</body>

<!-- footer -->
</html>


