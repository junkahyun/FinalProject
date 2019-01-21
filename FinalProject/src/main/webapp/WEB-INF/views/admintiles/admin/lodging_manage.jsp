<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cxtPath = request.getContextPath();
%>   

<style type="text/css">
	table#lodgingManage thead tr th,
	table#lodgingManage tbody tr td{
		vertical-align: middle;
	}
</style>
<script type="text/javascript">
	function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("lodgingManage");
	  switching = true;
	  //Set the sorting direction to ascending:
	  dir = "asc"; 
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.rows;
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
</script>
<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<div class="give_after_underline">
			<h2 class="home_title">숙소 관리</h2>
		</div>
	</div> 
	<div class="container">	
		<div class="row">
		<!-- 숙소 상세 리스트는 평점이 낮은 순으로 화면에 뿌릴 것 -->
			<div class="col-md-12" style="border: 0px solid gray;">
			<table id="lodgingManage" class="table"> 
					<col width="10%;"/>
					<col width="15%;"/>
					<col width="8%;"/>
					<col width="12%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				  <thead>
				    <tr>
				      <th onClick="sortTable(0)">숙소번호</th>
				      <th>숙소이미지</th>
				      <th onClick="sortTable(0)">숙소명</th>
				      <th>소재지</th>
				      <th>숙소 보유자명</th>
				      <th>숙소가격</th>
				      <th>숙소관리</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<!-- 데이터 돌리기 -->
				  	<c:forEach items="${roomList}" var="rvo" varStatus="status">
				  		 <tr>
						      <td>${status.count}</td>
						      <td><img src="${rvo.roomMainImg}" width="60%"/></td>
						      <td>${rvo.roomName}</td>
						      <td>${rvo.roomSido}${rvo.roomSigungu}${rvo.roomBname}</td>
						      <td>${rvo.host.username }</td>
						      <td>￦<fmt:formatNumber pattern="###,###">${rvo.roomPrice}</fmt:formatNumber></td>
						      <td><button type="button" class="btn btn-danger">삭제</button></td>
					    </tr> 
				  	</c:forEach> 
				  </tbody>
				</table>			
			</div>
		</div>
	</div>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
	[이전]    1    2    3    4    5		6		7		8		9    [다음]
</div>
</div>