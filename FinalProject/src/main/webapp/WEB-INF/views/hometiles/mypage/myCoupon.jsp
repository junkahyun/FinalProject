<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

.box {
  border: 1px solid;
  padding: 5px;
  box-shadow: 2px 4px #dbdfdf;
}
.couponTop{
	border: 1px solid #b7b7b7;
	text-align: center;
	background-color: #dadada;
	padding: 2%;
}

tr > td {
border: 1px solid #b7b7b7;
text-align: center;
}

.firstDIV{
	margin-top: 5%;
	margin-bottom: 5%; 
}
.margin_top{
	margin-top: 5%;
}
table{
	font-size: 9pt
}
td{
	padding: 3%;
}
#checkCoupon{
 cursor: pointer;
 color: green;
 font-weight: bold;
}
</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
	$(document).ready(function(){
		$("#checkCoupon").click(function(){
			var url ="/bnb/couponReg.air";
			window.open(url,"쿠폰등록","width=400,height=300");			
/* 		    var frm = document.couponRegFrm;
		    frm.action=url;
			frm.method = "POST";  
		    frm.target = "쿠폰등록"; 
		    frm.submit();  */
		  
		});
	});
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
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">보유쿠폰</a></li>
	    <li><a data-toggle="tab" href="#menu1">사용내역</a></li>
	  </ul>
<!--  상단 바 -->

	  <div class="tab-content margin_top">
	    
<!--  보유쿠폰 목록 -->	
	    <div id="home" class="tab-pane fade in active " style="padding:1%;">
		<div align="center">
		    <table>
				<colgroup>
					<col width="150pt">
					<col width="150pt">
					<col width="100pt">
					<col width="200pt">
				</colgroup>
				<thead>
					<tr>
						<th class="first couponTop" scope="col">쿠폰</th>
						<th class="couponTop" scope="col">쿠폰코드</th>
						<th class="couponTop" scope="col">할인금액</th>
						<th class="couponTop" scope="col">유효기간</th>
					</tr>
				</thead>
	
				<tbody>
	
					<c:forEach items="${myCoupon}" var="coupon">
						<c:if test="${coupon.usedate == null and coupon.cpexpire>date}">
							<tr class="first">
								<td class="first">
									<div class="ticket_cup">
										<p>${coupon.cpname}</p>
									</div>
								</td>
								<td>  
									<div class="myt_ico_wrap alignL"><p>${coupon.cpcode}</p></div> 
								</td>
								<td><div style="width: 50px;"><p>${coupon.dcmoney}</p></div></td>
								<td>
									<p>${coupon.cpexpire}</p>
								</td>
							</tr>					
							</c:if>
						</c:forEach>
				</tbody>
			</table>	
		</div>    
      </div> 
	<!--  보유쿠폰 목록 -->	
	<!-- 사용한 쿠폰 리스트 -->
	    <div id="menu1" class="tab-pane tab-panel"  style="padding:1%; border: 0px solid yellow;">
		    <div align="center">
		     <table>
				<colgroup>
					<col width="150pt">
					<col width="150pt">
					<col width="100pt">
					<col width="200pt">
				</colgroup>
				<thead>
					<tr>
						<th class="first couponTop" scope="col">쿠폰명</th>
						<th class="couponTop" scope="col">쿠폰번호</th>
						<th class="couponTop" scope="col">할인 금액</th>
						<th class="couponTop" scope="col">사용한날짜</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach items="${myCoupon}" var="coupon">
						<c:if test="${coupon.usedate != null}">
							<tr class="first">
								<td class="first">
									<div class="ticket_cup">
										<p>${coupon.cpname}</p>
									</div>
								</td>
								<td>  
									<div class="myt_ico_wrap alignL"><p>${coupon.cpcode}</p></div> 
								</td>
								<td><div style="width: 50px;"><p>${coupon.dcmoney}</p></div></td>
								<td>
									<p>${coupon.usedate}</p>
								</td>
							</tr>					
							</c:if>
						</c:forEach>
				
				</tbody>
			</table>
		</div>
				
	    </div>	
	<!-- 사용한 쿠폰 리스트 -->


<form name="couponRegFrm">
	<input type="text" name="userid" value="회원아이디넣는칸"/>
</form>
	  </div>
	</div>
 </div>
</div>
