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
  	<h2>${membervo.username}님 상세보기</h2>	<!-- (유저 이름) 상세보기로 할 것 -->
  </div>
  
  <c:if test="${membervo.profileimg != null}">
	  <div class="col-md-5" style="text-align: center; margin-right:13%; border: solid 0px gray; float: right;">
		  <h5>member image<code>member</code>:</h5>
		  <img src="<%= cxtPath %>/resources/images/${membervo.profileimg}" alt="member image" style="width: 50%;"/>
	  </div>	<!-- 이미지는 프로필 사진임 -->
  </c:if>
  
  <c:if test="${membervo.profileimg == null}">
	  <div class="col-md-5" style="text-align: center; margin-right:13%; border: solid 0px gray; float: right;">
		  <h5>member image<code>member</code>:</h5>
		  <img src="<%= cxtPath %>/resources/images/친구와함께.JPG" alt="member image" style="width: 50%;"/>
	  </div>	<!-- 이미지는 프로필 사진임 -->
  </c:if>
  
  <div class="col-md-12" style="padding: 2%; float: center; padding-left: 8%;">
	  <table class="table table-bordered" style="width: 80%; padding-left: 8%;">
	      <tr>
	        <th>이름</th>
	        <td style="text-align: left;">${membervo.username}</td>
	      </tr>
	      <tr>
	        <th>아이디</th>
	        <td style="text-align: left;">${membervo.userid}</td>
	      </tr>
	      <tr>
	        <th>이메일</th>
	        <td style="text-align: left;">${membervo.email}</td>
	      </tr>
	      <tr>
	        <th>phone</th>
	        <td style="text-align: left;">${membervo.phone}</td>
	      </tr>
	      <tr>
	        <th>post</th>
	        <td style="text-align: left;">${membervo.post}</td>
	      </tr>
	      <tr>
	        <th>주소</th>
	        <td style="text-align: left;">${membervo.addr}&nbsp;${membervo.detailAddr}</td>
	      </tr>
	      <c:if test="${membervo.gender == 1}">
		      <tr>
		        <th>성별</th>
		        <td style="text-align: left;">남자</td>
		      </tr>
	      </c:if>
	      <c:if test="${membervo.gender == 2}">
		      <tr>
		        <th>성별</th>
		        <td style="text-align: left;">여자</td>
		      </tr>
	      </c:if>
	      <tr>
	        <th>생년월일</th>
	        <td style="text-align: left;">${membervo.birthday}</td>
	      </tr>
	      <tr>
	        <th>가입일</th>
	        <td style="text-align: left;">${membervo.regDate}</td>
	      </tr>
	      <tr>
	        <th>경고횟수</th>
	        <td style="text-align: left;">${membervo.warnCount}</td>
	      </tr>
	      <c:if test='${mycoupon == "[]"}'>
	      <tr>
	        <th>보유쿠폰</th>
	        <td style="text-align: left;">없음</td>
	      </tr>
	      </c:if>
	      <c:if test='${mycoupon != "[]"}'>
	      <tr>
	        <th>보유쿠폰</th>
	        <td style="text-align: left;">
	        	<c:forEach var="mycp" items="${mycoupon}" varStatus="sts">
	        		${mycp.fk_cpcode}<c:if test="${sts.count != 1 }">,</c:if>
	        	</c:forEach>
	        </td>
	      </tr>
	      </c:if>
	       <c:if test='${reservation == "[]"}'>
	      <tr>
	        <th>예약번호</th>
	        <td style="text-align: left;">없음</td>
	      </tr>
	      </c:if>
	      <c:if test='${reservation != "[]"}'>
	      <tr>
	        <th>예약번호</th>
	        <td style="text-align: left;">
	        	<c:forEach var="rsv" items="${reservation}">
	        		${rsv.rsvcode }
	        	</c:forEach>
	        </td>
	      </tr>
	      </c:if>
	      <tr>
	        <th>자기소개</th>
	        <td style="text-align: left;">
	        <textarea rows="8" cols="40" style="width:100%;">${membervo.introduction}</textarea>
	        </td>
	      </tr>
	  </table>
	  
	  <div style="text-align: center;">
	  	<button type="button" class="btn btn-primary" style="height: 4%;" onClick="javascript:history.back();">뒤로가기</button>
	  </div>
  </div>


  
</div>
