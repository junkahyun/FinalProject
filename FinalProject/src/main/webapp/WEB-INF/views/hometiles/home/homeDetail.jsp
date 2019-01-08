<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 참조 : https://www.airbnb.co.kr/rooms/7331795?guests=1&adults=1&s=6yWJyZHp --%>
<style>
.check{
	border: 1px solid;
}
	.maxWidth{
		width:1240px;
		margin:0;
		padding:0;
	}
	#detailSubject{
		font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif;
	    margin: 0px;
	    word-wrap: break-word;
	    font-size: 26px;
	    font-weight: 800;
	}
	.noSpace{
		padding:0;
		margin:0;
	}
	.rightborder{
		border-right: 1px solid lightgray;
	}
</style>
<div style="width: 1240px;margin: 1% auto;">
	<div class="check row maxWidth">
		<div class="col-md-8 noSpace">
			<div  style="height:99px;">
				<div style="font-size:0.8em;">주택의 개인실</div>
				<div id="detailSubject">Sometimesjeju 201호!안전도어락! 통유리오션뷰!제주공항7.8km!</div>
				<div style="line-height:80%;">Jeju-si</div>
			</div>
			<div class="row noSpace" style="width:100%;">
				<div class="col-md-10 noSpace"><img src="<%=request.getContextPath() %>/resources/images/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp"  style="width:100%; overflow:hidden;"/></div>
				<div class="col-md-2 check" style="height:100%;"></div>
				<div class="col-md-12 noSpace" style="height:125px; width:100%;">
					<div class="col-md-4" style="height:100%;"></div>
					<div class="col-md-4" style="height:100%;"></div>
					<div class="col-md-4" style="height:100%;"></div>
				</div>
			</div>
			<div>
			</div>
		</div>
		<div class="col-md-4 noSpace">
			<div class="row noSpace" style="width:100%;height:99px;padding-top:5%;">
				<div class="col-md-3 col-md-offset-2 rightborder" style=""><img src="<%=request.getContextPath() %>/resources/images/heart.png" style="width:25px;height:25px;"/><span style="margin-left: 15%">관심</span></div>
				<div class="col-md-3 rightborder"><img src="<%=request.getContextPath() %>/resources/images/connections.png" style="width:25px;height:25px;"/><span style="margin-left: 15%">공유</span></div>
				<div class="col-md-3">등급 : <span> 점</span></div>
			</div>
			<div class="check" style="width:100%;">
				<div class="check"></div>
				<div class="check"></div>
			</div>
		</div>
	</div>
</div>
