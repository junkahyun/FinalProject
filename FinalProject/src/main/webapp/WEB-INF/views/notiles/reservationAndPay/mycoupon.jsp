<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css" >

th,td{padding: 1%;
}
th{font-weight: bold; font-size: 13pt;
}

</style>

<script type="text/javascript">

	/* $(document).ready(function(){
		
	});//end of $(document)-------------
 */
	function useMyCoupon(code,cpname){
		var sido = "${oneRoom.roomSido}";
		
		if('해운대' == cpname.match('해운대')){
			var bool = confirm("해당숙소는 사용이 가능합니다. 쿠폰을 사용하시겠습니까?");
			if(bool == true){
				goMyCoupon(code);	
			}
		}
		else if((sido != cpname.match(sido))){
			alert("해당 숙소는 사용이 불가합니다");
		}
		else{
			var bool = confirm("해당숙소는 사용이 가능합니다. 쿠폰을 사용하시겠습니까?");
			if(bool == true){
				goMyCoupon(code);	
			}
		}
	}
	
	function goMyCoupon(code){
		
		var form_data = {"code":code};
		
		$.ajax({
			url:"<%=request.getContextPath() %>/useMyCoupon.air",
			type:"POST",
			data:form_data,
			dataType:"text",
			success:function(text){
				alert("쿠폰이 사용되었습니다!");
				opener.parent.location.reload();
				window.close();
				
			},
			error: function(request, status, error){
		           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }	
		});
	}
	
	function NouseMyCoupon(code,cpname){
		var bool = confirm("사용을 취소하시겠습니까?");
		
		if(bool == true){
			cancelCoupon(code);
		}
	}
	
	function cancelCoupon(code){
		
		var form_data = {"code":code};
		
		$.ajax({
			url:"<%=request.getContextPath() %>/NouseMyCoupon.air",
			type:"POST",
			data:form_data,
			dataType:"text",
			success:function(text){
				alert("사용이 취소되었습니다.");
				opener.parent.location.reload();
				window.close();
			},
			error: function(request, status, error){
		           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }	
			
		});
	}
	
</script>

</head>
<body>
	<h3 align="center" style="margin-bottom: 3%; font-weight: bold;">쿠폰 적용하기</h3>
	<div class="container" >
		<table style="width: 100%;">
			<thead style="border: 1px solid gray; " class="table table-hover">
				<tr align="center" >
					<th style="">번호</th>
					<th style="">쿠폰코드</th>
					<th style="">쿠폰이름</th>
					<th style="">만료일</th>
					<th style="">할인율</th>
					<th style="">사용여부</th>
					<th style="">사용하기</th>
				</tr>
			</thead>
			
			<!-- 쿠폰을 갖고 있는 경우 -->
			<c:if test="${not empty mycoupon}">
			<tbody style="border: 1px solid gray;">
				<c:forEach  var="mycoupon" items="${mycoupon}" varStatus="status">
					<tr>
						<td style="font-weight: bold;">${status.count}</td>
						<td style="font-weight: bold; color: tomato;">${mycoupon.CPCODE}</td>
						<td style="font-weight: bold;">${mycoupon.cpname}</td>
						<td>${mycoupon.cpexpire}</td>
						<td style="font-weight: bold; color: tomato;">${mycoupon.dcmoney}</td>
						<c:if test="${mycoupon.USEDATE == null}">
							<td>사용가능함</td>
							<td><button class="btn btn-primary" id="useCoupon" onclick="useMyCoupon('${mycoupon.CPCODE}','${mycoupon.cpname}')">사용</button>
							</td>		
								
						</c:if>
						<c:if test="${mycoupon.USEDATE != null}">
							<td>사용불가</td>
							<td><button class="btn btn-danger" id="useCoupon" onclick="NouseMyCoupon('${mycoupon.CPCODE}','${mycoupon.cpname}')">취소</button></td>			
						</c:if>
						
							
					</tr>
				</c:forEach>
			</tbody>
			</c:if>
			
			<!-- 쿠폰을 갖고 있지 않은 경우 -->
			<c:if test="${empty mycoupon}">
				<tbody style="border: 1px solid gray;">
					<tr>
						<td colspan="8" align="center">
							보유하고 계신 쿠폰이 없습니다.
						</td>
					</tr>
				
				</tbody>
			</c:if>
		
		</table>
	</div>
	<div class="col-md-12" align="center" style="margin-top: 5%; margin-bottom: 5%;">
	<button class="btn btn-danger" onclick="window.close();">닫기</button>
	</div>
</body>
</html>