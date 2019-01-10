<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.hostPageBody{
	margin-right: 18%; 
	width: 63%;
}
.goBackLink{
	margin-top: 2%;	
}
.backPageFont{
	font-size: large;
	font-weight: bold;
	color: #008489;
	vertical-align: middle;
	
}
.hoverFont:hover{
	font-size: large;
	font-weight: bold;
	color: #008489;
	vertical-align: middle;
	text-decoration: underline;
	cursor: pointer;
}

.f-title{
	font-weight: bold;
}
.s-title{
	font-weight: bold;
}

.btn{
	font-size: 12pt; background-color: #008489; border: 1px solid #008489;
	color: white;
}

.cover{
	margin-top: 5%;	
}

.imgContent{
	margin-top: 2%;
}

.imgList>img{
	display: block;
}

</style>
<script>
	$(document).ready(function(){
		$(".sampleimg").bind("click",function(){
			$(".showedImg").attr("src", $(this).attr("src"));
		});
	});

</script>

<div class="container hostPageBody">
	<div class="col-md-12 goBackLink">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/back.png">
		<span class="backPageFont hoverFont">전문 홍보 페이지로 돌아가기</span>
	</div>

	<div class="col-md-12">
		<h3 class="f-title">전문 홍보 페이지 수정하기</h3>
		<h5>숙소의 개성이 게스트에게 잘 드러나도록 전문 홍보 페이지를 호스트님의 숙소에 맞게 바꿔보세요.</h5>
		<br>
		<p class="s-title">로고를 넣으세요</p>
		<p>전문 홍보 페이지의 프로필 사진이 로고로 대체됩니다.</p>
	</div>
	
	<div class="col-md-12 logoBtn">
		<button type="button" class="btn">로고 추가</button>
	</div>
	
	<div class="col-md-12 cover">
		<p class="s-title">커버 사진을 수정하세요.</p>
		<p>호스트님의 숙소에서 지내는 모습을 게스트가 상상할 수 있도록 해주세요.</p>
	</div>
	
	<div class="col-md-12 cover">
		<img class="showedImg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg">		
	</div>
	
	<div class="col-md-12 imgContent">
		<button type="button" class="btn">커버 사진 추가</button>
		<br>
		<p>갖고 있는 사진을 사용하고 싶지 않다면 저희가 제공하는 사진 중에서 선택하세요.</p>
	</div>
	<div class="row">
		<div class="col-md-12 imgList">
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleroom1.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			
		</div>
		
		<div class="col-md-12 imgList">
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			<img class="col-md-3 sampleimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg" >
			
		</div>
	</div>
	
</div>