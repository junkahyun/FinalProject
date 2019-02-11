<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>
$(document).ready(function(){
	var today = new Date();
	var income = [];
	for(var i=0;i<12;i++){
		var monthlyIncome = $("#month"+i+"").val();
		var title = "20"+today.getYear().toString().substring(1,3)+"년 수입현황";
		income.push(parseInt(monthlyIncome));	
	}
	var chart = Highcharts.chart('container', {
	    title: {
	        text: title
	    },
	    subtitle: {
	        text: 'Plain'
	    },
	    xAxis: {
	        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	    },
	    series: [{
	        type: 'column',
	        colorByPoint: true,
	        data: income,
	        showInLegend: false
	    }]
	});
});
</script>
<div style="width:1280px;margin:0 auto;">
	<c:forEach items="${income }" var="income" varStatus="status">
		<input type="hidden" id="month${status.index }" value="${income.sumTotalPrice }">
	</c:forEach>
	<h2 style="font-weight:bold;color:#4f4f4f;">알림판</h2>
	<div class="row" style="padding:0;width:100%;margin-top:5%;border-bottom: 1px dotted lightgray;">
		<div class="col-md-9">
			<%-- <c:if test="${ }"> --%>
			<div id="container" style="height: 400px;margin-bottom: 3%;"></div>
			<%-- </c:if> --%>
		</div>
		<div class="col-md-3" style="width: 250px;margin: 100px 2%;">
			<c:set var="thisMonthIncome" value="${thisMonthIcome }" />
			<c:set var="fees" value="${Math.round(thisMonthIcome*0.3) }" />
			<c:set var="thisMonthSum" value="${thisMonthIncome-fees }" />
			<div style="margin: 2% 0;"><b>이번달 수입 : <span style="text-align:right;"><fmt:formatNumber pattern="#,###" value="${thisMonthIncome }" />won</span></b></div>
			<div style="margin: 2% 0;"><b>수수료 : <fmt:formatNumber pattern="#,###" value="${fees }" />won</b></div>
			<div style="border-top: 4px double #efefef; padding-top: 3%;"><b>순 수익 : <fmt:formatNumber pattern="#,###" value="${thisMonthSum }" />won</b></div>
		</div>
	</div>
	<div class="row" style="padding:0;">
		<div class="col-md-9 card" style="margin-top:3%;padding:0;">
			<div style="width:100%; box-shadow: 3px 3px lightgray;border: 1px solid #efefef;">
				<div style="padding: 1%; font-size:1.5em;height:50px;font-weight:bold; color:gray;border-bottom: 4px double #efefef;">
					New Reservation
					<img src="<%=request.getContextPath()%>/resources/images/cancel.png" style="position:absolute;width:28px;height:28px; right: 10px; cursor: pointer;" onClick="" />
				</div>
				<div class="row" style="padding:0;margin: 5px 1%;height:250px;">
					<div class="col-md-8" style="padding: 3%;">
						<div>rsv.roomcode</div>
						<div>rsv.예약자명</div>
						<div>rsv.예약자연락처</div>
						<div>rsv.성인인원</div>
						<div>rsv.유아인원</div>
						<div>rsv.체크인날짜</div>
						<div>rsv.체크아웃날짜</div>
						<div>rsv.결제날짜 및 결제 요금</div>
						<div>rsv.메세지</div>
					</div>
					<div class="col-md-4" style="padding:0;border: 1px solid;"><img src="" style="height:240px;width:100%;"></div>
				</div>
			</div>
		</div>
	</div>
</div>