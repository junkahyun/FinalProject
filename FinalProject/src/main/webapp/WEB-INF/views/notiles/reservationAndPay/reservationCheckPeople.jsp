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

<style type="text/css">


h2,h3{font-weight: bold;
      
     }
h3{font-size: 14pt;
}


#plusRole{-webkit-font-smoothing: antialiased;
}

#host_error_message{margin-top: 0%; 
					height: 280%; 
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

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#host_error_message2").hide();

		$("#people").click(function(){
			
			$(".dropdown-menu").addClass("block");
		});
		
		$("#close").click(function(){
			$(".dropdown-menu").removeClass("block");
		});
		
		$("#btnsubmit").click(function(){
			
			var frm = document.checkHostAndMemberFrm;
			
			if(frm.message.value.length == 0 ){
				$("#host_error_message2").show();
				$("#host_error_message").addClass("messageError");
				
				frm.message.focus();
			}
			else{
				frm.method="GET";//post로 바꿔야함
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

	
</script>
</head>
<body>

<div class="container-fluid">
  <div class="row" style="margin-top: 0.6%; ">
    	<div class="col-sm-1" style="margin-top: 0.7%; margin-left: 1%;"><img src="<%=ctxPath %>/resources/images/airLogo.png" style="width: 30px; cursor: pointer;"/></div>
		<div class="col-sm-8" style="font-size: 11pt; margin-top: 1%;"><span style="font-weight: bold;">1. 숙소 이용규칙 확인 >  2. 게스트 정보 입력 > </span> 3. 확인 및 결제  >  4. 예약완료</div>
  </div>
</div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
	<div class="col-md-7" style="margin-top: 3%;">
		<h2 >일행이 있나요?</h2>
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
		<form name="checkHostAndMemberFrm">
		<!-- 숙박지역, 숙박일수  -->
		<h3 >인원</h3>
		<!-- 인원수 늘리기 -->
		 <div class="dropdown" style="margin-bottom: 10%;">
			 <div  class="panel panel-default people" >
				<div class="panel-body" id="people"  data-toggle="dropdown">
					<div class="col-md-10">게스트 명</div>
					<div class="col-md-2"> <i class="fas fa-chevron-down fa-lg"></i></div>
				</div>
				<ul class="dropdown-menu col-md-12" style="width: 45%; ">
			    <li style="margin-left: 5%; margin-top: 5%;">
			    	<div class="col-md-6">
				 		<span class="spellpeople" style="margin-right: 40%; ">성인</span>
				 	</div>   
					<div class="input-group number-spinner col-md-6" style="width: 40%;">
						<span class="input-group-btn data-dwn">
							<button class="btn btn-default btn-info" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
						</span>
						<input type="text" class="form-control text-center" value="1" min="1" max="${roomList.max_person}" name="guestcount">
						<span class="input-group-btn data-up">
							<button class="btn btn-default btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
						</span>
					</div>
				</li>
				<li style="margin-left: 5%; margin-top: 8%;" >
					<div class="col-md-6">
				 		<span class="spellpeople" style="margin-right: 40%; ">유아</span><br>
				 		<span style="font-size: 11pt;">2세~10세</span>
				 	</div>   
				 	
				 	
					<div class="input-group number-spinner col-md-6" style="width: 40%;">
						<span class="input-group-btn data-dwn">
							<button class="btn btn-default btn-info" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
						</span>
						<input type="text" class="form-control text-center" value="1" min="1" max="${roomList.max_person}" name="babycount"/>
						<span class="input-group-btn data-up">
							<button class="btn btn-default btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
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
		<h5 style="margin-bottom: 3%; font-size: 12pt;">(호스트이름)님에게 간단히 자신을 소개하고 여행 목적에 대해 알려주세요.</h5>
		
		<div class="col-md-9" style="background-color: #e5e5e5; border-radius: 5px; padding: 2%;">
		<span style="font-size: 12pt;">안녕하세요. 당신에 대해 소개해주시면 감사하겠습니다.^^</span> </div>
		<div class="col-md-3" style="margin-bottom: 5%;">
		<img src="<%=ctxPath %>/resources/images/${hostimg}" style="border-radius: 55px; width:40%; margin-top: 3%;"/>
		</div>
		<!-- 호스트에게 메시지 보내기 -->
		<div>
		<textarea id="host_error_message" name="message" rows="4" required="required" placeholder="(호스트이름)님, 안녕하세요! 숙소에서 보낼 멋진 ()박이 기다려집니다!"></textarea>
		</div>
		<div id="host_error_message2" >호스트에게 전할 메시지를 입력하세요!</div><br><br><br><br>
		
		<!-- 동의및 계속 하기  -->
		<button type="button" class="btn" id="btnsubmit"><span style="color: white;">계속하기</span></button>
		</form>
	</div>
	
	<!-- ============================================= 숙소 ============================================= -->
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
				년 월 일 <i class="fas fa-arrow-right"></i>년 월 일
				</span>
			</div>
			</div>
			<!-- 숙소 정보 패널 2 -->
			<div class="panel-body price">
			<hr>
			<!-- 숙박요금 -->
			<div>
				<div class="col-md-9" >
				 <span id="onedayPrice">
				 ₩<fmt:formatNumber value="${roomList.roomprice}" pattern="#,###"/>
				 </span> x 박
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 <span id="totalDayPrice">₩</span>
				</div>
			</div>
				<!-- 각종 수수료  -->
			<div>
				<div class="col-md-9">
				청소비 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 일회성 숙소 청소 비용입니다."></i>
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 ₩<fmt:formatNumber value="${roomList.cleanpay}" pattern="#,###"/>
				</div>
			</div>
			<div>
				<div class="col-md-9">
				성수기 추가 금액 <i class="far fa-question-circle" id="feeinfo" data-toggle="popover" data-placement="bottom" 
				         data-content="호스트가 청구하는 성수기 추가 비용입니다."></i>
				</div>
				<div class="col-md-3" >
				 ₩<fmt:formatNumber value="${roomList.roomprice}" pattern="#,###"/>
				</div>
			</div>
			</div>
			<!-- 숙소 정보 패널 3 -->
			<div class="panel-body price">
			<hr>
				<div class="col-md-9" >
				 총 합계 (KRW)
				</div>
				<div class="col-md-3" style="margin-bottom: 3%;">
				 <span style="font-weight: bold;">₩</span>
			</div>
		</div>
	</div>
	</div>
	<!-- 숙소 정보 패널 -->
</div>

<div class="container-fluid" style="margin-top: 3%; width: 62%;">
<hr>
</div>

</body>
</html>