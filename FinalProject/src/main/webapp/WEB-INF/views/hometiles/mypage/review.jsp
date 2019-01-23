<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>

<title>:::HOMEPAGE:::</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />
         
<style type="text/css">
._1k01n3v1 {
    color: var(--color-text-link, #008489) !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
}
.firstDIV{
	margin-top: 5%;
	margin-bottom: 5%; 
}
#table_header{
	font-size: 10pt;
	align-content: center;
	align-items: center;
	
}
 #tbody_td > td {
 	vertical-align : middle;
	text-align: center;
	border-bottom: 1px solid lightgray;
	}
.panel-body{

	border: 1px solid lightgray;
}
</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
</script>

<div class="row firstDIV">
<!--  사이드바 -->
<div class="col-md-1"></div>
    <div class="col-md-2">
	      <div class="sidenav" align="center">
			  <ul class="sidenav-list">
			    <li>
			      <a href="<%= ctxPath %>/myEdit.air" aria-selected="false" class="sidenav-item"><h4>프로필 수정</h4></a>
			    </li>
			    <li>
			      <a href="<%= ctxPath %>/review.air" aria-selected="false" class="sidenav-item"><h4>후기</h4></a>
			    </li>
			    <li>
			      <a href="<%= ctxPath %>/myReservation.air" aria-selected="true" class="sidenav-item"><h4>예약 관리</h4></a>
			    </li>
			    <li>
			      <a href="<%= ctxPath %>/myCoupon.air" aria-selected="false" class="sidenav-item"><h4>나의 쿠폰</h4></a>
			    </li>
			  </ul>
		 </div>	
	  </div>
<!--  사이드바끝 -->  
    <div class="col-md-8">
     
      <div id="dashboard-content">
   

	  <ul class="nav nav-tabs">

	    <li class="active"><a data-toggle="tab" href="#home">나에 대한 후기</a></li>

	    <li><a data-toggle="tab" href="#menu1">내가작성한후기</a></li>

	  </ul>

	

	  <div class="tab-content">

	    <div id="home" class="tab-pane fade in active">

	      <div class="panel-header" style="margin-top: 3%;border: 1px solid lightgray">

	     	 <h3 class="edit-profile-section-heading">지난 후기</h3>

	      </div>

	      <div class="panel-body">
			<c:forEach items="${myReadReview}" var="wirteReview" varStatus="status">
			  <c:if test="${wirteReview == null}">					
				    <ul class="list-layout reviews-list">
		
			          <li class="reviews-list-item">
		
			                           후기는 에어비앤비 숙박이 완료된 후 작성됩니다. 나에 대한 후기는 이곳과 공개 프로필에서 볼 수 있습니다.
		
					  </li>
		
					  <li>아직 작성된 후기가 없습니다.</li>
		
			        </ul>
		        </c:if>
	        </c:forEach>	
	        <!-- ---------------------- -->
	        <c:forEach items="${myReadReview}" var="wirteReview" varStatus="status">
					<c:if test="${wirteReview != null}">					
						<table class="memberList table table-hover">						
								<col width="10%;"/>
								<col width="8%;"/>
								<col width="25%;"/>
								<col width="7%"/>
								<col width="7%"/>
								<col width="8%"/>
								<col width="6%"/>
								<col width="6%;"/>
								<col width="7%;"/>
								<col width="6%;"/>
								<col width="20%;"/>
								<c:if test="${status.count ==1 }">
								  <thead>						
								    <tr id="table_header">
								      <th>예약번호</th>
								      <th>아이디</th>
								      <th>후기내용</th>
								      <th>평점</th>
								      <th>정확성</th>
								      <th>의사소통</th>
								      <th>청결</th>
								      <th>위치</th>
								      <th>체크인</th>
								      <th>가치</th>
								      <th>후기작성일</th>
								    </tr>							    
								  </thead>
							  </c:if>							 
							  <tbody>					  
							    <tr id="tbody_td">
							      <td>${wirteReview.review_idx}</td>
							      <td>${wirteReview.write_userid}</td>
							      <td>${wirteReview.review_content}</td>							      
							     	<td>${wirteReview.AVG}</td>
							      <td>${wirteReview.correct}</td>
							      <td>${wirteReview.communicate}</td>
							      <td>${wirteReview.clean}</td>
							      <td>${wirteReview.position}</td>
							      <td>${wirteReview.checkin}</td>
							      <td>${wirteReview.value}</td>
							      <td>${wirteReview.review_writedate}</td>								
								</tr>
							</table>
				      </c:if>	
				  </c:forEach> 

         </div>
		
	

	    </div>

	    <div id="menu1" class="tab-pane tab-panel">

	    	 <div class="panel-header" style="margin-top: 3%;">

	      		<h3 class="edit-profile-section-heading">작성해야 할 후기</h3>

	         </div>
			
		     <div class="panel-body">

		       <ul class="list-layout reviews-list">

	             <li class="reviews-list-item">

		      		현재 작성할 후기가 없습니다. 여행을 한번 다녀올 때가 된 것 같네요!

		       	 </li>

	        	</ul>	 
<!-- -----------------------------------------------------------  -->
        	</div>

          <div class="panel-header" style="margin-top: 3%;">	     

	      	<h3 class="edit-profile-section-heading">내가 작성한 후기</h3>
			
	      </div>
				
		      <div class="panel-body" align="center">
		       <c:forEach items="${myWriteReview}" var="wirteReview">
		       <c:if test="${wirteReview eq null}">
		        <ul class="list-layout reviews-list">
		             <li class="reviews-list-item">
	
		                               아직 후기를 남기지 않으셨습니다.
	
					 </li>	
				</ul>	
				</c:if>
				</c:forEach>	
				<c:forEach items="${myWriteReview}" var="wirteReview" varStatus="status">
					<c:if test="${wirteReview != null}">					
						<table class="memberList table table-hover">						
								<col width="10%;"/>
								<col width="15%;"/>
								<col width="30%;"/>
								<col width="10%"/>
								<c:if test="${status.count ==1 }">
								  <thead>						
								    <tr>
								      <th>번호</th>
								      <th>숙소 이름</th>
								      <th>후기 내용</th>
								      <th>후기 쓴 날짜</th>
								    </tr>							    
								  </thead>
							  </c:if>							 
							  <tbody>					  
							    <tr id="tbody_td ">
							      <td>${wirteReview.review_idx}</td>
							      <td><a href="">${wirteReview.room.roomName}</a></td>
							      <td>${wirteReview.review_content}</td>
							      <td>${wirteReview.review_writedate}</td>
								</tr>
							</table>
				      </c:if>	
				  </c:forEach>
				
			</div>
				</div>
		
		
	    </div>	

	   </div>

	  </div>

 </div>

     </div>

