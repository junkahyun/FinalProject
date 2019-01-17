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
        {
          title: 'Business Lunch',
          start: '2019-01-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2019-01-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2019-01-18',
          end: '2019-01-20'
        },
        {
          title: 'Party',
          start: '2019-01-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          id: 'availableForMeeting',
          start: '2019-01-11T10:00:00',
          end: '2019-01-11T16:00:00',
          rendering: 'background'
        },
        {
          id: 'availableForMeeting',
          start: '2019-01-13T10:00:00',
          end: '2019-01-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2019-01-24',
          end: '2019-01-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2019-01-06',
          end: '2019-01-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
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
	  	<input type="text" id="client" value="${rsv.rsv_name}"/>
	  	<input type="text" id="checkindate" value="${rsv.rsv_checkInDate}" />
	  	<input type="text" id="checkoutdate" value="${rsv.rsv_checkOutDate}" />
	  	<input type="text" id="phone" value="${rsv.rsv_phone}" />
  	</c:forEach>  	
  </div>

</body>
