<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cxtPath = request.getContextPath();
%>   

<style type="text/css">
	table#lodgingManage thead tr th,
	table#lodgingManage tbody tr td{
		vertical-align: middle;
	}
</style>
<script type="text/javascript">
	function goPermission(roomcode){
		var r = confirm("해당"+roomcode+"번의 숙소를 영업 허가하시겠습니까?");
		
		if(r){
			var frm = document.goRoomStatusFrm;
			frm.roomcode.value = roomcode; 
			frm.method = "POST";
			frm.action = "roompermit.air";
			frm.submit();	
		}else{
			return;
		}
	}
	
</script>
<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 1%;">
		<div class="give_after_underline">
			<h2 class="home_title">숙소  등록 관리</h2>
		</div>
	</div> 
	<div id="lodgingList" class="container">	
		<div class="row">		
			<div class="col-md-12">
			<table id="lodgingManage" class="table"> 
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
				  	<!-- 데이터 돌리기 -->
				  	<c:forEach items="${roomList}" var="rvo" varStatus="status">
				  		<tr> 
						      <td>${rvo.roomcode}</td>
						      <td><img src="${rvo.roomMainImg}" width="60%"/></td>
						      <td>${rvo.roomName}</td>
						      <td>${rvo.roomSido}${rvo.roomSigungu}${rvo.roomBname}</td>
						      <td>${rvo.host.username }</td>
						      <td>￦<fmt:formatNumber pattern="###,###">${rvo.roomPrice}</fmt:formatNumber></td>
						      <td><button type="button" class="btn btn-danger" onClick="goPermission(${rvo.roomcode})">등록허가</button></td>
					    </tr> 
				  	</c:forEach> 
				  </tbody>
				</table>			
			</div>
		</div>
	</div> 
	
	<form name="goRoomStatusFrm">
		<input type="hidden" name="roomcode" />
	</form>
</div>