
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


</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	chart();
});
function chart(){
	$.ajax({
		
	
	Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: null,
		    plotShadow: false,
		    type: 'pie'
		  },
		  title: {
		    text: 'Browser market shares in January, 2018'
		  },
		  tooltip: {
		    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		  },
		  plotOptions: {
		    pie: {
		      allowPointSelect: true,
		      cursor: 'pointer',
		      dataLabels: {
		        enabled: true,
		        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		        style: {
		          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		        }
		      }
		    }
		  },
		  series: [{
		    name: 'Brands',
		    colorByPoint: true,
		    data: [{
		      name: 'Chrome',
		      y: 61.41,
		      sliced: true,
		      selected: true
		    }, {
		      name: 'Internet Explorer',
		      y: 11.84
		    }, {
		      name: 'Firefox',
		      y: 10.85
		    }, {
		      name: 'Edge',
		      y: 4.67
		    }, {
		      name: 'Safari',
		      y: 4.18
		    }, {
		      name: 'Sogou Explorer',
		      y: 1.64
		    }, {
		      name: 'Opera',
		      y: 1.6
		    }, {
		      name: 'QQ',
		      y: 1.2
		    }, {
		      name: 'Other',
		      y: 2.61
		    }]
		  }]
		});
	});//end of ajax
}// end of function
</script>
<div class="col-md-1"></div>
<div class="col-md-9">
	<div class="_uy08umt">
		<div style="margin: 0px;"><div class="_11rakzh" style="margin-top: 48px;">
			<div role="tablist" class="_csc5ey">
				<div><a href="/progress/ratings" class="_1somn25j" role="tab" aria-selected="true" aria-busy="false">평점</a></div>
				<div><a href="/progress/earnings" class="_1clmh92x" role="tab" aria-selected="false" aria-busy="false">수입</a></div>
				<div><a href="/progress/views" class="_1clmh92x" role="tab" aria-selected="false" aria-busy="false">조회수</a></div>
				<div><a href="/progress/opportunities" class="_1clmh92x" role="tab" aria-selected="false" aria-busy="false">발전 기회</a></div>
			</div>
		<div style="margin-top: 48px;">
			<div class="row">
				<div class="col-lg-8">
				
					<div style="margin-bottom: 0px;">
						<div class="_9hxttoo">
							<div style="margin-bottom: 8px;">
								<label class="_rin72m" for="listingSelector"><div class="_6mxuijo">숙소 선택</div></label>
							</div>
							<div class="_wlf6154"><div class="_y9ev9r">
								<select id="listingSelector" name="selected_listing" class="_bwyiq2l">
									<option value="all">모든 숙소</option><option value="31077617">ㄴㅇㄹ</option>
									<option value="31027844">ㄴㅇㄹ (미등록)</option>
								</select>
							</div>
								<span class="_1idvclr">
									<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">
										<path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z" fill-rule="evenodd"></path>
									</svg>
								</span>
							</div>
						</div>
					</div>
	
				<header class="_15lzjb6">
					<div class="_1rlifxji">
						<div style="margin-bottom: 8px;">
							<div class="_19odbsb1">표시할 내용이 없습니다</div>
								<div class="_1r804a6o">첫 번째 후기를 참고해 숙소를 재단장하거나 <a href="/rooms">숙소를 업데이트</a>해서 게스트의 관심을 끌어보세요.</div>
						</div>
					</div>
				</header>
				<div class="_1p75mxn1"><div class="_1dl27thl">평점 (0개)</div></div>
					<div style="margin-top: 32px;">
				</div>
	차트 보여질곳
					<div style="margin-top: 40px;"><div class="_1p75mxn1"><div class="_1dl27thl">후기(0개)</div></div>
						<div style="margin-top: 32px; margin-bottom: 32px;">
							<div>
								<div class="_9hxttoo"><div style="margin-bottom: 8px;"><label class="_rin72m" for="reviewRatingFilter"><div class="_6mxuijo">전체 평점으로 필터링</div></label></div>
									<div class="_wlf6154"><div class="_y9ev9r">
										<select id="reviewRatingFilter" name="review_rating_filter" class="_bwyiq2l">
											<option value="all">평점이 있는 숙소</option>
											<option value="5">별 5개</option>
											<option value="4">별 4개</option>
											<option value="3">별 3개</option>
											<option value="2">별 2개</option>
											<option value="1">별 1개</option>
										</select>
										</div>
										<span class="_1idvclr"><svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);"><path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z" fill-rule="evenodd"></path></svg></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="row"><div class="col-lg-8"></div></div>
		<div class="row">
			<div class="col-lg-8">
				<div style="margin-top: 24px;">
					<table class="_1cap30x">
						<tbody>
							<tr>
								<th class="_282le74"><div class="_9zwlhy1">0 / 0</div></th>
									<td class="_1attqu0p"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div></div></div>
	</div>
</div>