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
		margin-top:2%;
	}
	.infoDiv{
		margin: 1% 0;
		border-bottom: 1px solid lightgray;
	}
	.mainSubInfo{
		height:100%;
		border-right: 1px solid lightgray;
	}
</style>
<div style="width: 1240px;margin: 1% auto;">
	<div class="row maxWidth" style="margin-top:3%;">
		<div class="col-md-8 noSpace">
			<div  style="height:99px;">
				<div style="font-size:0.8em;">주택의 개인실</div>
				<div id="detailSubject">Sometimesjeju 201호!안전도어락! 통유리오션뷰!제주공항7.8km!</div>
				<div style="line-height:80%;">Jeju-si</div>
			</div>
			<div class="row noSpace" style="width:100%;">
				<div class="col-md-12 noSpace"><img src="<%=request.getContextPath() %>/resources/images/homeDetail/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp"  style="width:100%; overflow:hidden;"/></div>
				<div class="col-md-12 noSpace" style="height:100px; width:100%;padding: 1% 0; box-shadow: 1px 1px 3px lightgray;">
					<div class="col-md-4 mainSubInfo" style="height:100%;">
						<div style="font-size:1.2em;font-weight:bold;"><span style="margin-left:10%;">숙소유형/건물유형</span></div>
					</div>
					<div class="col-md-4 mainSubInfo" style="height:100%;">
						<div style="font-size:1.2em;font-weight:bold;"><span style="margin-left:10%;">최대 수용인원</span></div>
					</div>
					<div class="col-md-4 mainSubInfo" style="height:100%;border:none;">
						<div style="font-size:1.2em;font-weight:bold;width:80%;margin:0 auto;"><span style="margin-left:10%;">방갯수</span></div>
					</div>
				</div>
			</div>
			<div class="check infoDiv">
				<img src="<%=request.getContextPath()%>/resources/images/homeDetail/multiple-users-silhouette.png" />
				<span>침실갯수</span>
				<span>침대갯수</span>
				<span>단독사용욕실갯수</span>
			</div>
			<div class="check infoDiv">
			안녕하세요? 
			이사벨입니다. 
			저희 집 소개를 해드릴게요..
			1. 거리
			제주공항에서 서쪽으로 7.8km 
			2. 형태
			단독주택(농어촌 민박업 신고 영업중)
			3. 침구류
			전부 육지에서 물류로 운반함. 건물 다음으로 비쌈.
			4. 특징
			가. 절대조망권 - 바다가 액자로 들어온 듯함.
			나. 매시간 아니 매 분 아니 매초마다 바다의 모습이 달라짐
			다. 유명 핫플레이스는 아니지 정말 편안한 힐링을 제공
			5. 조식(2018.7월부터 다시 시작합니다-> 유료)
			한정식(집밥) - 8,000원
			6. 기타
			섬타임즈제주는 우리나라 대부분의 포털 사이트에서 홈페이지 검색도 가능합니다
			
			
			이 공간 자세히 알아보기
			</div>
		</div>
		<div class="col-md-4 noSpace">
			<div class="row noSpace" style="width:100%;height:99px;padding-top:5%;">
				<div class="col-md-3 col-md-offset-2 rightborder" style=""><img src="<%=request.getContextPath() %>/resources/images/homeDetail/heart.png" style="width:25px;height:25px;"/><span style="margin-left: 15%">관심</span></div>
				<div class="col-md-3 rightborder"><img src="<%=request.getContextPath() %>/resources/images/homeDetail/connections.png" style="width:25px;height:25px;"/><span style="margin-left: 15%">공유</span></div>
				<div class="col-md-3">등급 : <span> 점</span></div>
			</div>
			<div style="width:100%;padding: 0 3%;">
				<div style="height:380px;border:1px solid lightgray; padding: 5%;">
					<div style="height:60px; border-bottom: 1px solid lightgray;">
						<div style="height:50px;font-size: 24px;font-weight:bold; padding-bottom: 10%;">
							<div>￦가격/박</div>
							<div style="font-size:10px;"><span style="color:#148487;">★★★★★</span>100</div>
						</div>
						<div style="height:240px;padding-top:5%;">
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
