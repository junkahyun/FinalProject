<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css"> 

   .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
          overflow-wrap: break-word;
          font-size: 24px;
          font-weight: 800;
          line-height: 1.25em;
          color: rgb(72, 72, 72);
          padding-top: 2px;
          padding-bottom: 2px;
          margin: 0px}        

   .select{font-size: var(--font-form-element-font-size, 16px) ;
          line-height: var(--font-form-element-line-height, 24px) ;
          letter-spacing: var(--font-form-element-letter-spacing, normal) ;
          font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) ;
          text-transform: var(--font-form-element-text-transform, undefined) ;
          color: #484848 ;
          padding-top: var(--spacing-form-element-vertical, 10px) ;
          padding-bottom: var(--spacing-form-element-vertical, 10px) ;
          font-weight: var(--font-light-font-weight, normal) ;
          background-color: transparent ;
          border-radius: 3px;}  

   .selecthead{font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif ;
             overflow-wrap: break-word ;
             font-size: 16px ;
             font-weight: 600 ;
             line-height: 1.375em ;
             color: rgb(118, 118, 118) ;
             margin-bottom: 8px ;} 

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#bname").click(function() {
		    new daum.Postcode({
		         oncomplete: function(data) {
		        	// alert(JSON.stringify(data));
		        	 $("#address").val(data.address);
		             $("#postnum").val(data.zonecode);
		             $("#sido").val(data.sido);
		             $("#sigungu").val(data.sigungu);
		             $("#bname").val(data.bname);
		         }
		     }).open();
		   
		 });
	});
	
	function gomap(){
		var frm = document.map;
		frm.action="map.air";
		frm.method="GET";
		frm.submit();
	}
	
</script>

<form name="map">
	<div>
	   <div class="row" style="border: 0px solid green;">
	
	   <div class="container col-md-12" style="border: 0px solid red;">
		  <div class="progress" style="height: 13px;"> 
		    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
		    </div>
		  </div>
		</div> 
	
	      <div class="col-md-4" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
	      	
	      	<div class="row">
	         <div class="col-md-10 title">숙소의 위치를 알려주세요.</div>
	         <div class="row" style="padding: 0; border: 0px solid green;" >
	         
	         	<div class="col-md-4" style="margin-top: 50px; border: 0px solid red;">
	                <div class="col-md-12" style="font-size: 20px;">시/도</div>  
					<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
						<input type="text" id="sido" name="sido" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 서울특별시" readonly="readonly"/>
					</div>
	            </div>
	            
	            <div class="col-md-4" style="margin-top: 50px; border: 0px solid red;">
	                <div class="col-md-12" style="font-size: 20px;">시/군</div>  
					<div class="col-md-12" style="border: 0px solid blue; padding-right: 0">
						<input type="text" id="sigungu" name="sigungu" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 강남구" readonly="readonly"/>
					</div>
	            </div>
	         
	            <div class="col-md-8" style="margin-top: 25px; border: 0px solid red;">
	                <div class="col-md-12" style="font-size: 20px;">동  / 도로명</div>  
					<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
						<input type="text" id="bname" name="bname" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="이곳을 클릭해주세요" readonly="readonly"/>
						<input type="text" id="address" name="address" style="margin-top: 10px; margin-bottom : 0; margin-left:0; margin-right:0; padding: 25px;" class="input-data form-control" readonly="readonly"/>
					</div>
	            </div>
	            
	            <div class="col-md-8" style="margin-top: 25px; border: 0px solid red;">
	                <div class="col-md-12" style="font-size: 20px;">상세주소(필수)</div>  
					<div class="col-md-12" style="border: 0px solid blue; padding-right: 0;">
						<input type="text" id="addrDetail" name="addrDetail" style="margin: 0; padding: 25px" class="input-data form-control" placeholder="예) 35동 3층 301호"/>
					</div>
	            </div>
	            
	            <div class="col-md-9" style="margin-top: 25px; border: 0px solid red;">
	                <div class="col-md-12" style="font-size: 20px;">우편번호</div>  
					<div class="col-md-5" style="border: 0px solid blue; padding-right: 0;">
						<input type="text" id="postnum" name="postnum" style="margin: 0; padding: 25px;" class="input-data form-control" placeholder="예) 12345" readonly="readonly"/>
					</div>
	            </div> 
	            
	         </div>
	
	         <div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 10px; padding-top: 20px; padding-left: 0; padding-right: 0;" >
		         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
		            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
		         </div>
		         <div class="col-md-6" style="border: 0px solid red;"></div>
		         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
		            <button type="button" onclick="gomap();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
		         </div>
	        </div>
	        </div> 
	
	      </div>
	
	      <div class="col-md-4" style="border: 0px solid blue;">
	         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
	      </div>
	
	   </div>
	</div>
</form>
