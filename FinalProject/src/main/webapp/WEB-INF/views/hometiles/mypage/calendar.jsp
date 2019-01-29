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
			var url ="/couponReg.hometiles"
			window.open("","쿠폰등록","width=400,height=300",true);
		   var frm = couponRegFrm.document;
			frm.method = "POST";
		    frm.action = url;
		    frm.idx.value = idx
		    frm.target = "쿠폰등록";
		   // frm.submit();
			
		});
	});
</script>

<div class="row firstDIV" style="border: 0px soild red;">
<!--  사이드바 -->
	<div class="col-md-1" style="border: 0px solid red"></div>
    <div class="col-md-3">
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
    <div class="col-md-6">
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
	    <div id="home" class="tab-pane fade in active" style="padding:1%;">

	    <table>
			<colgroup>
				<col width="30%">
				<col width="20%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<thead>
				<tr>
					<th class="first couponTop" scope="col">
						<input type="checkbox" style="float: left;"/>
						<span style="font-size: 9pt; float:left;">전체선택</span>
						쿠폰
					</th>
					<th class="couponTop" scope="col">할인대상</th>
					<th class="couponTop" scope="col">유효기간</th>
				</tr>
			</thead>

			<tbody>
				<tr class="first">
						<td class="first">
							<div class="ticket_cup">
								<input type="checkbox" style="float: left;" /><span>할인쿠폰이름</span>
							</div>
						</td>
						<td>할인대상보기</td>
						<td>
							2019-01-09 ~ 2019-01-14
						</td>
					</tr>
			</tbody>
		</table>	    
      </div> 
	<!--  보유쿠폰 목록 -->	
	<div class="_1svux14" data-visible="true" style="padding: 0px 13px;"><div class="_gucugi">
		<strong>2019년 1월</strong></div><table class="_p5jgym" role="presentation"><tbody><tr><td></td><td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 1일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">1</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 2일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">2</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="목요일, 2019년 1월 3일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">3</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="금요일, 2019년 1월 4일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">4</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="토요일, 2019년 1월 5일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">5</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="일요일, 2019년 1월 6일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">6</div></div></div></div></td></tr><tr><td class="_z39f86g" role="button" aria-label="월요일, 2019년 1월 7일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">7</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 8일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">8</div></div></div></div></td><td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 9일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">9</div></div></div></div></td><td class="_12fun97" role="button" aria-label="목요일, 2019년 1월 10일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">10</div></div></div></div></td><td class="_12fun97" role="button" aria-label="금요일, 2019년 1월 11일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">11</div></div></div></div></td><td class="_12fun97" role="button" aria-label="선택한 날짜: 토요일, 2019년 1월 12일" tabindex="0" style="width: 40px; height: 39px; background: rgb(0, 132, 137); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1jzaz72b">12</div></div></div></div></td><td class="_12fun97" role="button" aria-label="일요일, 2019년 1월 13일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(0, 132, 137); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1jzaz72b">13</div></div></div></div></td></tr><tr><td class="_12fun97" role="button" aria-label="선택한 날짜: 월요일, 2019년 1월 14일" tabindex="-1" style="width: 40px; height: 39px; background: rgb(0, 132, 137); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1jzaz72b">14</div></div></div></div></td><td class="_12fun97" role="button" aria-label="화요일, 2019년 1월 15일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">15</div></div></div></div></td><td class="_12fun97" role="button" aria-label="수요일, 2019년 1월 16일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">16</div></div></div></div></td><td class="_12fun97" role="button" aria-label="목요일, 2019년 1월 17일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">17</div></div></div></div></td><td class="_12fun97" role="button" aria-label="금요일, 2019년 1월 18일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">18</div></div></div></div></td><td class="_12fun97" role="button" aria-label="토요일, 2019년 1월 19일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">19</div></div></div></div></td><td class="_12fun97" role="button" aria-label="일요일, 2019년 1월 20일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">20</div></div></div></div></td></tr><tr><td class="_12fun97" role="button" aria-label="월요일, 2019년 1월 21일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">21</div></div></div></div></td><td class="_12fun97" role="button" aria-label="화요일, 2019년 1월 22일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">22</div></div></div></div></td><td class="_12fun97" role="button" aria-label="수요일, 2019년 1월 23일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">23</div></div></div></div></td><td class="_12fun97" role="button" aria-label="목요일, 2019년 1월 24일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">24</div></div></div></div></td><td class="_12fun97" role="button" aria-label="금요일, 2019년 1월 25일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">25</div></div></div></div></td><td class="_12fun97" role="button" aria-label="토요일, 2019년 1월 26일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">26</div></div></div></div></td><td class="_12fun97" role="button" aria-label="일요일, 2019년 1월 27일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">27</div></div></div></div></td></tr><tr><td class="_12fun97" role="button" aria-label="월요일, 2019년 1월 28일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">28</div></div></div></div></td><td class="_12fun97" role="button" aria-label="화요일, 2019년 1월 29일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">29</div></div></div></div></td><td class="_12fun97" role="button" aria-label="수요일, 2019년 1월 30일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">30</div></div></div></div></td><td class="_12fun97" role="button" aria-label="목요일, 2019년 1월 31일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">31</div></div></div></div></td><td></td><td></td><td></td></tr></tbody></table></div>

<form name="couponRegFrm"><input type="text" name="userid" value="회원아이디넣는칸"/></form>
	  </div>
	</div>
 </div>
</div>




