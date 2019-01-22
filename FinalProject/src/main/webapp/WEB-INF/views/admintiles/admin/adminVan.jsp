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

	/* $(document).ready(function(){
		
		$.ajax({
			url: "adminVanJSON.air",
			type: "GET",
			dataType:"JSON",
			success: function(){
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}); */
	
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
						<c:forEach var="reportvo" items="${reportMap}">
							<td>${reportvo.report_idx}</td>
					        <td>${reportvo.fk_userid}</td>
					        <td>${reportvo.report_content}</td>
					        <td style="text-align: center;">${reportvo.report_date}</td>
					        <c:if test="${reportvo.report_status == 1}">
					        	<td style="text-align: center;">처리</td>
					        </c:if>
					         <c:if test="${reportvo.report_status == 0}">
					        	<td style="text-align: center;">미처리</td>
					        </c:if>
				        </c:forEach>
				    </tbody>
				</table>			
			</div>
		</div>
	</div>
</div>

<form name="memberFrm">
	<div id="searchbar" style="text-align: center;">
		<select id="searchType" name="searchType">
			<option value="num">번호</option>
			<option value="userid">아이디</option>
		</select>
        <input type="text" id="searchWord" name="searchWord" placeholder="검색" style="" />
        <span id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px; height:20px; cursor: pointer;" onClick="goSearch();"/></span>
    </div>
</form>

<div class="pageBar" style="text-align: center; margin: 2%;">
	[이전]    1    2    3    4    5		6		7		8		9    [다음]
</div>
   