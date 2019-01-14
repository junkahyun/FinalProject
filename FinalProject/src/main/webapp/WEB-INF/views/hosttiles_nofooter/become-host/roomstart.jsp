<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	function start(){
		var frm = document.roomstart;
		frm.action = "roomtype.air";
		frm.method = "GET";
		frm.submit();
	}
	
</script>

<form name="roomstart">
	<div class="row">
		<div class="col-md-4" style="margin-left: 20%; margin-top: 3%;">
			<h2 style="font-weight: normal; margin-bottom: 5%;">숙소 등록을 시작해볼까요?</h2>
			<div style="font-weight: bold; color: gray;">1단계</div>
			<h3 style="margin: 0%;">등록하시려는 숙소 유형은<br/> 무엇인가요?</h3>
			<div class="row" style="margin-top: 3%; padding-left: 15px;">
				<div class="col-md-4" style="padding-left: 0;">
					<select name="room_type" style="width: 100%; padding: 13px; border-radius: 2px;"> 
						<c:forEach items="${roomtype}" var="map">
							<option value="${map.ROOMTYPE_IDX}">${map.ROOMTYPE_NAME}</option> 
						</c:forEach> 
					</select>
				</div> 
				<div class="col-md-4" style="padding-left: 0;">     
					<select name="person_capacity" style="width: 100%; padding: 13px; border-radius: 2px;">
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
			</div>
			<div align="left" style="margin-top: 3%;">
				<button type="button" onclick="start();" class="form-control" style="width: 60px; height: 35px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold;">계속</button>
			</div>
		</div>
		<div class="col-md-4">
			<img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
		</div>
	
	</div>
</form>




