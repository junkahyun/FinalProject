<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <script src="/js/embed/highlight.pack.js"></script>
<script src="/js/embed/embed.js"></script>
<link rel="stylesheet" media="screen" href="/css/embed/embed-light.css" /> -->
<link rel="stylesheet" media="screen" href="//fonts.googleapis.com/css?family=Inconsolata" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">     -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://www.cssscript.com/demo/animated-customizable-range-slider-pure-javascript-rslider-js/css/rSlider.min.css">


<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlVD1-NAOFaAxcEbj82AwExEZKyEXFPzM&libraries=places&callback=initAutocomplete" async defer></script>
<script src="https://www.cssscript.com/demo/animated-customizable-range-slider-pure-javascript-rslider-js/js/rSlider.min.js"></script>
 
 
 <script type="text/javascript">
 
 $(document).ready(function(){
	var flag = false;
	 $(".optioninput").click(function(){
		 if(!flag){
			 var $target = $(event.target);
			 $target.addClass("subjectstyle");	
			 flag = true;
		 }
		 else{
			 var $target = $(event.target);
			 $target.removeClass("subjectstyle");	
			 flag = false;
		 }
	 });
	 
	 $(".person").spinner({
         spin : function(event, ui) {
            if (ui.value > 100) {
               $(this).spinner("value", 100);
               return false;
            }
            else if (ui.value < 0) {
               $(this).spinner("value", 0);
               return false;
            }
         }
      }); // end of $("#spinnerPqty").spinner();---------------
	 
 });
 
        var height;
        var force_height = null;
        var slug = "gg2hqba3";
        var show_src = "//fiddle.jshell.net/gg2hqba3/1/show/light/";
        var resize_element_counter = 0;
        var shell_edit_url = "/gg2hqba3/1/light/";

	var placeSearch, autocomplete;
	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete(
	                                      (document.getElementById('autocomplete')),{types: ['geocode']});
	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}
	
	function fillInAddress() {
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();
	    document.getElementById("lat").value=place.geometry.location.lat();
	    document.getElementById("lng").value=place.geometry.location.lng();
	}        
        
	// 달력
	$(function() {
    	$( ".datepicker" ).datepicker({
      	numberOfMonths: 2,
      	showButtonPanel: true
    	});
    });
	
	// 가격대 슬라이드바
	$(function () {
        'use strict';

        var init = function () {  
            var slider3 = new rSlider({
                target: '#slider3',
                values: {min: 0, max: 150},
                step: 10,
                range: true,
                set: [0, 40],
                scale: true,
                labels: true,
                width: null,
				tooltip:true,
                onChange: function (vals) {                    
                }
            });
        };
        window.onload = init;
    });
        
</script>

<style>
div{
    border: 0px solid;
}

.subjectstyle {font-weight: bold;
    	           color: red;
    	           cursor: pointer; }
.optionName{
    font-size: 16px; 
    font-weight: 800;
    margin-bottom: 3%;
    border: none;
    background: none;
    padding: 0;
}
.foldText{
    font-size: 0.8em;
    color:gray;
}
.optionname{
	font-size: 11pt;
	font-weight: bold;
	
}
.dropBtn{
    width:100%; 
    background: none; 
    border: 1px solid lightgray; 
    border-radius: 3px; 
    height: 35px;
}
.dropBtn:hover{
    background-color: #f1f1f1;
    border: 1px solid #f1f1f1;
    transition: 0.5s;
}
#optionSection{
	height: 230px;
	width: 99.1vw; 
	background-color: #f1f1f1;
	padding-top: 14px;
	margin:0;
}
.optionbox{
	height:40px;
	width: 100%;
	border: none;
	margin-bottom:14px;
	background-color:white;
	padding-left: 14px;
	padding-top: 10px;
}
.optioninput{
	border:none;
}
#optionLeft,#optionRight{
	height:100%;
}
</style>
<body>
	<div id="optionSection" class="row">
        <div id="optionLeft" class="col-md-5">
        <div>
            <div id="locationField" class="optionbox">
            	<span class="optionname">지역</span>
            	<input id="autocomplete" placeholder="지역을 입력하세요." type="text" style="border: 0px solid; margin-left: 110px;">            	
            	<input type="hidden" class="field" id="lat" />
				<input type="hidden" class="field" id="lng" />
            </div>
           
           	<div class="optionbox">
            	<span class="optionname">날짜</span>
            	<input type="text" class="datepicker" placeholder="체크인 날짜" style="margin-left: 110px; width: 100px;">&nbsp;~&nbsp;
            	<input type="text" class="datepicker" placeholder="체크아웃 날짜" style="width: 100px;">
            </div>  
            
            <div class="optionbox">
            	<span class="optionname">임대유형</span>
            	<span class="optioninput" id="lental" style="margin-left: 80px; padding-right: 70px; cursor: pointer;">완전한 렌탈</span>
            	<span class="optioninput" id="single" style="padding-right: 70px; cursor: pointer;">별도의 싱글룸</span>
            	<span class="optioninput" id="share" style="cursor: pointer;">쉐어 룸</span>
            </div>
        </div>
            <div class="optionbox">
            	<span class="optionname" style="margin-right: 80px;">인원 (명)</span>
            	<span style="margin-right: 50px;">성인&nbsp;<input class="person" name="pqty" style="width: 30px; height: 18px;" /></span>
            	<span style="margin-right: 50px;">어린이(2~12세)&nbsp;<input class="person" name="pqty" style="width: 30px; height: 18px;" /></span>
            	<span style="margin-right: 50px;">유아(2세 미만)&nbsp;<input class="person" name="pqty" style="width: 30px; height: 18px;" /></span>
            </div>
            
            <div class="optionbox">67<input type="text" class="optioninput"/></div>
        </div>
        <div id="optionRight" class="col-md-7">
        	<div class="optionbox">
        		<span class="optionname" style="margin-right: 50px;">가격(만원)</span>
        		<input type="text" id="slider3" class="slider" />
        	</div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
        </div>
    </div>
    <div class="row" style="width: 100vw">
        <div class="col-md-4" style="height:100vh;margin:0; padding:0;">
            <img src="images/test1.png" style="width:100%;height:100vh;padding:0;margin: 0;"/>
        </div>
        <div class="col-md-8" style="height:100vh; padding: 1%;">
            <div class="row">
            	<c:forEach items="${testList}" var="test">
                <div class="col-md-4" style="margin-bottom: 2%;">
                    <div style="margin-bottom: 3%;">
                        <img src="https://a0.muscache.com/im/pictures/68d2bca8-bf81-489a-9ba7-b6a24f91557d.jpg?aki_policy=large" style="border-radius: 5px; width: 100%;" />
                    </div>
                    <div>
                        <span style="font-size: 0.8em; font-weight: bold;">개인실 · 침대 2개</span>
                    </div>
                    <div>
                        <span style="font-weight:bold; font-size:1.2em;">Sometimesjeju 201호!안전도어락! 통유리오션뷰!제주공항7.8km!</span>
                    </div>
                    <div>
                        <span>₩65,000/박</span>
                    </div>
                    <div>
                        <span style="font-size: 0.8em;"><span style="color: #148387">★★★★★</span>203</span>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>	
</body>