<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>

<style type="text/css">


h2,h3{font-weight: bold;
      
     }
h3{font-size: 14pt;
}


#plusRole{-webkit-font-smoothing: antialiased;
}

#host_error_message{margin-top: 0%; 
					height: 15%; 
					max-width :90%; 
					width :90%;
					font-size: 12pt;
					
					
}
#host_error_message2{color: #fc642d; 
                     font-weight: bold;
                     font-size: 12pt;
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
.fa-minus-square{cursor: pointer;
                 color: #00adb3;
}

.fa-plus-square{cursor: pointer;
                 color: #00adb3;
}
.messageError{background-color: #fef4f1;
              border: 1px solid #fc642d;
}
.price{font-size: 12pt;
}
.memberinfo{font-size: 12pt;
}
.people{font-size: 12pt; 
        width: 45%; 
        padding: 1%;
}
.number{margin-left: 10%; margin-right: 10%;
        font-size: 12pt;
        font-weight: bold;
        
}
.spellpeople{font-size: 12pt; 
             font-weight: bold;
             margin-bottom: 4%;
}
.block{display: inline-block; 
}

</style>

<script>//게스트 인원 수량 변경

	$(document).ready(function(){
		
		$("#finalPeople").val("${guestcount}"); //인원추가 하지 않을시 기존에 선택한 값만 넘김
		
		$("#close").click(function(){ //인원변경 클릭시 가격, 인원수 변경하기
			var babym = $("#babycount").val();
			var adultm = $("#guestcount").val();
			$(".totaladCount").text(" "+adultm);
			$(".pannelCount").text(adultm+"명");
			
			if(babym == "0"){
				$(".totalbbCount").empty();
			}
			else{
				$(".totalbbCount").text(", 유아 "+babym+"명");
				$(".pannelCount").text(adultm+"명, 유아 "+babym+"명");
			}
			
			$("#finalPeople").val(parseInt(adultm));
			
			var finalpeople = $("#finalPeople").val();//최종 인원수
			var maxperson = ${oneRoom.max_person};//최대 인원수
			var roomtotalPrice = $("#roomtotalPrice").text();//최대인원수 추가 안한 기본 가격
			
			var room = roomtotalPrice.split(",");
			var rom2 = room.join("");
			
			var room3 = parseInt(rom2);//최대인원추가시 연산을 위해 기본가격을 int타입으로 바꿈, 최종금액
			
			if(parseInt(maxperson) < parseInt(finalpeople)){ // 최대인원추가시 인원당 가격 추가
				var plus = (parseInt(finalpeople)-parseInt(maxperson))*${oneRoom.person_addpay};
				// 인원추가시 추가되는 금액
				$("#pluspeople").empty().val(plus);
				$("#roomtotalPrice").empty().text(Number(room3+plus).toLocaleString());
				
			}//end of if---------
			/* else if(parseInt(finalpeople)-parseInt(maxperson) == 0){
				var minus = parseInt($("#pluspeople").val());
				console.log($("#pluspeople").val());
				
				if(minus != ""){
					$("#roomtotalPrice").text(Number(room3-minus).toLocaleString());
				}
			}//end of if----------- */
			
		});
		
	});


</script>

<script type="text/javascript">

	$(document).ready(function(){
		getdateBetween();
		getdayTotal();
		
		$("#host_error_message2").hide();

		$("#people").click(function(){
			
			$(".dropdown-menu").addClass("block");
		});
		
		$("#close").click(function(){
			$(".dropdown-menu").removeClass("block");
		});
		
		$("#btnsubmit").click(function(){
			
			var frm = document.revCheckPeople;
			
			if($("#host_error_message").val() == "" ){
				$("#host_error_message2").show();
				$("#host_error_message").addClass("messageError");
				
				$("#host_error_message").focus();
			}
			else{
				
				frm.babycount.value = $("#babycount").val();
				frm.guestcount.value = $("#guestcount").val();
				frm.totalprice.value = $("#roomtotalPrice").text();
				frm.message.value = $("#host_error_message").val();
				frm.totalpeople.value = $("#finalPeople").val();
				frm.price.value=$("#Price").text();
				frm.method="POST";
				frm.action = "<%=ctxPath%>/reservationCheckAndPay.air";
				frm.submit();
			 } 
		});
		
		$("[data-toggle='popover']").popover();
		
		$(function() {
		    var action;
		    $(".number-spinner button").mousedown(function () {
		        btn = $(this);
		        input = btn.closest('.number-spinner').find('input');
		        btn.closest('.number-spinner').find('button').prop("disabled", false);

		    	if (btn.attr('data-dir') == 'up') {
		            action = setInterval(function(){
		                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
		                    input.val(parseInt(input.val())+1);
		                }else{
		                    btn.prop("disabled", true);
		                    clearInterval(action);
		                }
		            }, 50);
		    	} else {
		            action = setInterval(function(){
		                if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
		                    input.val(parseInt(input.val())-1);
		                }else{
		                    btn.prop("disabled", true);
		                    clearInterval(action);
		                }
		            }, 50);
		    	}
		    }).mouseup(function(){
		        clearInterval(action);
		    });
		});
		
		
	});//end of $(document).ready------------

	
	function getdayTotal(){//1박금액*숙박일수 && 총금액
		
		var stayday = $("#Price").text();
		var stay = stayday.split(",");
		var daybetween = $("#day_between").text();
		
		$("#Price").text(Number(daybetween*stay.join("")).toLocaleString());
		
		stayday = $("#Price").text();
		var cleanpay = $("#cleanpay").text();
		var peakpay = $("#peakpay").text();
		
		var stay = stayday.split(",");
		var clean = cleanpay.split(",");
		var peak = peakpay.split(",");
		
		var totalprice = parseInt(stay.join(""))+parseInt(clean.join(""))+parseInt(peak.join(""));
		$("#roomtotalPrice").text(Number(totalprice).toLocaleString());
		
	}
	
	function getdateBetween(){ //두 날짜사이의 차이 구하기
		
		var checkin = "${checkin}";
		var checkout = "${checkout}";
		
		var date1 = new Date(checkin);
	    var date2 = new Date(checkout);
	      
	    var time1 = date1.getTime();
	    var time2 = date2.getTime();
	    
	    var datebetween = (time2-time1)/(1000*60*60*24);
	    //날짜 차이 구하기
	    
	    $("#day_between").text(datebetween);
	    
	    var chin = checkin.substring(6)+"년 "+checkin.substring(0,2)+"월 "+checkin.substring(3,5)+"일";
	    var chout = checkout.substring(6)+"년 "+checkout.substring(0,2)+"월 "+checkout.substring(3,5)+"일";
	    
	    $("#in").text(chin);
	    $("#out").text(chout);
	      
	}
	
</script>



</head>
<body>
<!-- Channel Plugin Scripts -->
<script>
  ;window.channelPluginSettings = {
    "pluginKey": "6f3362e0-0256-424f-9493-b4dc969bc2d0" //please fill with your plugin key
  };
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
</script>
<!-- End Channel Plugin -->
<div class="container-fluid">
  <div class="row" style="margin-top: 0.6%; ">
  		<div class="col-sm-1" style="margin-top: 0.7%; margin-left: 1%;">
    	<img src="<%=ctxPath %>/resources/images/airLogo.png" style="width: 30px; cursor: pointer;" onclick="javascript:location.href='<%=request.getContextPath() %>/index.air'"/>
    	</div>
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 >  2. 게스트 정보 입력 > </span> 3. 확인 및 결제  >  4. 예약완료</div>
  </div>
</div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
	<div class="col-md-7" style="margin-top: 3%;">
		<h2 >일행이 있나요?</h2>
		<br>
		<div class="panel panel-default" style="font-size: 12pt; ">
			<div class="panel-body">
				<c:if test="${oneRoom.viewcount < 10 }">
					<div class="col-md-1" ><img src="<%=ctxPath %>/resources/images/reservation/흔치않은기회.gif" style="width: 55px;"/></div>
					<div class="col-md-10" style="margin-left: 2%; margin-top: 1%;">
					      <strong>흔치 않은 기회입니다.</strong>${oneRoom.fk_userid}님의 숙소는 보통 예약이 가득 차 있습니다.
				    </div>
				</c:if>
				<c:if test="${oneRoom.viewcount > 10 }">
					<div class="col-md-1" ><img src="<%=ctxPath %>/resources/images/reservation/아이콘.gif" style="width: 55px;"/></div>
					<div class="col-md-10" style="margin-left: 2%; margin-top: 1%;">
					     숙소 예약이 곧 마감될 수 있습니다.여행 트렌드를 분석해 보면, 조회하시는 기간 중 1박 이상의 예약이 곧 마감될 수 있습니다.
				    </div>
				</c:if>
			    
			</div>
		</div>
		<br>
		<!-- 숙박지역, 숙박일수  -->
		<h3 >인원&nbsp;&nbsp;<span style="font-size: 11pt;">(${(sessionScope.oneRoom).fk_userid}님이 수용하는 최대인원은 ${(sessionScope.oneRoom).max_person}명 입니다.)</span></h3>
		<!-- 인원수 늘리기 --><input type="hidden" id="finalPeople"/>
		 <div class="dropdown" style="margin-bottom: 10%;">
			 <div  class="panel panel-default people" >
				<div class="panel-body" id="people"  data-toggle="dropdown">
					<div class="col-md-10" >게스트<span class="pannelCount">${guestCount}명
						<c:if test="${babyCount != null}">,유아 ${babyCount}명</c:if></span>
					</div>
					<div class="col-md-2"> <i class="fas fa-chevron-down fa-lg"></i></div>
				</div>
				<ul class="dropdown-menu col-md-12" style="width: 45%; ">
			    <li style="margin-left: 5%; margin-top: 5%;">
			    	<div class="col-md-6">
				 		<span class="adultName" style="margin-right: 40%; ">성인</span>
				 	</div>   
					<div class="input-group number-spinner col-md-6" style="width: 40%;">
						<span class="input-group-btn data-dwn">
							<button class="btn btn-default btn-info adultm" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
						</span>
						<input type="text" class="form-control text-center" value="${guestCount}" min="1" max="${(sessionScope.oneRoom).max_person}"  id="guestcount"/>
						<span class="input-group-btn data-up">
							<button class="btn btn-default btn-info adultp" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
						</span>
					</div>
				</li>
				<li style="margin-left: 5%; margin-top: 8%;" >
					<div class="col-md-6">
				 		<span class="babyName" style="margin-right: 40%; ">유아</span><br>
				 		<span style="font-size: 11pt;">2세~10세</span>
				 	</div>   
				 	
				 	
					<div class="input-group number-spinner col-md-6" style="width: 40%;">
						<span class="input-group-btn data-dwn">
							<button class="btn btn-default btn-info babym" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
						</span>
						<input type="text" class="form-control text-center" value="${babyCount}" min="0" max="${(sessionScope.oneRoom).max_person}"  id="babycount"/>
						<span class="input-group-btn data-up">
							<button class="btn btn-default btn-info babyp" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
						</span>
					</div>
					
				</li>
				<li style="margin-left: 5%; margin-top: 8%;">
					<div align="right" style="margin-right: 5%;" ><span id="close" style="color: #008489; font-weight: bold; cursor: pointer; font-size: 12pt;" >닫기</span></div>
				</li>
		    	</ul>
			</div>
		 </div>
		<!-- 호스트에게 메시지 보내기  -->
		<h3 style="display: block;">호스트에게 인사하기</h3>
		<h5 style="margin-bottom: 3%; font-size: 12pt;">${(sessionScope.oneRoom).fk_userid}님에게 간단히 자신을 소개하고 여행 목적에 대해 알려주세요.</h5>
		
		<div class="col-md-9" style="background-color: #e5e5e5; border-radius: 5px; padding: 2%;">
		<span style="font-size: 12pt;">안녕하세요. 당신에 대해 소개해주시면 감사하겠습니다.^^</span> </div>
		<div class="col-md-3" style="margin-bottom: 5%;">
		<img src="<%=request.getContextPath() %>/resources/images/profile/${oneRoom.host.profileimg}" alt="호스트프로필" style="border-radius: 55px; width:40%; height:5%; margin-top: 3%;"/>
		</div>
		<!-- 호스트에게 메시지 보내기 -->
		<div>
		<textarea id="host_error_message"  rows="4" required="required" placeholder="${(sessionScope.oneRoom).fk_userid}님, 안녕하세요! 숙소에서 보낼 멋진 ${day_between}박이 기다려집니다!"></textarea>
		</div>
		<div id="host_error_message2" >호스트에게 전할 메시지를 입력하세요!</div><br><br><br><br>
		
		<!-- 동의및 계속 하기  -->
		<button type="button" class="btn" id="btnsubmit"><span style="color: white;">계속하기</span></button>
	</div>
	
	<!-- ============================================= 숙소 ============================================= -->
	<!-- 숙소 정보 패널 -->
	<div class="col-md-5" style="padding-top: 4.7%; ">
		<div class="panel panel-default changepannel">
			<!-- 숙소 정보 패널 1 -->
			<div class="panel-body hostpanel">
				<div class="col-md-8" style="margin-bottom: 5%;">
					<span style="font-weight: bold; font-size: 12pt;">${(sessionScope.oneRoom).roomName}</span>
				     <br><br>${(sessionScope.oneRoom).fk_userid}의 ${(sessionScope.oneRoom).buildType_detail_name}<br>
				     <c:forEach begin="1" end="4" ><i class="fas fa-star fa-sm" style="color: #008489;"></i></c:forEach>
				     <i class="fas fa-star-half-alt fa-sm" style="color: #008489;"></i>
				         후기 ${reviewCount}개
					  
				</div> 
				<div class="col-md-4"><img src="<%=request.getContextPath() %>/resources/images/becomehost/${oneRoom.roomMainImg}" style="width: 100%; height: 8%;"/></div>
				<div class="infoDiv" >
				<%-- 지역정보 --%>
				<div id="map" style="height:350px;width:100%;border: 1px solid lightgray;margin-top:3%;padding:0;"></div>
				
				<script> 
				   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				       mapOption = {
				           center: new daum.maps.LatLng(0,0), // 지도의 중심좌표33.450701, 126.570667
				           level: 3 // 지도의 확대 레벨
				       };  
				   
				   // 지도를 생성합니다    
				   var map = new daum.maps.Map(mapContainer, mapOption); 
				   
				   // 주소-좌표 변환 객체를 생성합니다
				   var geocoder = new daum.maps.services.Geocoder();
				   
				   // 주소로 좌표를 검색합니다
				   geocoder.addressSearch('${oneRoom.roomSido} ${oneRoom.roomSigungu} ${oneRoom.roomBname}', function(result, status) {
				   
				       // 정상적으로 검색이 완료됐으면 
				        if (status === daum.maps.services.Status.OK) {
				   
				           var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				   
				           // 결과값으로 받은 위치를 마커로 표시합니다
				           var marker = new daum.maps.Marker({
				               map: map,
				               position: coords
				           });
				   
				          /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
				           var infowindow = new daum.maps.InfoWindow({
				               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${address}'+'</div>'
				           });
				           infowindow.open(map, marker); */
				   
				           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				           map.setCenter(coords);
				       } 
				   });  
				   
				</script>
			</div>
			</div>
			
			<!-- 숙소 정보 패널 2 -->
			<div class="panel-body memberinfo">
			<hr>
			<div class="col-md-12" style="padding-top: 5%;">
				<i class="fas fa-users fa-lg" style="color: #008489;"></i><span style="margin-left: 3%;" >게스트</span><span class="totaladCount"> ${guestCount}</span>명
				
				<span class="totalbbCount"><c:if test="${babyCount != null}">,유아 ${babyCount}명</c:if></span>
				<br>
				<i class="far fa-calendar-alt fa-lg" style="color: #008489; margin-top: 5%;"></i>
				<span style="margin-left: 4%;">
				<span id="in"></span><i class="fas fa-arrow-right"></i><span id="out"></span>
				</span>
			</div>
			</div>
			<!-- 숙소 정보 패널 2 -->
			<div class="panel-body price">
			<hr>
			<!-- 숙박요금 -->
			<div>
				<div class="col-md-9" >
				 ₩<span >
				 <fmt:formatNumber value="${(sessionScope.oneRoom).roomPrice}" pattern="#,###"/>
				 </span> x <span id="day_between"></span>박
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;" >
				 ₩<span id="Price"><fmt:formatNumber value="${(oneRoom.roomPrice)}" pattern="#,###"/></span>
				</div>
			</div>
				<!-- 각종 수수료  -->
			<div>
				<div class="col-md-9">
				청소비 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 일회성 숙소 청소 비용입니다."></i>
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩<span id="cleanpay"><fmt:formatNumber value="${(sessionScope.oneRoom).cleanPay}" pattern="#,###"/></span>
				</div>
			</div>
			<div>
				<div class="col-md-9">
				성수기 추가 금액 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 성수기 추가 비용입니다."></i>
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩<span id="peakpay"><fmt:formatNumber value="${(oneRoom.peakper)}" pattern="#,###"/></span>
				</div>
			</div>
			
			<div>
				<div class="col-md-9">
				추가 인원 금액 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="최대 인원 추가시 발생하는 비용입니다."></i>
				</div>
				<div class="col-md-3" >
				 ₩<span id="person_addpay"><fmt:formatNumber value="${(sessionScope.oneRoom).person_addpay}" pattern="#,###"/></span>
				</div>
			</div>
			</div>
			<!-- 숙소 정보 패널 3 -->
			<div class="panel-body price">
			<hr>
				<div class="col-md-9">
				 총 합계 (KRW)
				</div>
				<!-- <input type="text" id="pluspeople"/> -->
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩<span style="font-weight: bold;" id="roomtotalPrice">
				 </span>
				</div>
			</div>
		</div>
	</div>
	<!-- 숙소 정보 패널 -->
</div>

<form name="revCheckPeople">
	<input type="hidden" value="" name="babycount" />
	<input type="hidden" value="" name="guestcount" />
	<input type="hidden" value="" name="totalprice" />
	<input type="hidden" value="" name="message" />
	<input type="hidden" value="" name="totalpeople" />
	<input type="hidden" value="" name="price" />
</form>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
<hr>
</div>

</body>
</html>