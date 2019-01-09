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
          
    #cklist{font-size: 16px;
    		color: #5D5D5D;}
	#cklistDetail{font-size: 13px;
	color: #5D5D5D;}

</style>

<div>
   <div class="row" style="border: 0px solid green;">

   <div class="container col-md-12" style="border: px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
	    </div>
	  </div>
	</div> 

      <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 1px solid red;">
         <div class="title">어떤 편의시설을 제공하시나요?</div>
         <div class="row" style="padding: 0; border: 1px solid green;" >
            <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 1px solid blue;">
				 <div class="row" style="border: 1px solid red; padding-left: 2px;">   
                        <div class="col-md-1" style="border: 1px solid black; ">
                              <input type="radio" id="a" name="option"/>
                        </div>

                        <div class="col-md-11" style="border: 1px solid blue;" >
                              <label for="a">
                              	<span id="cklist">필수 품목</span><br/>
                              	<span id="cklistDetail">수건, 침대 시트, 비누, 화장지, 베개</span>
                              
                              </label>
                        </div>
                 </div>
                 
                 <div class="row" style="border: 1px solid red; padding-left: 2px; margin-top: 25px;">   
                        <div class="col-md-1" style="border: 1px solid black; ">
                              <input type="radio" id="b" name="option"/>
                        </div>

                        <div class="col-md-11" style="border: 1px solid blue;" >
                              <label for="b">
                              	<span id="cklist">필수 품목</span><br/>
                              	<span id="cklistDetail">수건, 침대 시트, 비누, 화장지, 베개</span>
                              
                              </label>
                        </div>
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

      <div class="col-md-4" style="border: 0px solid blue;">
         <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
      </div>

   </div>
</div>
