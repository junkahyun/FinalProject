<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel='stylesheet' href='<%=request.getContextPath() %>/resources/css/fullcalendar.min.css' />
<script src='<%=request.getContextPath() %>/resources/js/jquery.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/moment.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/fullcalendar.js'></script>
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
              end : '${rsv.rsv_checkOutDate}'
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
        /*   if(event.url) {
              alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
              window.open(event.url);
              return false;
          } */
          alert(event.title);
          var name = $(".name").text();
          alert(name);
          if(event.title == name){
        	  $("#showRsver").show();
          }
      }

    });

  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
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

</body>
