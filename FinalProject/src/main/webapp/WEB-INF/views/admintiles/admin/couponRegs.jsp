<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function(){
    
    $("#btnWrite").click(function(){
        
        var couponFrm = document.couponFrm;
        
		var cpnameval = couponFrm.cpname.value.trim();
		if(cpnameval == "") {
			alert("쿠폰명을 입력해주세요!");
			frm.cpname.value="";
			frm.cpname.focus();
			return;
		}
        
		var dcmoneyval = couponFrm.dcmoney.value.trim();
		if(dcmoneyval == "") {
			alert("할인금액을 입력해주세요!");
			frm.dcmoney.value="";
			frm.dcmoney.focus();
			return;
		}
		
        couponFrm.action = "<%= request.getContextPath() %>/couponRegsEnd.air";
        couponFrm.method = "POST";
        couponFrm.submit();
    });

});  
</script>

<div style="padding: 3%; width: 60%; margin:0 auto;">  

	<form name="couponFrm">
		<div style="padding-bottom: 2%; padding-left: 2%; padding-right: 2%; text-align: center; font-weight: bold;"><h2>쿠폰 등록하기</h2></div>

		<div style="padding: 2%;">
			<label class="input-group-text" for="inputGroupSelect02">쿠폰이름</label>
			<input type="text" class="form-control" placeholder="쿠폰 이름을 써주세요" id="cpname" name="cpname">
		</div>
		
		<div style="padding: 2%;">
			<label class="input-group-text" for="inputGroupSelect02">할인가격</label>
			<input type="text" class="form-control" placeholder="할인가격을 써주세요" id="dcmoney" name="dcmoney">
		</div>
		
		
		<div style="display:inline; text-align: center;">
			<div style="float:left; width:50%;"><button type="button" class="btn btn-success" id="btnWrite" style="width: 20%;">확인</button></div>
			<div style="float:left; width:50%;"><button type="button" class="btn" style="width: 20%;" onClick="javascript:location.href='<%= request.getContextPath()%>/admin.air'">취소</button></div>
		</div>
	</form>
	
</div>