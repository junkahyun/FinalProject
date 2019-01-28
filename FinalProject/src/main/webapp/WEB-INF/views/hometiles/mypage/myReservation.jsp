<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  border: 1px solid;
  padding: 5px;
  box-shadow: 2px 4px #dbdfdf;
}
._1k01n3v1 {
    color: var(--color-text-link, #008489) !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
}
.panel-header{

}
</style>

<script type="text/javascript">
	$(document).ready(function(){

	 	}); 
</script>

<div class="row firstDIV">
<!--  사이드바 -->
<div class="col-md-1"></div>
    <div class="col-md-2" style="border: 0px solid red;">
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
    <div class="col-md-7">
     
      <div id="dashboard-content">
   
<!--  상단 바 -->
	  <ul class="nav nav-tabs">

	    <li class="active"><a data-toggle="tab" href="#home">투숙 예정 예약</a></li>

	    <li><a data-toggle="tab" href="#menu1">투숙 완료 예약</a></li>
	    <li><a data-toggle="tab" href="#menu2">취소된 예약</a></li>

	  </ul>
<!--  상단 바 -->
<!--  예약 내용 -->	
	  <div class="tab-content">
	    
	    <!--  투숙 예정 예약  -->	    
	    <div id="home" class="tab-pane fade in active" style="padding:1%;">
	      <div class="panel-header" style="margin-top: 3%; border: 1px solid #dbdfdf">
	     	 <h3 class="edit-profile-section-heading">투숙 예정 호텔</h3>
	      </div>
	    <div class="panel-body" style="border: 1px solid #dbdfdf;">
	      
	      <!--  for 문 시작 --> 
	 <c:if test="${empty memberResList}">
	 	현재 투숙 예정인 숙소가 없습니다! 새로운 여행을 떠나세요!
	 </c:if>
	  <c:forEach var="reservationInfo" items="${memberResList}" varStatus="status">	
	  <c:if test="${reservationInfo.rsv_cancledate == null && reservationInfo.flag == 1}" >
	        <div style="border: 1px solid #dbdfdf; margin-top: 5%;" class="row box"> 
	        	<div class="col-md-4" style="border: 0px solid blue; padding: 0" align="left" >
	        		<%-- <img src="<%= request.getContextPath() %>/resources/image/${reservationInfo.roommainimg}" width="100%" height="90%"/> --%>
	        		<img src="${reservationInfo.roommainimg}" style=" display: block; max-width: 100%; width: 100% \9;height: auto; }"/>
	        	</div>
	     	 
	     	 	<div  class="col-md-8" class="row">
		     	  <div  style="border: 0px solid red; padding: 0; margin-bottom: 3%;" align="right">예약일:${reservationInfo.paydate}</div>
		     	  	<div class="col-md-8" style="border: 0px solid blue;" align="left">	 
					      <div><ul class="list-layout reviews-list"><li class="reviews-list-item"><h4>${reservationInfo.roomname}</h4></li></ul></div>
					      <div><ul class="list-layout reviews-list">
					       	<li class="reviews-list-item">${reservationInfo.roomsido}${reservationInfo.roomsigungu}${reservationInfo.roombname}${reservationInfo.roomdetailaddr} &nbsp;</li>	  
							  <li>예약번호 : ${reservationInfo.rsvcode}&nbsp;</li>
							  <li>${reservationInfo.roomtype_name}&nbsp;</li>
					        </ul>
					       </div>
					  </div> 
					  <div  class="col-md-4" style="border: 0px solid red; margin-bottom: 20%; padding: 0;">
						  <div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
							<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
								<div style="font-size: 8pt; text-align: left;">체크인</div>
								<div style="text-align: left; font-size: 20pt">${reservationInfo.checkInDD}</div>
							</div>
							<div class="col-md-6" style="padding: 0;border-right : 1px dashed gray">
								<ul class="list-layout reviews-list">
							       	<li class="reviews-list-item"><br/></li>	  
									<li>${reservationInfo.checkInYY}년${reservationInfo.checkInMM}월&nbsp;${reservationInfo.checkInDay}</li>
							    </ul>
						    </div>   
						  </div>
						  <div class="col-md-6 row" style="border: 0px solid orange; padding: 0; margin-left: 1px">							 
								<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
									<div style="font-size: 8pt; padding-left:1px;">체크아웃</div>
									<div style="padding-left:3px; font-size: 20pt">${reservationInfo.checkOutDD}</div>
								</div>
								<div class="col-md-6" style= "padding: 0; margin: 0;">
										<ul class="list-layout reviews-list">
									       	<li class="reviews-list-item"><br/></li>	  
											  <li>${reservationInfo.checkOutYY}년${reservationInfo.checkOutMM}월&nbsp;${reservationInfo.checkOutDay}</li>
									    </ul>
							    </div> 
							
						     
						  </div>					   
					  </div>
					  <div style="margin-bottom : 1%;" align="right"><a href="<%= ctxPath %>/myReservationScheduleDetail.air?userid=${userid}&rsvcode=${reservationInfo.rsvcode}" class="btn btn-primary btn-default">예약 상세 보기</a></div>  				  
		      </div> 	           	   	       
	        </div> 	
	       </c:if> 
	    </c:forEach>
	
	            <!--  for 문 끝 --> 		         
         </div>
       </div>
	    <!--  투숙 예정 예약  끝-->
	    <!--  투숙 완료 예약 -->
	    <div id="menu1" class="tab-pane tab-panel"  style="padding:1%; border: 0px solid yellow;">
 			<div class="panel-header" style="margin-top: 3%; border: 1px solid #dbdfdf">
	     	 <h3 class="edit-profile-section-heading">투숙 완료 예약</h3>
	      </div>


      <div class="panel-body" style="border: 1px solid #dbdfdf;">
      <c:if test="${empty memberResList}">
      	저희와 함께 해보지 않으셨군요! 저희와 함께 새로운 여행을 떠나보세요!
      </c:if>
			 <c:forEach var="reservationInfo" items="${memberResList}">	    
	 		 <c:if test="${reservationInfo.rsv_cancledate == null && reservationInfo.flag == 2}" >
	     	        <div style="border: 1px solid #dbdfdf; margin-top: 5%;" class="row box"> 
	        	<div class="col-md-4" style="border: 0px solid blue; padding: 0" align="left" >
	        		<img src="${reservationInfo.roommainimg}" style=" display: block; max-width: 100%; width: 100% \9;height: auto; }"/>
	        	</div>
	     	 
	     	 	<div  class="col-md-8" class="row">
		     	  <div  style="border: 0px solid red; padding: 0; margin-bottom: 3%;" align="right">예약일:${reservationInfo.paydate}</div>
		     	  	<div class="col-md-8" style="border: 0px solid blue;" align="left">	 
					      <div><ul class="list-layout reviews-list"><li class="reviews-list-item"><h4>${reservationInfo.roomname}</h4></li></ul></div>
					      <div><ul class="list-layout reviews-list">
					       	<li class="reviews-list-item">${reservationInfo.roompost}${reservationInfo.roomsido}${reservationInfo.roomsigungu}${reservationInfo.roombname}${reservationInfo.roomdetailaddr} &nbsp;</li>	  
							  <li>예약번호 : ${reservationInfo.rsvcode}&nbsp;</li>
							  <li>${reservationInfo.roomtype_name}&nbsp;</li>
					        </ul>
					       </div>
					  </div> 
					  <div  class="col-md-4" style="border: 0px solid red; margin-bottom: 20%; padding: 0;">
						  <div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
							<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
								<div style="font-size: 8pt; text-align: left;">체크인</div>
								<div style="text-align: left; font-size: 20pt">${reservationInfo.checkInDD}</div>
							</div>
							<div class="col-md-6" style="padding: 0;border-right : 1px dashed gray">
								<ul class="list-layout reviews-list">
							       	<li class="reviews-list-item"><br/></li>	  
									<li>${reservationInfo.checkInYY}년${reservationInfo.checkInMM}월&nbsp;${reservationInfo.checkInDay}</li>
							    </ul>
						    </div>   
						  </div>
						  <div class="col-md-6 row" style="border: 0px solid orange; padding: 0; margin-left: 1px">							 
								<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
									<div style="font-size: 8pt; margin-left:1px;">체크아웃</div>
									<div style="padding-left:3px; font-size: 20pt">${reservationInfo.checkOutDD}</div>
								</div>
								<div class="col-md-6" style= "padding: 0; margin: 0;">
										<ul class="list-layout reviews-list">
									       	<li class="reviews-list-item"><br/></li>	  
											  <li>${reservationInfo.checkOutYY}년${reservationInfo.checkOutMM}월&nbsp;${reservationInfo.checkOutDay}</li>
									    </ul>
							    </div> 					     
						  </div>					   
					  </div>
					  <div style="border: 0px solid blue; margin-bottom : 1%;" align="right">
					  	<a href="<%= ctxPath %>/myReservationDetail.air?userid=${userid}&rsvcode=${reservationInfo.rsvcode}" class="btn btn-primary btn-default">예약 상세 보기</a>
					  </div>  				  
		      </div> 	           	   	       
	        </div> 
	        </c:if>
	     </c:forEach>
	     <!-- for문 끝 --> 
         </div>
	    </div>	
	   <!--  투숙 완료 예약 끝 -->
	<!--  취소 된 예약  -->
		<div id="menu2" class="tab-pane tab-panel"  style="padding:1%; border: 0px solid yellow;">
 			<div class="panel-header" style="margin-top: 3%; border: 1px solid #dbdfdf">
	     	 <h3 class="edit-profile-section-heading">취소된 호텔 예약</h3>
	      </div>


      <div class="panel-body" style="border: 1px solid #dbdfdf;">
         <!--  for 문 시작 -->
         <c:if test="${empty memberResList || memberResList == null || memberResList == ''}"> 현재 취소된 예약이 없습니다</c:if>
	     <c:forEach var="reservationInfo" items="${memberResList}">	    
	  	<c:if test="${reservationInfo.rsv_cancledate != null and reservationInfo.rsv_cancledate !='' }" >
	        <div style="border: 1px solid #dbdfdf; margin-top: 5%;" class="row box">
	        	<div class="col-md-4" style="border: 0px solid blue; padding: 0" align="left" >
	        		<img src="${reservationInfo.roommainimg}" style=" display: block; max-width: 100%; width: 100% \9;height: auto; }"/>
	        	</div>
	     	 
	     	 	<div  class="col-md-8" class="row">
		     	  <div  style="padding: 0; margin-bottom: 3%;" align="right">예약 취소일  : ${reservationInfo.rsv_cancledate}</div>
		     	  	<div class="col-md-8" style="border: 0px solid blue;" align="left">	 
					      <div  style="border: 0px solid blue;"><ul class="list-layout reviews-list"><li class="reviews-list-item"><h4>${reservationInfo.roomname}</h4></li></ul></div>
					      <div  style="border: 0px solid blue;"><ul class="list-layout reviews-list">
					       	<li class="reviews-list-item">${reservationInfo.roomsido}${reservationInfo.roomsigungu}${reservationInfo.roombname}${reservationInfo.roomdetailaddr} &nbsp;</li>	  
							  <li>예약번호 :${reservationInfo.rsvcode}&nbsp;</li>
							  <li>${reservationInfo.roomtype_name}&nbsp;</li>
					        </ul>
					       </div>
					  </div> 
					  <div  class="col-md-4" style="border: 0px solid red; margin-bottom: 20%; padding: 0;">
						  <div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
							<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
								<div style="font-size: 8pt; text-align: left; border: 0px solid blue">체크인</div>
								<div style="border: 0px solid blue; text-align: left; font-size: 20pt">${reservationInfo.checkInDD}</div>
							</div>
							<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0; border-right : 1px dashed gray">
								<ul class="list-layout reviews-list">
							       	<li class="reviews-list-item"><br/></li>	  
									  <li>${reservationInfo.checkOutYY}년${reservationInfo.checkOutMM}월&nbsp;${reservationInfo.checkOutDay}</li>
							    </ul>
						    </div>   
						  </div>
						  <div class="col-md-6 row" style="border: 0px solid orange; padding: 0; margin-left: 1px">
							 
								<div class="col-md-6" style="border: 0px solid blue; padding: 0; margin: 0;">
									<div style="font-size: 8pt; margin-left:1px;">체크아웃</div>
									<div style="padding-left:3px; font-size: 20pt">${reservationInfo.checkOutDD}</div>
								</div>
								<div class="col-md-6" style= "padding: 0; margin: 0;">
										<ul class="list-layout reviews-list">
									       	<li class="reviews-list-item"><br/></li>	  
											  <li>${reservationInfo.checkOutYY}년${reservationInfo.checkOutMM}월&nbsp;${reservationInfo.checkOutDay}</li>
									    </ul>
							    </div> 
							
						     
						  </div>					   
					  </div>
					 <!--  <div style="border: 0px solid blue; margin-bottom : 1%;" align="right"><a href="#" class="btn btn-primary btn-default">예약 상세 보기</a></div>   -->
					  
		      </div>  	       	   	       
	        </div> 	 
	        </c:if>
	        </c:forEach>
	        <!-- for문 끝 -->
         </div>
	    </div>	
	    <!--  취소 된 예약  -->
	   </div>

	</div>
 </div>
</div>

