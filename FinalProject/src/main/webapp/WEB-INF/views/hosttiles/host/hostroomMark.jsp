<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />

<style data-aphrodite="data-aphrodite">
._1k01n3v1 {
	color: #008489 !important;
	font: inherit !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	text-decoration: none !important;
	-webkit-appearance: none !important;
	-moz-appearance: none !important;
	appearance: none !important;
	background: transparent !important;
	border: 1px !important;
	cursor: pointer !important;
	margin: 1px !important;
	padding: 1px !important;
	-webkit-user-select: auto !important;
	-moz-user-select: auto !important;
	-ms-user-select: auto !important;
	user-select: auto !important;
	text-align: left !important;
}

._1k01n3v1:hover {
	text-decoration: underline !important;
	color: #008489 !important;
}

._1k01n3v1:focus {
	text-decoration: underline !important;
}

@
supports (--custom: properties ){ .
	_1k01n3v1 {color: var(- -color-text-link, #008489) !important;
	font-family: var(- -font-font_family, Circular, -apple-system,
		BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif) !important;
}

._1k01n3v1:hover {
	color: var(- -color-text-link-hover, #008489) !important;
}

._1k01n3v1:active {
	color: var(- -color-text-link-active, #006C70) !important;
}

}
._1k01n3v1:active {
	color: #006C70 !important;
	outline: 1px !important;
}
</style>

<style type="text/css"> 


.reviewlist{
   width: 100%;
   border: 1px solid #d3d3d3;
}
</style> 
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#charts").hide();
	
	$("#listingSelector").change(function(){
		if($("#listingSelector").val() == "all"){
			
			$("#charts").hide();
			$("._15lzjb6").show();
			
		} else{
			
			$("#charts").show();
			$("._15lzjb6").hide();
			
			chart();
		}
	});
	
	
});

function chart(){
	var form_data = {roomcode:$("#listingSelector").val()};
	
	//console.log(form_data);
	$.ajax({
		url:"rankShowJSON.air",
		data:form_data,
		type:"POST",
		dataType:"JSON",
		success:function(json){

			var resultArr = [];
			var totalCount = 0;
			for(var i=0; i<json.length; i++) {
				var subArr = [Number(json[i].gradeCount)];
				totalCount += Number(json[i].gradeCount);
				resultArr.push(subArr); // 배열속에 값을 넣기
			}
			
			console.log(totalCount);
			
			$("#PointCount").empty();
			var html = "<h5 id='PointCount'>평점 ("+totalCount+"개)</h5>"
			$("#PointCount").empty().html(html);
			
			Highcharts.chart('charts', {
				  chart: {
				    type: 'bar'
				  },
				  title: {
				    text: '숙소 이름'
				  },
				  xAxis: {
				    categories: ['평점1점','평점2점','평점3점','평점4점','평점5점']
				  },
				  yAxis: {
				    min: 0,
				    title: {
				      text: 'Total Point consumption'
				    }
				  },
				  tooltip: {
				    pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}   </b> ({point.percentage:.0f}%)<br/>',
				    shared: true
				  },
				  plotOptions: {
				    series: {
				      stacking: 'normal'
				    }
				  },
				  series: [{
				    name: json.roomname,
				    data: resultArr
				  }]
				});
		},
		error:function(){
			
		}
	}); 
	
	
	
}

function showreview() {
	var frm = document.selectRoomcode;
	frm.action = "showreview.air";
	frm.method = "GET";
	frm.submit();
}
</script>
<div class="container" style="width: 100%;">
	<div class="col-md-2"></div>
	<div class="col-md-8" style="margin-bottom: 10%; margin-top: 5%;">
		<div class="_uy08umt">
			<div id="dashboard-content">
				<div class="container" style="float: left; width: 70%">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#avgScore">평점</a></li>
						<li><a data-toggle="tab" href="#income">수입</a></li>
						<li><a data-toggle="tab" href="#hits">조회수</a></li>
					</ul>
				</div>
				<!-- 평점 시작 -->
				<div class="tab-content " style="padding: 3%;">
					<div class="tab-pane tab-panel active" id="avgScore">
						<div style="margin-top: 5%;">

							<div class="row">
								<div class="col-lg-8">
									<div style="margin-bottom: 1px;">
										<div class="_9hxttoo" style="border: 0px solid red;">
											<div style="margin-bottom: 8px;">
												<label class="_rin72m" for="listingSelector">
												<div class="_6mxuijo" style="border: 0px solid #008489;">숙소 선택</div></label>
											</div>
											<div style="border: margin-bottom: 5%; padding: 0;">
												<div style="margin: 0; border: 0px solid red; padding: 0;">
												<form name="selectRoomcode">
													<select id="listingSelector" name="selected_listing"
														class="_bwyiq2l">
														<option value="all">숙소 선택</option>
														<c:forEach var="room" items="${roomList}">
															<option value="${room.roomcode}">${room.roomName}</option>
														</c:forEach>
													</select>
												</form>
												</div>
											</div>
										</div>
									</div>
									<!--  표시할 내용이 없을떄 나타나야함 -->
									<div class="_15lzjb6">
										<div class="_1rlifxji">
											<div style="margin: 5%;">
												<div class="_19odbsb1">표시할 내용이 없습니다</div>
												<div class="_1r804a6o">
													첫 번째 후기를 참고해 숙소를 재단장하거나 <a href="/rooms">숙소를 업데이트</a>해서
													게스트의 관심을 끌어보세요.
												</div>
											</div>
										</div>
									</div>
									<!--  표시할 내용이 없을떄 나타나야함  끝-->
									<div class="_1dl27thl" style="margin-top: 10%;">
										<h5 id="PointCount">평점 (0개)</h5>
									</div>

									<!--  차트 시작 -->
									<div id="charts"
										style="border: 0px soild red; min-width: 310px; height: 70%; max-width: 80%; margin: 0 auto"></div>
									<!--  차트 끝 -->

									<div class="_1p75mxn1"
										style="border: 0px solid red; margin-top: 10%;">
										<div class="_1dl27thl" style="border: 0px solid red">
											<h5>후기(0개)</h5>
											  <div id="reviewArea" class="noSpace">
									          
								               <div class="row noSpace homeDetailComment">
								                  <div class="col-md-1">
								                     <div style="border: 1px solid none; width:50px;height:50px;border-radius:25px;overflow:hidden;"><img src="https://a0.muscache.com/im/pictures/user/853aa97c-2314-4993-88ef-75b05a3674a9.jpg?aki_policy=profile_x_medium" style="width:50px;height:50px;"></div>
								                  </div>
								                  <div class="col-md-10" style="padding-top:0.5%;"><div style="font-weight:bold;">${review.fk_userid }</div><div>${review.review_writedate }</div></div>
								                  <div class="col-md-1">icon</div>
								                  <div class="col-md-12" style="margin-top:2%;">${review.review_content }</div>
								               </div>
									            
									             
								               <c:if test="${room.reviewList.size() < 1 }">
								               	<div class="row noSpace homeDetailComment" style="margin-left: 5%;text-align:center; margin-bottom:5%;font-weight:bold;">아직 등록된 Review가 없습니다.</div>
								               </c:if>
								               <%-- 후기 페이지바 --%>
								               <div class="row" style="margin:3%;">${pagebar}</div>
								               <c:if test="${room.reviewList.size() > 0 }">
								               	<div class="row" style="margin:3%;">${pagebar}</div>
								               </c:if>
									         </div>
										</div>
										<div style="margin-top: 32px; margin-bottom: 32px;">
											<div class="_9hxttoo">
												<div style="margin-bottom: 8px;">
													<label class="_rin72m" for="reviewRatingFilter">
														<div class="_6mxuijo">전체 평점으로 필터링</div>
													</label>
												</div>
												<div class="_wlf6154">
													<div class="_y9ev9r">
														<select id="reviewRatingFilter"
															name="review_rating_filter" class="_bwyiq2l">
															<option value="all">평점이 있는 숙소</option>
															<option value="5">별 5개</option>
															<option value="4">별 4개</option>
															<option value="3">별 3개</option>
															<option value="2">별 2개</option>
															<option value="1">별 1개</option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="container"
								style="margin: 0; border: 0px solid blue; padding: 0;">
								<div>
									<h5>평점에 해당하는 숙소리스트 보여주는 리스트</h5>
									<ul class="list-group">
										<li class="list-group-item reviewlist" style="width: 53%;">숙소이름
											리스트 <span class="badge">평점</span>
										</li>
										<li class="list-group-item reviewlist" style="width: 53%;">Deleted
											<span class="badge">5</span>
										</li>
										<li class="list-group-item reviewlist" style="width: 53%;">Warnings
											<span class="badge">3</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- 평점 끝 -->
					<!-- 수입 시작 -->
					<div class="tab-pane tab-panel" id="income">수입 내용 넣기</div>
					<!-- 수입 끝 -->
					<!-- 조회수 시작 -->
					<div class="tab-pane tab-panel" id="hits">조회수 넣기ㅣ</div>
					<!-- 조회수 끝 -->
				</div>
			</div>
		</div>
	</div>

</div>