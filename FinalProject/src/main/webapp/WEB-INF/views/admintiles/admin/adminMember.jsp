<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cxtPath = request.getContextPath();
%>
 <!-- 석화가 한 것 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<div class="">
			<h2 class="home_title">회원관리</h2>
		</div>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;">
			<table class="table">
					<col width="10%;"/>
					<col width="15%;"/>
					<col width="15%;"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				  <thead>
				    <tr>
				      <th>회원번호</th>
				      <th>이름</th>
				      <th>아이디</th>
				      <th>성별</th>
				      <th>전화</th>
				      <th>주소</th>
				      <th>회원삭제</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>1</td>
				      <td><a href="">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				      <td><button type="button" class="btn btn-danger">삭제</button></td>
				    </tr>
				    <tr>
				      <td>2</td>
				      <td><a href="">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				    <tr>
				      <td>3</td>
				      <td><a href="">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				    <tr>
				      <td>4</td>
				      <td><a href="">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				  </tbody>
				</table>			
			</div>
		</div>
	</div>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
	[이전]    1    2    3    4    5		6		7		8		9    [다음]
</div>
</div>