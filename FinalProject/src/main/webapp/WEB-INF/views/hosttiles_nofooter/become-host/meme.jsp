<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">    

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>
<meta charset="utf-8">

<script>

	$(document).ready(function(){
		
		$("#address1").click(function() {
		    new daum.Postcode({
		         oncomplete: function(data) {
		        	 $("#address1").val(data.address);
		             $("#postnum").val(data.zonecode);
		         }
		     }).open();
		   
		 });
	}); 
	
	function btn(){
		var frm = document.map;
		frm.action="meme2.air";
		frm.method="GET";
		frm.submit();
	}
	

	
	
	
	
	
</script>

<form name="map">
	<input type="text" id="address1" name="address1"/>
	<input type="text" id="postnum"/>
	<button type="button" onclick="btn();">다음</button>
</form>


