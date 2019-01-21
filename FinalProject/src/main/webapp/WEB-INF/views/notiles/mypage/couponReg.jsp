<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />

<style type="text/css">

.box {
  border: 1px solid;
  padding: 5px;
  box-shadow: 2px 4px #dbdfdf;
}

</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
	$(document).ready(function(){
	});
	
	function couponAdd() {

		var frm = document.couponAddFrm;
		var url ="/bnb/couponRegEnd.air";
		frm.method="POST"; 
		frm.action=url;
		frm.submit();
		
	}
	
</script>
<form name="couponAddFrm">
	<div style="padding-top: 10%; border: 1px solid red">
	<div style="padding-left: 10%;"><strong>쿠폰등록을 등록해주세요 </strong></div>
		<div class="col-md-1"></div>	
		<div class="col-md-10" style="border: 1px solid red">		 
			<div style="margin: 3%;"><input type="text" id="couponReg" name="couponReg" placeholder="쿠폰번호를 입력해주세요"/></div>
			<div style="margin-top: 5%; margin-left: 35%;"><button class="btn" type="button" id="btnCoupon" onClick="couponAdd();">등록</button></div>
		</div>
	</div>
</form>