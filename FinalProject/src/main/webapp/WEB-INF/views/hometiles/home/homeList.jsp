<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="edit-Type" edit="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<meta name="robots" content="index, follow">
<meta name="googlebot" content="index, follow">
<script src="/js/embed/highlight.pack.js"></script>
<script src="/js/embed/embed.js"></script>
<link rel="stylesheet" media="screen" href="/css/embed/embed-light.css" />
<link rel="stylesheet" media="screen" href="//fonts.googleapis.com/css?family=Inconsolata" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlVD1-NAOFaAxcEbj82AwExEZKyEXFPzM&libraries=places&callback=initAutocomplete" async defer></script>

 <script type="text/javascript">
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
	$( function() {
    $( "#datepicker" ).datepicker({
      numberOfMonths: 2,
      showButtonPanel: true
    });
  } );
	
        
</script>

<style>
div{
    border: 0px solid;
}
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
            	지역
            	<input id="autocomplete" placeholder="지역을 선택하세요." type="text" style="border: 0px solid; margin-left: 120px;">
            	<input type="hidden" class="field" id="lat" />
				<input type="hidden" class="field" id="lng" />
           	
            	<input type="text" id="datepicker" placeholder="체크인 날짜">&nbsp;~&nbsp;
            	<input type="text" id="datepicker" placeholder="체크아웃 날짜">
            </div>
            <div class="optionbox">임대유형
            	<span class="optioninput" style="margin-left: 130px; padding-right: 100px;">완전한 렌탈</span>
            	<span class="optioninput" style="padding-right: 100px;">별도의 싱글룸</span>
            	<span class="optioninput" style="padding-right: 100px;">쉐어 룸</span>
            </div>
        </div>
            <div class="optionbox">43<input type="text" class="optioninput"/></div>
            <div class="optionbox">12<input type="text" class="optioninput"/></div>
            <div class="optionbox">67<input type="text" class="optioninput"/></div>
        </div>
        <div id="optionRight" class="col-md-7">
        	<div class="optionbox"><input type="text" class="optioninput"/></div>
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