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
	#rsvBtn{
		width: 90%;
		margin-left:5%;
		border: none;
		height: 40px;
		background-color: #fd5a61;
		color: white;
		font-weight:bold;
		margin-top: 10%;
		border-radius: 5px;
	}
	.DetailsInput{
		border: 1px solid lightgray;
		height: 40px;
		border-radius: 3px;
		width:90%;
		margin-left:5%;
	}
</style>
<div style="width: 1240px;margin: 1% auto;">
	<div class="row maxWidth">
		<div class="col-md-8 noSpace">
			<div  style="height:99px;">
				<div style="font-size:0.8em;">주택의 개인실</div>
				<div id="detailSubject">Sometimesjeju 201호!안전도어락! 통유리오션뷰!제주공항7.8km!</div>
				<div style="line-height:80%;">Jeju-si</div>
			</div>
			<div class="row noSpace" style="width:100%;">
				<div class="col-md-10 noSpace"><img src="<%=request.getContextPath() %>/resources/images/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp"  style="width:100%; overflow:hidden;"/></div>
				<div class="col-md-2 check" style="height:100%;"></div>
				<div class="col-md-12 noSpace check" style="height:125px; width:100%;">
					<div class="col-md-4 check" style="height:100%;"></div>
					<div class="col-md-4 check" style="height:100%;"></div>
					<div class="col-md-4 check" style="height:100%;"></div>
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
			<div style="width:100%;padding: 0 3%;">
				<div style="height:400px;border:1px solid lightgray; padding: 5%;">
					<div style="height:60px; border-bottom: 1px solid lightgray;">
						<div style="height:50px;margin-top:2%;font-size: 24px;font-weight:bold; padding-bottom: 5%;">
							<div>￦가격/박</div>
							<div style="font-size:10px;"><span style="color:#148487;">★★★★★</span>100</div>
						</div>
						<div style="height:240px;margin-top:3%;border-bottom: 1px solid lightgray;">
							<div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">날짜</div>
							<div class="DetailsInput"></div>
							<div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">인원</div>
							<div class="DetailsInput"></div>
							<button type="button" id="rsvBtn">예약하기</button>
							<div style="text-align:center; font-size:0.9em; font-weight:bold; margin-top: 2%;">예약 확정전에는 요금이 청구되지 않습니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
