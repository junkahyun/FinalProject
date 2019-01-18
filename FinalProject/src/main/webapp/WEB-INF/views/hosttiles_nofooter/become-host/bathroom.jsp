<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

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

   
   //욕실 감소 버튼
   function bathroomsminus() {
	   var start = $("#bathroomsupdown").text();
	   var minus = parseInt(start);
	   minus--;
	   if(minus<0){
		   alert("욕실수는 0개 이상이여야 합니다.");
		   minus = 0;
	   }
	   $("#bathroomsupdown").text(minus);
   }  
   
   //욕실 증가 버튼
   function bathroomsplus() {
	   var start = $("#bathroomsupdown").text();
	   var plus = parseInt(start);
	   plus++;
	   $("#bathroomsupdown").text(plus);
   }
   
</script> 



<!-- header -->

<div>
   <div class="row" style="border: 0px solid green;">
 
   <!-- 진행상태 바 -->
   <div class="container col-md-12" style="border: 0px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:10%; background-color: #148487;">
	    </div>
	  </div>
	</div>
  
      <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
      
         <div class="row">
	         <div class="title">욕실 수</div>
	         <div class="row" style="padding: 0; border: 0px solid green;" >
	         	<div class="col-md-9" style="margin-top: 30px; border: 0px solid blue;">
	         		<div class="col-md-6" style="font-size: 16px; font-weight: bolder; border: 0px solid red; margin-top: 6px; padding: 0">욕실</div>
	         		<div class="col-md-2" style="border: 0px solid green;">
	         		 	<button type="button" onclick="bathroomsminus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">-</button>
	         		</div>
	         		<div class="col-md-1" id="bathroomsupdown" style="font-weight: bolder; font-size: 18px; margin-top: 6px;"> 1 </div>
	         		<div class="col-md-2" style="border: 0px solid green;">
	         		 	<button type="button" onclick="bathroomsplus();" style="width: 34px; height: 34px; background-color: white; border: 1px solid #148487; border-radius: 100px; color: #148487; font-size: 1.5em">+</button>
	         		</div>
	         	</div>                    			            
	         </div>
	
	       	<div class="col-md-3" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
		         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
		            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
		         </div>
		         <div class="col-md-6" style="border: 0px solid red;"></div>
		         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
		            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
		         </div>
	        </div>
        </div>
              
      </div>
 
      <div class="col-md-4" style="border: 0px solid blue;">
         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
      </div>
      
   </div>
</div>

<!-- footer -->


