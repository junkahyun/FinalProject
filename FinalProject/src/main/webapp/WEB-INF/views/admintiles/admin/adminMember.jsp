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
		
		goSearch();
		
		// 검색어에 엔터를 입력한 경우
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
				// 엔터를 했을 경우
				
				goSearch();
				
			}
		});
		
	});
	
	function goSearch() {
		
		var searchWord = $("#searchWord").val().trim();
		var searchType = $("#searchType").val().trim();
		var data_form = {"searchWord":searchWord, "searchType" : searchType};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/adminMemberJSON.air",
			type:"GET",
			data:data_form,
			dataType:"JSON",
			success:function(json){ 
				var html = "";
				if(json.length > 0) {
					$.each(json, function(entryIndex, entry){
						var genderTD = "";
						
						if(entry.GENDER == "1"){
							genderTD = "<td>남자</td>";
						}else{
							genderTD = "<td>여자</td>";
						}
						
						 html += "<tr>"+
								   "<td><a href='memberDetail.air?userid="+entry.USERID+"'>"+entry.USERNAME+"</a></td>"+
								   "<td>"+entry.USERID+"</td>"+
								   "<td>"+entry.BIRTHDAY+"</td>"+
								   genderTD+
								   "<td>"+entry.PHONE+"</td>"+
								   "<td>"+entry.ADDR+"&nbsp"+entry.DETAILADDR+"</td>"+
								   " <td><button type='button' class='btn btn-danger' >삭제</button></td>"+
								   "</tr>"; 
						$("#result").html(html);
					});
				}
				else {
					$("#result").html("<tr><td colspan='8' style='color:red;'>검색된 데이터가 없습니다.</td></tr>");
				} 
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		

	}	
	
</script>
<style type="text/css">
	table.memberList thead tr th,
	table.memberList tbody tr td{
		vertical-align: middle;
	}
</style> 

	<div class="col-md-10">
		<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
			<div class="">
				<h1 class="home_title">회원관리</h1>	
			</div>
		</div>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;"> 
				<table class="memberList table table-hover">
						<col width="10%;"/>
						<col width="10%;"/>
						<col width="10%;"/> 
						<col width="10%"/>
						<col width="10%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="5%"/>
					  <thead>
					    <tr>
					      <th>이름</th>
					      <th>아이디</th>
					      <th>생년월일</th>
					      <th>성별</th>
					      <th>전화</th>
					      <th>주소</th>
					      <th>회원삭제</th>
					    </tr>
					  </thead>
					  <tbody id="result">
					  	
					  </tbody>
				</table>			
			</div>
		</div>
	</div>
	
	<form name="memberFrm">
		<div id="searchbar" style="text-align: center;">
			<select id="searchType" name="searchType">
				<option value="username">이름</option>
				<option value="userid">아이디</option>
				<option value="addr">주소</option>
			</select>
	        <input type="text" id="searchWord" name="searchWord" placeholder="검색" style="" />
	        <span id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px; height:20px; cursor: pointer;" onClick="goSearch();"/></span>
	    </div>
	</form>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
		[이전]    1    2    3    4    5		6		7		8		9    [다음]
	</div>
	

