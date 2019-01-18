<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel='stylesheet' href='<%=request.getContextPath() %>/resources/css/fullcalendar.min.css' />
<script src='<%=request.getContextPath() %>/resources/js/jquery.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/moment.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/fullcalendar.js'></script>
<script>

  $(document).ready(function() {

	
	  
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        /* right: 'month,agendaWeek,agendaDay,listMonth' */
      },
      defaultDate: '2019-01-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
    	  <c:forEach items="${reservationList}" var="rsv" varStatus="status">
    	  	{
              title: '${rsv.rsv_name}',
              start: '${rsv.rsv_checkInDate}',
              end : '${rsv.rsv_checkOutDate}'
            }, 
            {
	           start: '${rsv.rsv_checkInDate}',
	           end:'${rsv.rsv_checkOutDate}',
	           overlap: false,
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
              	overlap: false,
                  rendering: 'background',
                  color: '#ff9f89'
              }
            </c:if>
    	  </c:forEach>
    	   
      ]
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

  <div id='calendar'>
  	<c:forEach items="${reservationList}" var="rsv">
	  	<input type="text" id="client" class="cl" value="${rsv.rsv_name}"/>
	  	<input type="text" id="checkindate" class="checkindate" value="${rsv.rsv_checkInDate}" />
	  	<input type="text" id="checkoutdate" class="checkoutdate" value="${rsv.rsv_checkOutDate}" />
	  	<input type="text" id="phone" class="phone" value="${rsv.rsv_phone}" /><br/>
	   
  	</c:forEach>  	
  </div>

</body>
