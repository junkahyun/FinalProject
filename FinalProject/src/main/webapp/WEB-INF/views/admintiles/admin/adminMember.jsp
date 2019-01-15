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
		
		// 검색어에 엔터를 입력한 경우
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
				// 엔터를 했을 경우
				 goSearch();
				//alert("엔터했군요");
			}
		});
		
		detail(userid);
		
	});
	
	function goSearch() {
		
		var searchWord = $("#searchWord").val().trim();
		
    	if(searchWord == "") {
    		alert("검색어를 입력해주세요");
    		return;
    	}
    	else {
    		
    		var frm = document.memberFrm;
    		frm.method = "GET";
    		frm.action = "adminMember.air";
    		frm.submit();
    	}

	}
	
	function memberDetail(userid) {
		
		location.href="memberDetail.air?userid="+userid;
		
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
					  <tbody>
					  	<form name="detailFrm">
						  	<c:if test="${searchMember == null}">
							  	<c:forEach var="membervo" items="${memberList}">
								    <tr>
								      <td><a data-toggle="modal" data-target="#myModal" onClick='memberDetail("${membervo.userid}")'>${membervo.username}</a></td>
								      <td>${membervo.userid}</td>
								      <td>${membervo.birthday}</td>
								      <c:if test="${membervo.gender == 1}"><td>남자</td></c:if>
								      <c:if test="${membervo.gender == 2}"><td>여자</td></c:if>
								      <td>${membervo.phone}</td>
								      <td>${membervo.addr}&nbsp;${membervo.detailddr}</td>
								      <td><button type="button" class="btn btn-danger" >삭제</button></td> 
								    </tr>
							    </c:forEach>
						    </c:if>
						    <c:if test="${searchMember != null}">
							  	<c:forEach var="membervo" items="${searchMember}">
								    <tr>
								      <td><a data-toggle="modal" data-target="#myModal" onClick='memberDetail("${membervo.userid}")'>${membervo.username}</a></td>
								      <td>${membervo.userid}</td>
								      <td>${membervo.birthday}</td>
								      <c:if test="${membervo.gender == 1}"><td>남자</td></c:if>
								      <c:if test="${membervo.gender == 2}"><td>여자</td></c:if>
								      <td>${membervo.phone}</td>
								      <td>${membervo.addr}&nbsp;${membervo.detailddr}</td>
								      <td><button type="button" class="btn btn-danger" >삭제</button></td> 
								    </tr>
							    </c:forEach>
						    </c:if>
					    </form>
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
	        <span id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px" onClick="goSearch();" /></span>
	    </div>
	</form>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
		[이전]    1    2    3    4    5		6		7		8		9    [다음]
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	    <div style="padding: 3%;">
			<div class="container">
				<div class="row">
				    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
			
						<div class="panel panel-info">
							<div class="panel-heading">
							  <h3 class="panel-title">상세 정보</h3>
							</div>
							
							<div class="panel-body" style="padding-bottom: 3%; padding-top: 3%;">
							    <div class="row">
									<div class="col-lg-3 " align="center"><img alt="프로필 사진" src="resources/images/${membervo.profileimg}" class="img-circle img-responsive"></div>			
								    
							    <div class=" col-md-9 col-lg-9 "> 
							      <table class="table table-user-information">
							        <tbody>
							        	<c:if test="${searchMember == null}">
						  					<c:forEach var="membervo" items="${memberList}">
									          <tr>
									            <td>성명</td>
									            <td>${membervo.username}</td>
									          </tr>
									          <tr>
									            <td>생년월일</td>
									            <td>${membervo.birthday}</td>
									          </tr>
									          <tr>
									            <td>아이디</td>
									            <td>${membervo.userid}</td>
									          </tr>
							                  <tr>
									            <td>성별</td>
									            <td>${membervo.gender}</td>
									          </tr>
									           <tr>
									            <td>이메일</td>
									            <td>${membervo.email}</td>
									          </tr>
									          <tr>
									            <td>핸드폰번호</td>
									            <td>${membervo.phone}</td>
									          </tr>
									          <tr>
									            <td>주소</td>
									            <td>${membervo.addr}&nbsp;${membervo.detailddr}</td>
									          </tr>
									          <tr>
									            <td>가입일</td>
									            <td>${membervo.regdate}</td>
									          </tr>
									          <tr>
									            <td>경고횟수</td>
									            <td>${membervo.warncount}</td>
									          </tr>
									          <tr>
									            <td>보유쿠폰</td>
									            
									            <td>없음</td>
									            
									          </tr>
									          <tr>
									            <td>예약코드</td>
									            
									            <td>없음</td>
									            
									          </tr>
								          </c:forEach>
					    				</c:if>
							        </tbody>
							      </table>
							      
							    </div>
							  </div>
							</div>
							<div class="" style="text-align: center; background-color: white; padding-bottom: 10px;">
					        	<button type="button" class="btn btn-secondary" data-dismiss="modal">종료</button>
					    	</div>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div> 

