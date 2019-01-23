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
	$(document).ready(function(){
		searchKeep();
	});
	function goSearch() {
		var frm = document.searchFrm;
		
		frm.action="<%=request.getContextPath() %>/lodgingManage.air"; 
		frm.method="GET";
		frm.submit();
	}
	function searchKeep(){
		if(${search != null && search != "" && search != "null"}) { 
			$("#colname").val("${colname}");
			$("#search").val("${search}");
		}
	}
	function goSuspension(roomcode){ 
		var r = confirm(roomcode+": 해당 숙소를 영업정지 시키겠습니까?");
		
		if(r){
			var frm = document.goRoomStatusFrm;
			frm.roomcode.value = roomcode; 
			frm.method = "POST";
			frm.action = "roomdelete.air";
			frm.submit();	
		}else{
			return;
		}
		
	}
	function goContinue(roomcode){
		var r = confirm(roomcode+": 해당 숙소를 영업활성화 시키겠습니까?");
		
		if(r){
			var frm = document.goRoomStatusFrm;
			frm.roomcode.value = roomcode; 
			frm.method = "POST";
			frm.action = "roomcontinue.air";
			frm.submit();	
		}else{
			return;
		}
	}
</script>
<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 1%;">
		<div class="give_after_underline">
			<h2 class="home_title">숙소 관리</h2>
		</div>
	</div> 
	<div id="searchFrm">
		<form name="searchFrm">
			<select name="colname" id="colname" style="height: 26px;">
			   <option value="ROOMNAME">숙소명</option>
			   <option value="LOCATION">소재지</option>
			   <option value="USERNAME">호스트이름</option>
			</select>
			<input type="text" name="search" id="search" size="40" />
			<button type="button" onClick="goSearch();">검색</button>
		</form>
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
				  		<c:if test="${rvo.roomstatus == 1}">
				  		 <tr>
				  		 </c:if>
				  		 <c:if test="${rvo.roomstatus == 0 }">
				  		 <tr style="background-color:#ff0;">
				  		 </c:if>
						      <td>${rvo.roomcode}</td>
						      <td><img src="${rvo.roomMainImg}" width="60%"/></td>
						      <td>${rvo.roomName}</td>
						      <td>${rvo.roomSido}${rvo.roomSigungu}${rvo.roomBname}</td>
						      <td>${rvo.host.username }</td>
						      <td>￦<fmt:formatNumber pattern="###,###">${rvo.roomPrice}</fmt:formatNumber></td>
						      <c:if test="${rvo.roomstatus == 1}">
						  	  <td><button type="button" class="btn btn-danger" onClick="goSuspension(${rvo.roomcode})">영업정지</button></td>
						  	  </c:if>
						  	  <c:if test="${rvo.roomstatus == 0 }">
						  	  <td><button type="button" class="btn btn-danger" onClick="goContinue(${rvo.roomcode})">영업활성화</button></td>
						      </c:if>
					    </tr> 
				  	</c:forEach> 
				  </tbody>
				</table>			
			</div>
		</div>
	</div> 
	<div class="pageBar" style="text-align: center; margin: 2%;">
		${pagebar}
	</div> 
	<form name="goRoomStatusFrm">
		<input type="hidden" name="roomcode" />
	</form>
</div>