<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cxtPath = request.getContextPath();
%> 
<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<div class="give_after_underline">
			<h2 class="home_title">숙소 등록 관리</h2>
		</div>
	</div> 
	<div class="container">	
		<div class="row">
		<!-- 숙소 상세 리스트는 평점이 낮은 순으로 화면에 뿌릴 것 -->
			<div class="col-md-12" style="border: 0px solid gray;">
			<table class="table"> 
					<col width="10%;"/>
					<col width="15%;"/>
					<col width="8%;"/>
					<col width="12%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				  <thead>
				    <tr>
				      <th onClick="sortTable(0)">숙소코드</th>
				      <th>숙소이미지</th>
				      <th onClick="sortTable(0)">숙소명</th>
				      <th>소재지</th>
				      <th>숙소 보유자명</th>
				      <th>숙소가격</th>
				      <th>숙소관리</th>
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
				  </tbody>
				</table>			
			</div>
		</div>
	</div>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
	[이전]    1    2    3    4    5		6		7		8		9    [다음]
</div>
</div>