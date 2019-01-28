<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />

<style data-aphrodite="data-aphrodite">
._1k01n3v1 {
		color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;
	}	
	._1k01n3v1:hover{
		text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
	}
	._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
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
	margin-top:5%;
	font-size: 10pt;
	align-content: center;
	align-items: center;
	
}
thead>tr>th{
 	vertical-align : middle;
	text-align: center;
}
.margin_top{
	margin-top:3%;
}
 tbody > tr > td {
 	vertical-align : middle;
	text-align: center;
	border-bottom: 1px solid lightgray;	
	}
.panel-body{

	border: 1px solid lightgray;
}
#checkCoupon{
		cursor:pointer;
		color:#008489;
		font-weight: bold;
}
#pagebar{
	vertical-align: center;
	text-align: center;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("#checkCoupon").click(function(){
			var url ="/bnb/couponReg.air";
			window.open(url,"쿠폰등록","width=400,height=300");			  
		});
		
		makeCommentPageBar();
		
	
	});
	
	function goViewComment(currentShowPageNo) {
		var form_data={"currentShowPageNo":currentShowPageNo} 
		
		$.ajax({
			url:"<%= request.getContextPath() %>/myCoupon.action",
			data:form_data,
			type:"GET",
			dataType:"JSON",
			success: function(json) {
/* 	            var resultHTML = "";
	            $.each(json,function(entryIndex,entry){	               
	               resultHTML += "<tr>"+
	                          "<td style='text-align: center;'>"+entry.NAME+"</td>"+
	                          "<td>"+entry.CONTENT+"</td>"+
	                          "<td style='text-align: center;'>"+entry.REGDATE+"</td>"+
	                          "</tr>";
	                          
	            });// end of each-----------------
	            
	            $("#commentDisplay").empty().html(resultHTML); */
	            
	            
	            // 페이지바 함수 호출
				//page 넘길 때 기존의 값을 없앤 후 위의 html로 채운다
				
				// ==== 댓글 내용 페이지바 AJAX로 만들기 ====
	            makeCommentPageBar(currentShowPageNo);
			
			},error: function(request, status, error){
			  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
						
		});
	}// end of goViewComment(currentShowPageNo) 

function makeCommentPageBar(currentShowPageNo) {
		var form_data = {sizePerPage:"10"};
		
		$.ajax({
			url:"<%=request.getContextPath() %>/myCoupon.air", 
			data:form_data,
			type:"GET",
			dataType:"JSON",
			success:function(json){
				var req_totalPage = ${totalPage};
				if(req_totalPage > 0) {

					var totalPage = req_totalPage;
					var pageBarHTML = "";
					
					/////////////////////////////////
					var blockSize = 10;
					// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 갯수이다. 
					
					var loop = 1;
					/*
					   loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지만
					     증가하는 용도이다.
					*/
					
					var pageNo = Math.floor((currentShowPageNo - 1)/blockSize) * blockSize + 1;
					// !!! 공식이다. !!! //
					// -----------------------------------------
					// 					[이전] 만들기
						if(pageNo != 1){
							pageBarHTML += "&nbsp;<a href='javascript:goViewComment(\""+(pageNo-1)+"\");'>[이전]</a>";	
						}		
						
					// -----------------------------------------
									 // 현재페이지
						while(!(loop > blockSize || pageNo > totalPage)){
							if(pageNo == currentShowPageNo) {// 보고 있는 페이지가 현재 페이지일 경우
								pageBarHTML += "&nbsp;<span style='color:red; font-size:12pt; font-weight:bold; text-decoration:underline;'>"+pageNo+"</span>";	
							}else{
								pageBarHTML += "&nbsp;<a href='javascript:goViewComment(\""+pageNo+"\");'>"+pageNo+"</a>";	
							}						
							
							loop++;
							pageNo++;
						}
						
					
					// -----------------------------------------					
								   // [다음] 만들기
					if(!(pageNo > totalPage)){
							pageBarHTML += "&nbsp;<a href='javascript:goViewComment(\""+pageNo+"\");'>[다음]</a>";	
						}							
						$("#pageBar").empty().html(pageBarHTML);					
						pageBarHTML = "";//초기화		
						
					}else{
						// 댓글이 없는경우
						$("#pageBar").empty();
					}
				}
				else {
					// 댓글이 없는 경우 
					$(".pageBar").empty();
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function makeCommentPageBar(currentShowPageNo)------------- 
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
			      <a href="<%= ctxPath %>/myReservation.air" aria-selected="false" class="sidenav-item"><h4>예약 관리</h4></a>
			    </li>
			    <li>
			      <a href="<%= ctxPath %>/myCoupon.air" aria-selected="true" class="sidenav-item"><h4>나의 쿠폰</h4></a>
			    </li>
			  </ul>
		 </div>	
	  </div>
<!--  사이드바끝 -->  
    <div class="col-md-7">
     <div style="padding:2%; border: 1px solid #dbdfdf;" >
		<h3>상품할인쿠폰</h3>
		<p>고객님이 받으신 e-mail 이나 오프라인에서 지급받으신 쿠폰 번호를 입력하시면, 할인쿠폰을 지급해 드립니다.</p>
		<span id="checkCoupon">쿠폰등록 하러가기</span>
		<!-- <input type="text" style="width: 40%" placeholder="쿠폰번호입력"/>   -->
	</div>	
    <div id="dashboard-content" class="margin_top">   
<!--  상단 바 -->
     <div class="menutab"> 
      <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">보유쿠폰</a></li>
	    <li><a data-toggle="tab" href="#menu1">사용내역</a></li>
	  </ul>
	 </div>
<!--  상단 바 -->
	  <div class="tab-content margin_top">	    
<!--  보유쿠폰 목록 -->	
	
	    <div id="home" class="tab-pane fade in active " style="padding:1%;">
		<div align="center">
		<input type="hidden" name="menu1" class="menu1" value="1"/>		
		<table class="table table-hover">						
				<colgroup>
					<col width="150pt">
					<col width="150pt">
					<col width="100pt">
					<col width="200pt">
				</colgroup>						
						  <thead>	
									
						    <tr id="table_header">
						    	<th class="first couponTop" scope="col">쿠폰</th>
								<th class="couponTop" scope="col">쿠폰코드</th>
								<th class="couponTop" scope="col">할인금액</th>
								<th class="couponTop" scope="col">유효기간</th>
						    </tr>							    
						  </thead>	
				<tbody>	
					<c:forEach items="${myCoupon}" var="coupon">						
						<tr class="first">
							<td class="first"><p>${coupon.cpname}</p></td>
							<td><p>${coupon.cpcode}</p></td>
							<td><p><fmt:formatNumber value="${coupon.dcmoney}" pattern="#,###"/>원</p></td>
							<td><p>${coupon.cpexpire}</p></td>
						</tr>					
							
					</c:forEach>
				</tbody>
			</table>	
		</div>   
		<c:if test="${totalCount > 10}">
			<div class=".pagebar" name="pagebar" style="border : 1px solid red">${pagebar}</div>
		</c:if>
      </div> 
	<!--  보유쿠폰 목록 -->	
	<!-- 사용한 쿠폰 리스트 -->
	   <div id="menu1" class="tab-pane tab-panel"  style="padding:1%; border: 0px solid yellow;">
		  <div align="center">
		  <input type="hidden" name="menu1" value="2"/>
		   <table class="table table-hover">						
				<colgroup>
					<col width="150pt">
					<col width="150pt">
					<col width="100pt">
					<col width="200pt">
				</colgroup>	
					 <thead>						
						<tr id="table_header">
							<th class="first couponTop" scope="col">쿠폰</th>
							<th class="couponTop" scope="col">쿠폰코드</th>
							<th class="couponTop" scope="col">할인 금액</th>
							<th class="couponTop" scope="col">사용한날짜</th>
						</tr>							    
					  </thead>		
					<tbody>
					
						<c:forEach items="${myUseCoupon}" var="coupon">
								<tr class="first">
									<td class="first"><p>${coupon.cpname}</p></td>
									<td><p>${coupon.cpcode}</p></td>
									<td><p>${coupon.dcmoney}</p></td>
									<td><p>${coupon.usedate}</p></td>
								</tr>					
						</c:forEach>				
					</tbody>
				</table>
			</div>
			<c:if test="${totalCount > 10}">
			<div class=".pagebar" name="pagebar" style="border : 0px solid red">${pagebar}</div>
		</c:if>
	 </div>
	 
	<!-- 사용한 쿠폰 리스트 -->
	<form name="menu1Frm" value=""></form>	
<form name="couponRegFrm">
	<input type="hidden" name="userid" value="${userid}"/>
</form>

	

	  </div>
	</div>
 </div>
</div>
