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
<div style="margin: 2%;">

	<div class="row"> 	
		<div class="col-md-6">	
			<div>
				<h3>어떻게 시작하고 싶으세요?</h3>
			</div>		
			<div class="row" style="margin-top: 5%">		
				<div class="col-md-1" style="margin-top: 2%">
					<input type="radio"/>
				</div>
				<div class="col-md-2">
					<img src="<%=request.getContextPath() %>/resources/img/room.PNG" />
				</div>
				<div class="col-md-9" style="margin-top: 2%">
					새로운 숙소 등록하기
				</div>
			</div>		
			<hr />
		</div>		
	</div>
	<div class="row" style="margin-top: 5%;">
		<div class="col-md-6">
		<hr />
			<div align="right">
				<button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">다음</button>
			</div>		
		</div>
	</div>
	
</div>

</body>
</html>