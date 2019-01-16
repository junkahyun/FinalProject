<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cxtPath = request.getContextPath();
%> 

<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<div class="container" style="padding: 2%; border: solid 0px gray; width: 83%; float:right; text-align: right;">

  <div class="col-md-5" style="text-align: center; margin-top:7%; border: solid 0px gray;">
  	<h2>상세보기</h2>	<!-- (유저 이름) 상세보기로 할 것 -->
  </div>
  
  <div class="col-md-5" style="text-align: center; margin-right:13%; border: solid 0px gray; float: right;">
	  <h5>member image<code>member</code>:</h5>
	  <img src="<%= cxtPath %>/resources/images/친구와함께.JPG" alt="member image" style="width: 50%;"/>
  </div>	<!-- 이미지는 프로필 사진임 -->
  
  <div class="col-md-12" style="padding: 2%; float: center; padding-left: 8%;">
	  <table class="table table-bordered" style="width: 80%; padding-left: 8%;">
	      <tr>
	        <th>이름</th>
	        <td style="text-align: left;">홍길동</td>
	      </tr>
	      <tr>
	        <th>아이디</th>
	        <td style="text-align: left;">leess</td>
	      </tr>
	      <tr>
	        <th>이메일</th>
	        <td style="text-align: left;">idjfidj@naver.com</td>
	      </tr>
	      <tr>
	        <th>phone</th>
	        <td style="text-align: left;">010-5484-8989</td>
	      </tr>
	      <tr>
	        <th>post</th>
	        <td style="text-align: left;">?</td>
	      </tr>
	      <tr>
	        <th>주소</th>
	        <td style="text-align: left;">서울특별시 중랑구 ?? 아파트 1002동 501호</td>
	      </tr>
	      <tr>
	        <th>성별</th>
	        <td style="text-align: left;">여자</td>
	      </tr>
	      <tr>
	        <th>생년월일</th>
	        <td style="text-align: left;">901012</td>
	      </tr>
	      <tr>
	        <th>가입일</th>
	        <td style="text-align: left;">1992-04-16</td>
	      </tr>
	      <tr>
	        <th>경고횟수</th>
	        <td style="text-align: left;">?</td>
	      </tr>
	      <tr>
	        <th>자기소개</th>
	        <td style="text-align: left;">
	        <textarea rows="8" cols="40" style="width:100%;">안녕하세여 이순신입니다.eiuueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee</textarea>
	        </td>
	      </tr>
	  </table>
	  
	  <div style="text-align: center;">
	  	<button type="button" class="btn btn-primary" style="height: 4%;" onClick="javascript:hostory.back();">뒤로가기</button>
	  </div>
  </div>


  
</div>
