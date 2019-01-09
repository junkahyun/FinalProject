<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>

<title>예약 관리</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />
          <style data-aphrodite="data-aphrodite">._1k01n3v1{color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;}._1k01n3v1:hover{text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;}._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
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
}
tr > td {
border: 1px solid #b7b7b7;
text-align: center;
}
</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
	
</script>
</head>
<body>

<div class="row" style="border: 1px soild red;">
<!--  사이드바 -->
<div class="col-md-1" style="border: 1px solid red"></div>
    <div class="col-md-2" style="margin-top:5%; border: 0px solid red;">
	      <div class="sidenav" align="center">
			  <ul class="sidenav-list">
			    <li>
			      <a href="https://www.airbnb.co.kr/users/edit/231754930" aria-selected="false" class="sidenav-item"><h4>프로필 수정</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item"><h4>후기</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item"><h4>예약 관리</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="true" class="sidenav-item"><h4>나의 쿠폰</h4></a>
			    </li>
			  </ul>
		 </div>	
	  </div>
<!--  사이드바끝 -->  
    <div class="col-md-6" style="margin: 2%">
     <div style="margin-bottom: 6%; margin-top: 5%; padding:2%; border: 1px solid #dbdfdf;" >
		<h3>상품할인쿠폰</h3>
		<p>할인쿠폰 등록하기</p><p>고객님이 받으신 e-mail 이나 오프라인에서 지급받으신 쿠폰 번호를 입력하시면, 할인쿠폰을 지급해 드립니다.</p>
		<input type="text" style="width: 40%" placeholder="쿠폰번호입력"/><a href="#">할인쿠폰등록하기</a>
	</div>	
      <div id="dashboard-content">
   
<!--  상단 바 -->
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">보유쿠폰</a></li>
	    <li><a data-toggle="tab" href="#menu1">사용내역</a></li>
	  </ul>
<!--  상단 바 -->

	  <div class="tab-content">
	    
<!--  보유쿠폰 목록 -->	
	    <div id="home" class="tab-pane fade in active" style="padding:1%;">

	    <table>
			<colgroup>
				<col width="178px">
				<col width="">
				<col width="118px">
				<col width="168px">
			</colgroup>
			<thead>
				<tr>
					<th class="first couponTop" scope="col">쿠폰종류</th>
					<th class="couponTop" scope="col">쿠폰정보</th>
					<th class="couponTop" scope="col">할인대상</th>
					<th class="couponTop" scope="col">유효기간</th>
				</tr>
			</thead>

			<tbody>
				<tr class="first">
						<td class="first">
							<div class="ticket_cup">
								<p>할인쿠폰이름</p>
							</div>
						</td>
						<td>  
							<div class="myt_ico_wrap alignL"><span class="myt_ico myt_ico7">앱전용</span></div> 
							<p class="fnt_1 alignL">[모바일앱전용]20%할인</p>
							<p class="fnt_12 alignL">[3227631486] 15,000원 이상 구매 <span class="bLine">|</span> 최대 5,000원 할인</p>
						</td>
						<td><p href="#" class="fnt_4"><a href="javascript:onApplyObjCupnNo('3227631486','2445528191');">할인대상보기</a></p></td>
						<td>
							<p>2019-01-09 ~ 2019-01-14</p>
						</td>
					</tr>
			</tbody>
		</table>	    
      </div> 
	<!--  보유쿠폰 목록 -->	
	<!-- 사용한 쿠폰 리스트 -->
	    <div id="menu1" class="tab-pane tab-panel"  style="padding:1%; border: 0px solid yellow;">
	     <table>
			<colgroup>
				<col width="178px">
				<col width="">
				<col width="118px">
				<col width="168px">
			</colgroup>
			<thead>
				<tr>
					<th class="first couponTop" scope="col">쿠폰종류</th>
					<th class="couponTop" scope="col">쿠폰정보</th>
					<th class="couponTop" scope="col">할인대상</th>
					<th class="couponTop" scope="col">사용기간</th>
				</tr>
			</thead>

			<tbody>
					<tr class="first">
							<td class="first">
								<div class="ticket_cup">
									<p>할인쿠폰이름</p>
								</div>
							</td>
							<td>  
								<div class="myt_ico_wrap alignL"><span class="myt_ico myt_ico7">앱전용</span></div> 
								<p class="fnt_1 alignL">[모바일앱전용]20%할인</p>
								<p class="fnt_12 alignL">[3227631486] 15,000원 이상 구매 <span class="bLine">|</span> 최대 5,000원 할인</p>
							</td>
							<td><p href="#" class="fnt_4"><a href="javascript:onApplyObjCupnNo('3227631486','2445528191');">할인대상보기</a></p></td>
							<td>
								<p>2019-01-09 ~ 2019-01-14</p>
							</td>
						</tr>					
						
			</tbody>
		</table>
		
	    </div>	
	<!-- 사용한 쿠폰 리스트 -->

	  </div>
	</div>
 </div>
</div>


</body>
</html>
