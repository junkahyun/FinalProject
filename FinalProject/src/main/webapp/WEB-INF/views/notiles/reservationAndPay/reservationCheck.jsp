<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
 <script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">


h2,h3{font-weight: bold;
      
     }
h3{font-size: 14pt;
}

#plusRole{-webkit-font-smoothing: antialiased;
}

.chekdate{padding: 5%; 
          margin-left: 30%;
} 
.rev{font-size: 12pt;
    }
    
.btn{background-color: #008489;
    
     font-size: 14pt; 
     padding: 1.5%;}
.date{background-color: #e5e5e5; 
      padding: 3%;
      font-weight: bold;
     }
.img{border: 1px solid gray;
     padding: 1%;
     margin-bottom: 2%;
}
.panel-body{padding: 2%;
}


.pluscontext {font-size: 12pt; 
             font-weight: bold; 
             color: #008489; 
             cursor: pointer;
}
.minuscontext{font-size: 12pt; 
             font-weight: bold; 
             color: #008489; 
             cursor: pointer;
}
.fa-chevron-down{font-size: 0.8em; 
     color: #008489;
}
.fa-check{font-size: 0.8em; 
          color: #008489;
}
.fa-border{color: Tomato; 
        padding: 3%; 
        margin-bottom: 2%;
}
.pluscontext:hover{ text-decoration: underline;
}

.minuscontext:hover{ text-decoration: underline;
}
.hostpanel{margin-top: 5%;
}
.fa-arrow-right{padding-left: 3%; 
                padding-right: 3%;
}
.fa-question-circle:hover{cursor: pointer;
                           color: #008489;
}
.price{font-size: 12pt;
}
.memberinfo{font-size: 12pt;
}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$(".minus").hide();
		$("#plusRole").hide();
		
		$(".plus").click(function(){
			$(".minus").show();
			$("#plusRole").show();
			$(".plus").hide();
			
		});//end of $(".plus").click---------
		
		$(".minus").click(function(){
			$(".plus").show();
			$("#plusRole").hide();
			$(".minus").hide();
			
		});//end of $(".minus").click--------
		
		$("[data-toggle='popover']").popover();
		
		$("#btnsubmit").click(function(){
			
			gonextCheck();
			
		});
		
	});//end of $(document).ready------------


	function gonextCheck(){
		location.href="<%=ctxPath%>/reservationCheckPeople.air";
	}

</script>
</head>
<body>

<div class="container-fluid">
  <div class="row" style="margin-top: 0.6%; ">
    	<div class="col-sm-1" style="margin-top: 0.7%; margin-left: 1%;"><img src="<%=ctxPath %>/resources/images/airLogo.png" style="width: 30px; cursor: pointer;" /></div>
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 > </span> 2. 게스트 정보 입력 > 3. 확인 및 결제  >  4. 예약완료</div>
  </div>
</div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
	<div class="col-md-7" style="margin-top: 3%;">
		<h2 >숙소이용규칙 확인하기</h2>
		<br>
		
		
		<div class="panel panel-default" style="font-size: 12pt; ">
			<div class="panel-body">
				<div class="col-md-1" ><img src="<%=ctxPath %>/resources/images/아이콘.gif" style="width: 55px;"/></div>
				<div class="col-md-10" style="margin-left: 2%; margin-top: 1%;">
				      숙소 예약이 곧 마감될 수 있습니다.여행 트렌드를 분석해 보면, 조회하시는 기간 중 
				   1박 이상의 예약이 곧 마감될 수 있습니다.
			    </div>
			</div>
		</div>
		<br>
		<!-- 숙박지역, 숙박일수  -->
		<h3 >방콕 3박</h3>
		<br>
		<div class="col-md-5 rev" >
			<div class="col-md-3 date" align="center">월<br>일</div>
			<div class="chekdate">체크인:요일 <br>
			${roomList.checkintime}시 이후</div>
		</div>
		<div class="col-md-2 rev" style="padding: 5%;"></div>
		<div class="col-md-5 rev" style="margin-bottom: 10%;">
			<div class="col-md-3 date"  align="center">월<br>일</div>
			<div class="chekdate">체크아웃:요일 <br>
			 ${roomList.checkouttime}시 
			</div>
		</div>
		<hr>
		<!-- 주의할사항  -->
		<h3>주의할 사항</h3>
		<br>
		<div style="background-color: #fff7e6; border-top: 1px solid #ffad33; border-bottom: 1px solid #ffad33; padding: 3%; font-size: 12pt;">
		 숙소에 화재 경보기 또는 일산화탄소 경보기가 설치되어 있는지 호스트가 신고하지 않았습니다. 휴대용 경보기를 챙겨가실 것을 권해드립니다.<br><br>
		 <a href="#" style="color: #008489;">자세히 알아보기</a>
		</div>
		<br><br>
		<h3 style="margin-bottom: 5%;">편의시설 및 이용규칙</h3>
		<!-- 주의할사항 이미지 -->
		<c:forEach var="roomoption" items="${roomoption}">
			<i class="fas fa-lg fa-border "><img src="<%=request.getContextPath() %>/resources/images/optionicon/${roomoption.optionicon}" /></i>
			<span style="margin-left: 2%; font-size: 12pt;">${roomoption.optionname} 있음.</span><br>
			<br>
		</c:forEach>
		
		<div class="pluscontext plus">더보기 <i class="fas fa-chevron-down" ></i></div>
		<!-- 추가규칙  -->
		<div id="plusRole" style="-webkit-font-smoothing: antialiased;">
			<div style="font-size:12pt;">
			<span style="font-weight:bold;">이용규칙</span><br><br>
            <i class="fas fa-check"></i> 2인 숙박만 허용함(3인 이상 체크인 시 추가요금 있음)<br>
            <i class="fas fa-check"></i> 주변을 배려해서 조용하게 머물러 주세요.<br>
            <i class="fas fa-check"></i> 삼겹살 등 냄새나는 음식은 조리 불가능합니다.<br>
            <i class="fas fa-check"></i> 임의로 체크아웃시간 지키지 않을 시 추가 요금있습니다.
            </div><br>
		</div>
		<div class="minuscontext minus" style="">숨기기 <i class="fas fa-chevron-down" ></i></div>
		<br><br><br><br>
		<!-- 동의및 계속 하기  -->
		<button type="button" class="btn" id="btnsubmit"><span style="color: white;">동의 및 계속하기</span></button>
	</div>
	<!-- ==================== 숙소 ========================== -->
	<!-- 숙소 정보 패널 -->
	<div class="col-md-5" style="padding-top: 4.7%;">
		<div class="panel panel-default">
			<!-- 숙소 정보 패널 1 -->
			<div class="panel-body hostpanel">
				<div class="col-md-8">
					<span style="font-weight: bold; font-size: 12pt;">${roomList.roomname}</span>
				     <br><br>${roomList.fk_userid}의 ${roomList.roomtype_name}<br>
				     <c:forEach begin="1" end="4" ><i class="fas fa-star fa-sm" style="color: #008489;"></i></c:forEach>
				     <i class="fas fa-star-half-alt fa-sm" style="color: #008489;"></i>
				         후기 개
					  
				</div> 
				<div class="col-md-4"><img src="${roomList.roommainimg}" style="width: 100%;"/></div>
			</div>
			<!-- 숙소 정보 패널 2 -->
			<div class="panel-body memberinfo">
			<hr>
			<div class="col-md-12" style="padding-top: 5%;">
				<i class="fas fa-users fa-lg" style="color: #008489;"></i><span style="margin-left: 3%;">게스트 1명</span>
				<br>
				<i class="far fa-calendar-alt fa-lg" style="color: #008489; margin-top: 5%;"></i>
				<span style="margin-left: 4%;">
				2019년 1월 1일 <i class="fas fa-arrow-right"></i>년 월 일
				</span>
			</div>
			</div>
			<!-- 숙소 정보 패널 2 -->
			<div class="panel-body price">
			<hr>
			<!-- 숙박요금 -->
			<div>
				<div class="col-md-9" >
				 ₩<span id="onedayPrice">
				 <fmt:formatNumber value="${roomList.roomprice}" pattern="#,###"/>
				 </span> x <span id="stayday"></span>박
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩90,000
				</div>
			</div>
				<!-- 각종 수수료  -->
			<div>
				<div class="col-md-9">
				청소비 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 일회성 숙소 청소 비용입니다."></i>
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩<span id="cleanpay"><fmt:formatNumber value="${roomList.cleanpay}" pattern="#,###"/></span>
				</div>
			</div>
			<div>
				<div class="col-md-9">
				성수기 추가 금액 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 성수기 추가 비용입니다."></i>
				</div>
				<div class="col-md-3" >
				 ₩<span id="peakpay"><fmt:formatNumber value="${roomList.roomprice}" pattern="#,###"/></span>
				</div>
			</div>
			</div>
			<!-- 숙소 정보 패널 3 -->
			<div class="panel-body price">
			<hr>
				<div class="col-md-9">
				 총 합계 (KRW)
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 <span style="font-weight: bold;">₩</span>
			</div>
		</div>
	</div>
	</div>
</div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
<hr>
</div>

</body>
</html>