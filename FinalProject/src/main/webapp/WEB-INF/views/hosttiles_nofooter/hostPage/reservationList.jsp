<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel='stylesheet' href='<%=request.getContextPath() %>/resources/css/fullcalendar.min.css' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='<%=request.getContextPath() %>/resources/js/jquery.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/moment.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/fullcalendar.js'></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script> <!-- 날짜형식 바꾸는것 -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>

  $(document).ready(function() {
	
	$("#showRsver").hide();
	  
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title', 
        right: null
      },
      defaultDate: '2019-01-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
    	  <c:forEach items="${reservationList}" var="rsv" varStatus="status">
    	  	{
              title: /*'예약자 성명 : '+*/'${rsv.rsv_name}',
              start: '${rsv.rsv_checkInDate}',
              end : '${rsv.rsv_checkOutDate}',
              phone : '${rsv.rsv_phone}',
              email : '${rsv.rsv_email}',
              guest : '${rsv.guestCount}',
              price : '${rsv.totalprice}',
              paydate : '${rsv.paydate}',
              rsv_msg : '${rsv.rsv_msg}'
            }, 
            {
	           start: '${rsv.rsv_checkInDate}',
	           end:'${rsv.rsv_checkOutDate}',
	           overlap: true,
               rendering: 'background',
               color: '#ff9f89'
            },
            <c:if test="${status.last} == ${listSize}">
          	  {
                title: '${rsv.rsv_name}',
                start: '${rsv.rsv_checkInDate}',
                end : '${rsv.rsv_checkOutDate}'
              }, 
              {
              	start: '${rsv.rsv_checkInDate}',
              	end:'${rsv.rsv_checkOutDate}',
              	overlap: true,
                  rendering: 'background',
                  color: '#ff9f89'
              }
            </c:if>
    	  </c:forEach>
    	 
      ], eventClick:function(event) {
        
          var checkin = moment(event.start).format('YYYY년 MM월 DD일');
          var checkout = moment(event.end).format('YYYY년 MM월 DD일');
          var paycomplete = moment(event.paydate).format('YYYY년 MM월 DD일');
    	  $(".modal").modal("show");         
          $(".modal").find("#name").text(event.title);
          $(".modal").find("#rsvName").text(event.title);
          $(".modal").find("#phone").text(event.phone);
          $(".modal").find("#email").text(event.email);
          $(".modal").find("#checkin").text(checkin);
          $(".modal").find("#checkout").text(checkout);
          $(".modal").find("#guest").text(event.guest);
          $(".modal").find("#price").text(event.price);
          $(".modal").find("#paydate").text(paycomplete);
          $(".modal").find("#msg").text(event.rsv_msg);
          
      }

    });

  });

</script>
<style>

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

	/* Modal */
	.modal{
		overflow:hidden;
		z-index:9999;
	}
	div.modal div#memberInfo{
		margin:2%;
	} 
	div.modal button.myclose{
		width:100%;
	}
	div.modal button > span{
		float:right;
	}
	div.modal select{
		width:50%;
		float:left;
		margin-top:10%;
	}
	div.modal button.finish_sido{
		width:50%;
		display:block;
		margin:30% auto;
	}
	#info{
		font-weight: bold;
		font-size: 12pt;
	}
	.rsvinfo{
		font-size: 12pt;
	}
	#rsvName{
		font-size: 20pt;
		font-weight: bold;
		color: blue;
	}
</style>

<body>

  <div id='calendar' style="margin-top: 3%;">
  	<c:forEach items="${reservationList}" var="rsv">
	  	<input type="hidden" id="client" class="client" value="${rsv.rsv_name}"/>
	  	<input type="hidden" id="checkindate" class="checkindate" value="${rsv.rsv_checkInDate}" />
	  	<input type="hidden" id="checkoutdate" class="checkoutdate" value="${rsv.rsv_checkOutDate}" />
	  	<input type="hidden" id="phone" class="phone" value="${rsv.rsv_phone}" /><br/>	   
  	</c:forEach>  	
  </div>
  <ul id="showRsver">
  	<c:forEach items="${reservationList}" var="rsv">
  		<li>예약자 성명 : </li>
  		<li id="name" class="name" value="${rsv.rsv_name}">${rsv.rsv_name}</li><br/>
  		<li id="phone" class="phone" value="">예약자 전화번호 : ${rsv.rsv_phone}</li><br/>
  		<li id="email" class="email" value="">예약자 이메일 : ${rsv.rsv_email}</li><br/>
  		<li id="checkindate" class="checkindate" value="">체크인 날짜 : ${rsv.rsv_checkInDate}</li><br/>
  		<li id="checkoutdate" class="checkoutdate" value="">체크아웃 날짜 : ${rsv.rsv_checkOutDate}</li><br/>
  		<li id="guestcount" class="guestcount" value="">총 인원 수 : ${rsv.guestCount}명</li><br/>
  		<li id="babycount" class="babycount" value="">유아 인원 수 : ${rsv.babyCount}명</li><br/>
  		<li id="totalprice" class="totalprice" value="">총 금액 : <fmt:formatNumber value="${rsv.totalprice}" pattern="#,###"/>원</li><br/>
  		<li id="dcprice" class="dcprice" value="">할인 금액 : <fmt:formatNumber value="${rsv.dcprice}" pattern="#,###"/>원</li><br/>
  		<li id="paydate" class="paydate" value="">결제 날짜 : ${rsv.paydate}</li><br/>
  		<li id="rsv_msg" class="rsv_msg" value="">예약 메세지 : ${rsv.rsv_msg}</li><br/>
  		
  	</c:forEach>
  </ul>

	<!-- 회원정보보기 모달 -->
	
 <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">예약자 <span id="rsvName"></span>님의 정보</h3>
        </div>
        <div class="modal-body">
          	<span id="info">성명 >> </span><span id="name" class="rsvinfo"></span><br/><br/>
          	<span id="info">전화번호 >> </span><span id="phone" class="rsvinfo"></span><br/><br/>
          	<span id="info">이메일 >> </span><span id="email" class="rsvinfo"></span><br/><br/>
          	<span id="info">입실일 >> </span><span id="checkin" class="rsvinfo"></span><br/><br/>
          	<span id="info">퇴실일 >> </span><span id="checkout" class="rsvinfo"></span><br/><br/>
          	<span id="info">총인원 >> </span><span id="guest" class="rsvinfo"></span>명<br/><br/>
          	<span id="info">총가격 >> </span><span id="price" class="rsvinfo">₩</span>원<br/><br/>
          	<span id="info">결제일 >> </span><span id="paydate" class="rsvinfo"></span><br/><br/>
          	<span id="info">예약메시지 >> </span><span id="msg" class="rsvinfo"></span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>


</body>
