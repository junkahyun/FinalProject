<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String ctxPath = request.getContextPath(); %>

<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />
          <style data-aphrodite="data-aphrodite">._1k01n3v1{color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;}._1k01n3v1:hover{text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;}._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
<style type="text/css">
.firstDIV{
	margin-top: 5%;
	margin-bottom: 5%; 
}


.box {
  border: 1px solid #dbdfdf;
  padding: 5px;
  box-shadow: 2px 4px #dbdfdf;
 
}
.calcel{
		font-weight: bold;
		color: 	#6ac259;font-: bold;
	}
 #lodgLocation{
 	cursor:pointer;
 	color :#008489; 
 	
 }
 #lodgLocation:hover{
 text-decoration:underline;
 font-weight:bold;
 }
 ul>li{
  list-style: none;
  margin: 2%;
 }
</style>
<script type="text/javascript" src="/startspring/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	$("#lodgLocation").click(function(){
		showLocation();
		
	});	

});
function showLocation(){
	var url = "/bnb/myReservationMAP.air?rsvcode=${myRsvDetail.rsvcode}";
	window.open(url,"숙소위치","width=500,height=350");
	
}
function goCancel() {
	var frm = document.goCancelFrm;
	frm.method="POST";
	frm.action="goCancel.air";
	frm.submit();
}
</script>

<div class="row" style="border: 0px soild red;">
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
 <div class="col-md-7 firstDIV">
   	<div class="box" style="margin-bottom: 6%">
		<h3>고객님의 투숙 예정숙소 입니다!</h3><p>고객님이 투숙예정 숙소들 입니다!</p><a href="javascript:history.back();">>>>예약페이지로 돌아가기</a>
	</div>	
	 <div id="dashboard-content">	
     <div class="panel-body box" style="border-top: 1px solid #dbdfdf;">     			
		<div class="row" style="border:padding:2%;">
		
			<div style="margin-left: 2%; margin-top: 5%" >
				<div class="property-info">
					<h3><a href="<%= ctxPath %>/homeDetail.air?roomcode=${myRsvDetail.roomcode}">${myRsvDetail.roomname}</a></h3>
					<p><span data-selenium="hotel-address-map">
						${myRsvDetail.roomsido}&nbsp;${myRsvDetail.roomsigungu}&nbsp;
						${myRsvDetail.roombname}&nbsp;${myRsvDetail.roomdetailaddr}
						<span id="lodgLocation">&nbsp;숙소 위치 확인</span><br/>
					<img src="<%= ctxPath %>/resources/images/mypage/phone-call.png" height="15pt"/>
					<c:set value="${myRsvDetail.roomtel}" var="phone"/>
					<c:out value="(${fn:substring(phone, 0, 3)}) ${fn:substring(phone, 3, fn:length(phone))}"/></p></span>
					
				</div>
			</div>
			<div  class="col-md-12">			
				<div class="col-md-3"><img src="<%= ctxPath %>/resources/images/becomehost/${myRsvDetail.roommainimg}" width="200px"></div>					
				<div class="col-md-9 push_left">
					<div  class="col-md-12" style="border-bottom: 1px solid #dbdfdf;">
						<div class="col-md-5" style="border: 0px solid gray; float:left; padding-left: 3%;"><h5>예약 번호</h5></div>
						<div class="col-md-7" style="border: 0px solid gray; float:left;">
							<div style="margin-bottom: 3%">${myRsvDetail.rsvcode}</div>
							<div style="margin-bottom: 2%">
								<span class="calcel"><img src="<%= ctxPath %>/resources/images/mypage/checked.png" width="5%;">&nbsp;예약일 : ${myRsvDetail.paydate}</span>
							</div>
						</div>
					</div> 
					<div class="col-md-12" style="border-bottom: 1px solid #dbdfdf; padding:1%;">
						<div class="col-md-12" style="float:left;">
							<div class="col-md-5" style="border: 0px solid red; float:left;"><h5>체크인</h5></div>
							<div class="col-md-7" style="float:left;">${myRsvDetail.rsv_checkindate}&nbsp;${myRsvDetail.checkInDay}</div>					
						</div>	 
						<div class="col-md-12">			
							<div class="col-md-5" style="float:left;"><h5>체크아웃</h5></div>
							<div class="col-md-5" data-selenium="check-out-content">${myRsvDetail.rsv_checkoutdate}&nbsp;${myRsvDetail.checkOutDay}</div>
							 <div class="col-md-2" style="float:left;" data-selenium="number-of-stay">${myRsvDetail.dat}박</div>
						</div>
					</div> 
					<div class="col-md-12" style="border-bottom: 1px solid #dbdfdf; padding: 3%;">
						<div class="col-md-5"  style="float:left;"><h5>연락처 정보</h5></div>
						<div class="col-md-6 row" style="padding: 1%;">
							<div style="margin-bottom: 5%">예약자 메일 : ${myRsvDetail.rsv_email}</div>
							<div style="margin: 1%;">예약자 폰번호 : ${myRsvDetail.rsv_phone}</div>
						</div>
					</div>
					<div class="col-md-12" style="border-bottom: 1px solid #dbdfdf; padding: 3%;">
						<div class="col-md-5"  style="float:left;"><h5>투숙객 이름</h5></div>
						<div class="col-md-6 row">
							<div style="margin: 1%;">${myRsvDetail.rsv_name}</div>
						</div>
					</div>
					<div class="col-md-12" style="border-bottom: 1px solid #dbdfdf; padding: 3%;">
						<div class="col-md-5"  style="float:left;"><h5>예약 객실</h5></div>
						<div class="col-md-6 row">
							<div style="margin: 1%;">숙소 유형 : ${myRsvDetail.roomtype_name}</div>
							<div style="margin: 1%;">건물유형 : ${buildtype.buildtype}</div>
							<div style="margin: 1%;">건물유형 : ${buildtype.buildtype_detail_name}</div>
							<div style="margin: 1%;"class="roomTitle">침실갯수  : ${myRsvDetail.roomcount}</div>
							<c:forEach items="${bedtype}" var="bed"  >
								<div style="margin: 1%;"class="roomTitle">침대 갯수 : ${bed.bedcount} /&nbsp;침대 유형 : ${bed.bedtype}</div>	
							</c:forEach>
						</div>
					</div>
					<div class="col-md-12" style="padding: 3%; border-bottom :1px solid #dbdfdf;">
						<div class="col-md-5"  style="float:left;"><h5>총 예약 인원</h5></div>
						<div class="col-md-6 row" style="padding: 1%;">
							<div style="margin: 1%;">성인 : ${myRsvDetail.guestcount} <c:if test="${myRsvDetail.babycount ne null}">/ 유아 : ${myRsvDetail.babycount}</c:if></div>
						</div>
					</div>
					<div class="col-md-12" style="padding: 3%; border-bottom :1px solid #dbdfdf;">
						<div class="col-md-5" style="float:left;"><h5>결제 금액</h5></div>
						<div class="col-md-6 row" style="padding: 1%;">
							<div style="margin-bottom: 1%">서비스 세금 : <fmt:formatNumber value="${myRsvDetail.servicePrice}" pattern="#,###" />원</div>
							<div style="margin: 1%;">청소비 : <fmt:formatNumber value="${myRsvDetail.cleanpay}" pattern="#,###" />원</div>
							<div style="margin: 1%;">할인금액 :<fmt:formatNumber value="${myRsvDetail.dcprice}" pattern="#,###" />원</div>
							<div style="margin: 1%;">숙소요금 : <fmt:formatNumber value="${myRsvDetail.roomprice}" pattern="#,###" />원</div>
							<div style="margin: 1%;">총 결제금액: <fmt:formatNumber value="${myRsvDetail.totalprice}" pattern="#,###" />원</div>
						</div>
					</div>
					<div class="col-md-12" style="padding: 3%; border-bottom :1px solid #dbdfdf;">
						<div class="col-md-5" style="float:left;"><h5>예약 메시지</h5></div>
						<div class="col-md-6 row" style="padding: 1%;">${myRsvDetail.rsv_msg}</div>
					</div>
				</div>
			</div>			
		</div>
       </div>
	   </div>
	<div class="col-md-12" style="margin-top:2%;">
	   		<div class="col-md-10"></div>
	   		<div class="col-md-2 row"><a class="btn btn-primary btn-default">예약 취소</a></div>
	</div>
	    <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">		
	      <!-- Modal content-->      
			      <div class="modal-content">
			        <c:if test="${myRsvDetail.daysRemaining > 3}">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">숙소 예약 취소</h4>
			        </div>
			      
			        <div class="modal-body">
			          <p><H4>${myRsvDetail.rsv_name} 님! </H4></p>
			          <span style="text-decoration:underline; color:#008489;font-weight:bold;">${myRsvDetail.roomname}</span>&nbsp;숙소를 취소하시겠습니까?
			          	 <ul>
			          	 	<li> 예약번호 &nbsp;:&nbsp;${myRsvDetail.rsvcode} </li>
						 	<li> 체 크 인 &nbsp;&nbsp;:&nbsp;${myRsvDetail.rsv_checkindate}&nbsp;${myRsvDetail.checkInDay} </li>
							<li> 체크아웃&nbsp;:&nbsp;${myRsvDetail.rsv_checkoutdate}&nbsp;${myRsvDetail.checkOutDay} </li>
						 </ul> 	
					   <p>예약 취소 시 취소가 불가 합니다!</p>			
			        </div>		   
			        <div class="modal-footer">
			          <button type="button" class="btn btn-primary btn-default" data-dismiss="modal" onClick="goCancel();">예약취소하기</button>
			          <button type="button" class="btn btn-primary btn-default" data-dismiss="modal">취소</button>
			        </div>
			        </c:if> 
				   <c:if test="${myRsvDetail.daysRemaining <= 3}">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">숙소 예약 취소가 불가합니다!</h4>
				        </div>			      
				        <div class="modal-body">
				          <p><H4>${myRsvDetail.rsv_name} 님! </H4></p>
				          <span style="text-decoration:underline; color:#008489;font-weight:bold;">${myRsvDetail.daysRemaining} 일 밖에 남지 않았습니다!</span>	
						   <p>예약 취소 시 취소가 불가 합니다! 호스트에게 문의해 주세요!</p>			
				        </div>		   
				        <div class="modal-footer">
				          <button type="button" class="btn btn-primary btn-default" data-dismiss="modal">확인</button>
				        </div>
			         </c:if> 
			      </div>     
		    </div>
	  </div>
     
 </div>

<form name="goCancelFrm">
	<input type="hidden" name="rsvcode" value="${myRsvDetail.rsvcode}" />
</form>
</div>

