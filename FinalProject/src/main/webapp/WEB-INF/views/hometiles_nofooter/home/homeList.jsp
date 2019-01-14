<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" media="screen" href="//fonts.googleapis.com/css?family=Inconsolata" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://www.cssscript.com/demo/animated-customizable-range-slider-pure-javascript-rslider-js/css/rSlider.min.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://www.cssscript.com/demo/animated-customizable-range-slider-pure-javascript-rslider-js/js/rSlider.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/homeList.css">


<script type="text/javascript">
 
 $(document).ready(function(){
  flag = false;
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
       
	// 달력
	$(function() { 
    	$( ".datepicker" ).datepicker({     		
    	minDate : 0,
    	prevText: '이전 달',
  	  	nextText: '다음 달',
	  	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	dayNames: ['일','월','화','수','목','금','토'],
	  	dayNamesShort: ['일','월','화','수','목','금','토'],
	  	dayNamesMin: ['일','월','화','수','목','금','토'],
      	numberOfMonths: 2,
      	dateFormat: "yy-mm-dd", 
      	showOtherMonths: true,
      	showButtonPanel: true
    	});
    }); 
   
	// 가격대 슬라이드바
	$(function () {
        'use strict';

        var init = function () {  
            var slider3 = new rSlider({
                target: '#slider3',
                values: {min: 0, max: 160},
                step: 10,
                range: true,
                set: [0, 40],
                scale: true,
                labels: true,
                width: "1850",
				tooltip:true,
                onChange: function (vals) {                    
                }
            });
        };
        window.onload = init;
    });
   
</script>
<body>
	<form>
	<div id="optionSection" class="row menu">
        <div id="optionLeft" class="col-md-4">
        
            <div id="locationField" class="optionbox">
            	<span class="optionname">지역</span>
            	<select id=city style="border-right: 1px solid gray; margin-left: 10%; margin-right: 15%;">
            		<option value="서울">서울</option>
            		<option value="대전">대전</option>
            		<option value="대구">대구</option>
            		<option value="부산">부산</option>            		
            	</select>
            	<!-- <input id="city" placeholder="지역을 입력하세요." type="text" value="부산" style="border: 0px solid; margin-left: 110px;">   -->  
            	
            	<span class="optionname">날짜</span>
            	<input type="text" id="checkin" class="datepicker" placeholder="체크인 날짜" style="margin-left: 10%; width: 18%;">&nbsp;~&nbsp;
            	<input type="text" id="checkout" class="datepicker" placeholder="체크아웃 날짜" style="width: 18%;">   
            	       	
            </div>
           
           	<div class="optionbox">
            	<span class="optionname" style="margin-right: 5.5%;">인원 (명)</span>
            	<span style="margin-right: 2%;">성인&nbsp;<input class="person" name="pqty"  value="0" height="48"/></span>
            	<span style="margin-right: 2%;">어린이(2~12세)&nbsp;<input class="person" name="pqty" value="0"/></span>
            	<span style="margin-right: 2%;">유아(2세 미만)&nbsp;<input class="person" name="pqty"  value="0"/></span>       	
            </div>  
            
            <div class="optionbox">
            	<span class="optionname">이용 규칙</span>
            	<c:forEach items="${roomRule}" var="rule">
            		<input type="checkbox" class="rule" style="margin-left: 5%;"/>&nbsp;${rule}
            	</c:forEach>
            </div>
        
           
        </div>
        
        <div id="optionRight" class="col-md-8">
        	<div class="optionbox">
        		<span class="optionname">건물 유형</span>
            	<c:forEach items="${buildList}" var="buildName">
            		<input type="checkbox" class="buildType" style="margin-left: 5%;"/>&nbsp;${buildName}
            	</c:forEach>                	
        		
        	</div>
            
            <div class="optionbox">            	
            	<span class="optionname">임대 유형</span>
            	<c:forEach items="${roomType}" var="room">
            		<input type="checkbox" class="buildType" style="margin-left: 5%;"/>&nbsp;${room}
            	</c:forEach>   
            	<!-- <span class="optioninput" id="lental" style="margin-left: 7%; padding-right: 10%; cursor: pointer;">완전한 렌탈</span>
            	<span class="optioninput" id="single" style="padding-right: 10%; cursor: pointer;">별도의 싱글룸</span>
            	<span class="optioninput" id="share" style="cursor: pointer;">쉐어 룸</span> -->                      	
            </div>
            <div class="optionbox">
            	<span class="optionname" style="margin-right: 3%;">고객 편의</span>
            	<c:forEach items="${optionList}" var="option">
            		<input type="checkbox" class="option" style="margin-left: 2%;"/>&nbsp;${option}
            	</c:forEach>
            	
            </div> 
        </div>        
         <div class="col-md-12 optionbox last_optionbox" >
           	<span class="optionname" style="margin-right: 3%;">가격 (만 원)</span>
       		<input type="hidden" id="slider3" class="slider" />
   		 </div>
    </div> 
    <div class="row" style="width: 100%; margin-left: 0.1%;">        
        <div class="col-md-4 " style="height:100vh; margin-top: 18px; padding: 0; border: solid;">
            <div style="height: 100%; margin: 0; padding: 0;" id="map" class="optionbox map"></div>

	<script type="text/javascript">	
	   markOnMap();
	   $("select#city").bind("change", function(){
		   markOnMap();
	   });

	   function markOnMap(){
		   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	       mapOption = {
	           center: new daum.maps.LatLng(0,0), // 지도의 중심좌표33.450701, 126.570667
	           level: 3 // 지도의 확대 레벨
	       };  
		   
		   // 지도를 생성합니다    
		   var map = new daum.maps.Map(mapContainer, mapOption); 
		   
		   // 주소-좌표 변환 객체를 생성합니다
		   var geocoder = new daum.maps.services.Geocoder();
		   
		   // 주소로 좌표를 검색합니다
	//	   alert(document.getElementById('city').value);
		   geocoder.addressSearch(document.getElementById('city').value, function(result, status) {
		   
		       // 정상적으로 검색이 완료됐으면 
		        if (status === daum.maps.services.Status.OK) {
		   
		           var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		   
		           // 결과값으로 받은 위치를 마커로 표시합니다
		           var marker = new daum.maps.Marker({
		               map: map,
		               position: coords
		           });
		   
		          /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
		           var infowindow = new daum.maps.InfoWindow({
		               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${address}'+'</div>'
		           });
		           infowindow.open(map, marker); */
		   
		           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		           map.setCenter(coords);
		          
		       } 
		   });   
	   }
	</script>
	
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
    </form>	
</body>