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

<div class="col-md-10">

	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<h1>신고관리</h1>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;">
				<table class="table table-hover">
					<col width="7%;"/>
					<col width="13%;"/>
					<col width="40%;"/>
					<col width="10%"/>
					<col width="10%"/>
			    	<thead>
						<tr>
					      	<th>번호</th>
					        <th>아이디</th>
					        <th>제목</th>
					        <th style="text-align: center;">날짜</th>
					        <th style="text-align: center;">처리상태</th>
						</tr>
			    	</thead>
					<tbody>
						<%-- <c:forEach var="map" items="${reportMap}"> --%>
							<td></td>
					        <td>아이디</td>
					        <td>제목</td>
					        <td style="text-align: center;">날짜</td>
					        <td style="text-align: center;">처리상태</td>
						<%-- </c:forEach> --%>
				    </tbody>
				</table>			
			</div>
		</div>
	</div>
</div>


    