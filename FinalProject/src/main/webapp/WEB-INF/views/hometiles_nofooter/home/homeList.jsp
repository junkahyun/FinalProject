<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

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
	//alert($(".roomcode").val());
	
	 var result1 = "";
	 var rulenameArr = new Array();	      
     var optionnameArr = new Array();
     var roomtypenameArr = new Array();
     var roomcodeArr = new Array();
     
	 $(".option").click(function(){
		 var thisText = $(this).text()
		 var $target = $(event.target);	 		
		
		 // 폰트 색깔 바꾸기
		 if(!$target.hasClass("subjectstyle")){			
			 $target.addClass("subjectstyle"); 
        	  result1 += thisText + ",";	
		 }		 
		 else{			
			 $target.removeClass("subjectstyle");
        	  result1 = result1.replace($(this).text()+",","");
		 }		  
		//	alert(result1);
	 	$("#data1").val(result1);
		
		 // 문자열 자르기
	      var jbString = result1;
	      var jbSplit = jbString.split(','); 
	      var resultArr = new Array();
	      
	      
	      if($(this).parent().hasClass("rulename")){
	    	if(rulenameArr.includes($(this).text())){
	    		var sindex = rulenameArr.indexOf($(this).text()); 
	    		rulenameArr.splice(sindex,1);	    		
	    	}else{
     			rulenameArr.push($(this).text());
	    	}
	      }else if($(this).parent().hasClass("roomtype_name")){
      		if(roomtypenameArr.includes($(this).text())){
      			var sindex = roomtypenameArr.indexOf($(this).text()); 
      			roomtypenameArr.splice(sindex,1);
	    	}else{
	    		roomtypenameArr.push($(this).text());
	    	}
	      }else{
      		if(optionnameArr.includes($(this).text())){
      			var sindex = optionnameArr.indexOf($(this).text()); 
      			optionnameArr.splice(sindex,1);
	    	}else{
	    		optionnameArr.push($(this).text());
	    	}
	      }   
	       
	      //alert("rulenameArr : " + rulenameArr);
	      //alert("roomtypenameArr : " + roomtypenameArr);
	      //alert("optionnameArr : " + optionnameArr);
	      
	      jQuery.ajaxSettings.traditional = true;
	      /* ,
 		   "roomcode" : roomcodeArr */
	//    alert(typeof rulenameArr);
	      var form_data = {"rulename" : rulenameArr,
	    		  		   "roomtype_name" : roomtypenameArr,
	    		  		   "optionname" : optionnameArr,
	    		  		   city : $("#city").val()};
	      var html = "";
	      
		  $.ajax({
			    url: "<%=request.getContextPath()%>/optionJSON.air",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(json){ 					
					 $("#allList").empty();
													 
					 $.each(json, function(entryIndex, entry){
						html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
							  + "<div id='homeImg' style='margin-bottom: 3%;'>"
							  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
							  + "</div>"
							  + "<div>"
							  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
							  + "</div>"
							  + "<div>"
							  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
							  + "</div>"
							  + "<div>"
							  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
							  + "</div>"
							  + "<div>"
							  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
							  + "<input type='hidden' name='roomcode' value=''/>" 
							  + "</div>"
							  + "</div>";
					});// end of $.each()-------------  
					 
					$("#allList").append(html); 	  
						
				},
				error: function(request, status, error){
				    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
	      });
	      
	 });
	  
	 // 지역 선택 시 그 지역의 숙소 리스트  Ajax 처리
	 $("#city").change(function(){
		//  alert($("#city").val());
		
		 var form_data = {checkin : $("#checkin").val(),
				 		 checkout : $("#checkout").val(),
				 		 buildName2 : $("#buildName2").val(),
				 		 startprice : $(".startprice").val(),
				 		 endprice : $(".endprice").val(),
				 		 city : $("#city").val(),
				 		 allperson : $("#allperson").val()};
		var html = "";
		 
		 $.ajax({
			url : "<%=request.getContextPath()%>/homeListByOption.air",
	   		type : "GET",
			data : form_data,
			dataType : "JSON",
			success : function(json){ 
				$("#allList").empty();
				 
				 $.each(json, function(entryIndex, entry){
					html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
						  + "<div id='homeImg' style='margin-bottom: 3%;'>"
						  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
						  + "</div>"
						  + "<div>"
						  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
						  + "</div>"
						  + "<div>"
						  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
						  + "<input type='hidden' name='roomcode' value=''/>" 
						  + "</div>"
						  + "</div>";
				});// end of $.each()-------------  
				 
				$("#allList").append(html); 	  
			},
            error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
		 });
		 
	 });  // end of 
	 	 
	 // 체크인 - 체크아웃 선택시 Ajax 처리 
	 $("#checkout").on("change", function(){	
		 
		if($("#checkin").val() == ""){
			alert("체크인 날짜를 먼저 선택하세요!");
			$("#checkout").val("");			
			$("#checkin").focus();
			return;
		}
		
		var form_data = {checkin : $("#checkin").val(),
				 		 checkout : $("#checkout").val(),
				 		 buildName2 : $("#buildName2").val(),
				 		 startprice : $(".startprice").val(),
				 		 endprice : $(".endprice").val(),
				 		 city : $("#city").val(),
				 		 allperson : $("#allperson").val()};
		var html = "";
		$.ajax({			
			url : "<%=request.getContextPath()%>/homeListByOption.air",
			type : "GET",
			data : form_data,
			dataType : "JSON",
			success : function(json){
				$("#allList").empty();
				 
				 $.each(json, function(entryIndex, entry){
					html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
						  + "<div id='homeImg' style='margin-bottom: 3%;'>"
						  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
						  + "</div>"
						  + "<div>"
						  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
						  + "</div>"
						  + "<div>"
						  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
						  + "<input type='hidden' name='roomcode' value=''/>" 
						  + "</div>"
						  + "</div>";
				});// end of $.each()-------------  
				 
				$("#allList").append(html); 	  
			},
            error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
			
		});
		
	 });
	
	 // 인원 수 스피너
	 $("#adult").spinner({				 
         spin : function(event, ui) {
            if (ui.value > 100) {
               $(this).spinner("value", 100);
               return false;
            }
            else if (ui.value < 0) { 
               $(this).spinner("value", 0);
               return false;
            }                    
          var adult = ui.value;                  
          $("#adult").val(adult);
          
          var adult = $("#adult").val();
          var student = $("#student").val(); 
          var baby = $("#baby").val();
          
          var allperson = parseInt(adult)+parseInt(student)+parseInt(baby);
          $("#allperson").val(allperson);
          fun_personcount();                           
         }
	 
      }); // end of $(".person").spinner();---------------  
     
      $("#student").spinner({				 
          spin : function(event, ui) {
             if (ui.value > 100) {
                $(this).spinner("value", 100);
                return false;
             }
             else if (ui.value < 0) { 
                $(this).spinner("value", 0);
                return false;
             }                    
           var student = ui.value;                   
           $("#student").val(student);

           var adult = $("#adult").val();
           var student = $("#student").val();
           var baby = $("#baby").val();
           
           var allperson = parseInt(adult)+parseInt(student)+parseInt(baby);
           $("#allperson").val(allperson);
           fun_personcount();
          }
       }); // end of $(".person").spinner();---------------  
       
       $("#baby").spinner({				 
           spin : function(event, ui) {
              if (ui.value > 100) {
                 $(this).spinner("value", 100);
                 return false;
              }
              else if (ui.value < 0) { 
                 $(this).spinner("value", 0);
                 return false;
              }                    
            var baby = ui.value;                    
            $("#baby").val(baby);
            
            var adult = $("#adult").val();
            var student = $("#student").val();
            var baby = $("#baby").val();
            
            var allperson = parseInt(adult)+parseInt(student)+parseInt(baby);
            $("#allperson").val(allperson);
            fun_personcount();
           }
        }); // end of $(".person").spinner();---------------  
        
        <%-- $("#allperson").change(function(){
        	alert("여기오니?");        	
        	var form_data = {checkin : $("#checkin").val(),
					 		 checkout : $("#checkout").val(),
					 		 buildName2 : $("#buildName2").val(),
					 		 startprice : $(".startprice").val(),
					 		 endprice : $(".endprice").val(),
					 		 city : $("#city").val(),
					 		 allperson : $("#allperson").val()};
			var html = "";
			
			$.ajax({
				url : "<%=request.getContextPath()%>/homeListByOption.air",
				type : "GET",
				data : form_data,
				dataType : "JSON",
				success : function(json){
					$("#allList").empty();
					 
					 $.each(json, function(entryIndex, entry){
						html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
							  + "<div id='homeImg' style='margin-bottom: 3%;'>"
							  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
							  + "</div>"
							  + "<div>"
							  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
							  + "</div>"
							  + "<div>"
							  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
							  + "</div>"
							  + "<div>"
							  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
							  + "</div>"
							  + "<div>"
							  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
							  + "<input type='hidden' name='roomcode' value=''/>" 
							  + "</div>"
							  + "</div>";
					});// end of $.each()-------------  
					 
					$("#allList").append(html); 	  
				},
		       error: function(request, status, error){
		           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		       }	
			});
        	
        }); --%>
                 
      // 건물유형 대/소분류 Ajax 처리
      $("#buildName1").change(function(){
    	  
    	  var form_data = {buildName1 : $("#buildName1").val()};
    	  var html = "";   	  
    	 
    	  $.ajax({
    		 url : "<%=request.getContextPath()%>/homeName.air",
    		 type : "GET",
    		 data : form_data,
    		 dataType : "JSON",
    		 success : function(json){
    			// alert("성공좀하자 ");
    			html += "<option value=''>:::선택하세요:::</option>";
    			$("#buildName2").append(html);
    			$.each(json, function(entryIndex, entry){
					html += "<option>"+entry.buildDetailName+"</option>";
				});// end of $.each()-------------
				
    			 $("#buildName2").empty().append(html); 
    		 },
             error: function(request, status, error){
                 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
             }
    	  });
    	  
      });
      
      // 건물유형 소분류를 선택했을 시 Ajax 처리
      $("#buildName2").change(function(){
    	 
    	  var form_data = {checkin : $("#checkin").val(),
				 		   checkout : $("#checkout").val(),
				 		   buildName2 : $("#buildName2").val(),
				 		   startprice : $(".startprice").val(),
				 		   endprice : $(".endprice").val(),
				 		   city : $("#city").val(),
				 		   allperson : $("#allperson").val()};
    	  var html = "";
    	  
    	  $.ajax({
    		  url : "<%=request.getContextPath()%>/homeListByOption.air",
    		  type : "GET",
    		  data : form_data,
    		  dataType : "JSON",
    		  success : function(json){
    			  $("#allList").empty();
    			  $.each(json, function(entryIndex, entry){
    				  html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
						  + "<div id='homeImg' style='margin-bottom: 3%;'>"
						  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
						  + "</div>"
						  + "<div>"
						  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
						  + "</div>"
						  + "<div>"
						  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
						  + "<input type='hidden' name='roomcode' value=''/>" 
						  + "</div>"
						  + "</div>";
  				  });// end of $.each()-------------
  				  
  				  
    			  
    			  $("#allList").html(html); 
  				  
    		  },
              error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
    	  });
    	  
      });
      
 });
 
 
    function fun_personcount() {
    	
     //	alert("여기오니?");        	
       	var form_data = {checkin : $("#checkin").val(),
				 		 checkout : $("#checkout").val(),
				 		 buildName2 : $("#buildName2").val(),
				 		 startprice : $(".startprice").val(),
				 		 endprice : $(".endprice").val(),
				 		 city : $("#city").val(),
				 		 allperson : $("#allperson").val()};
		var html = "";
		
		$.ajax({
			url : "<%=request.getContextPath()%>/homeListByOption.air",
			type : "GET",
			data : form_data,
			dataType : "JSON",
			success : function(json){
				$("#allList").empty();
				 
				 $.each(json, function(entryIndex, entry){
					html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
						  + "<div id='homeImg' style='margin-bottom: 3%;'>"
						  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
						  + "</div>"
						  + "<div>"
						  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
						  + "</div>"
						  + "<div>"
						  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
						  + "</div>"
						  + "<div>"
						  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
						  + "<input type='hidden' name='roomcode' value=''/>" 
						  + "</div>"
						  + "</div>";
				});// end of $.each()-------------  
				 
				$("#allList").append(html); 	  
			},
	       error: function(request, status, error){
	           alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	       }	
		});    
    	
    }// end of fun_personcount()-----------------------------
 
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
                values: {min: 0, max: 50},
                step: 5,
                range: true,
                set: [0, 50],
                scale: true,
                labels: true,
                width: "1700",
				tooltip:true,
                onChange: function (vals) {          
                //alert(vals);	
                	var jbString = vals
            		var jbSplit = jbString.split(',');
            				
                	var startPrice = jbSplit[0]*10000;
        			var endPrice = jbSplit[1]*10000;
                	
        			$("#slider1").val(startPrice);
	            	$("#slider2").val(endPrice); 
	            	
           	var form_data = {checkin : $("#checkin").val(),
			 				 checkout : $("#checkout").val(),
					 		 buildName2 : $("#buildName2").val(),
					 		 startprice : $(".startprice").val(),
					 		 endprice : $(".endprice").val(),
					 		 city : $("#city").val(),
					 		 allperson : $("#allperson").val()};
	       	         	 
	       	  var html = "";
	       	  
	       	  $.ajax({
	       		  url : "<%=request.getContextPath()%>/homeListByOption.air",
	       		  type : "GET",
	       		  data : form_data,
	       		  dataType : "JSON",
	       		  success : function(json){
	       			  $("#allList").empty();
	       			  $.each(json, function(entryIndex, entry){
	       				  html += "<div class='col-md-4' style='margin-bottom: 2%;'>" 					     
	   						  + "<div id='homeImg' style='margin-bottom: 3%;'>"
	   						  + "<img src='"+entry.ROOMMAINIMG+"' style='border-radius: 5px; width: 100%; height:20em; cursor: pointer;' onClick='goHomeDetail()' />"
	   						  + "</div>"
	   						  + "<div>"
	   						  + "<span style='font-size: 0.8em; font-weight: bold;'>개인실 · 침대 2개</span>"
	   						  + "</div>"
	   						  + "<div>"
	   						  + "<span id='roomName${status.index}' style='font-weight:bold; font-size:1.2em; width: 100%; border: 0px;'>"+entry.ROOMNAME+"</span>"
	   						  + "</div>"
	   						  + "<div>"
	   						  + "<span>₩<fmt:formatNumber pattern='#,###' value=''/>"+entry.ROOMPRICE+"</span>원"
	   						  + "</div>"
	   						  + "<div>"
	   						  + "<span style='font-size: 0.8em;'><span style='color: #148387'>★★★★★</span>203</span>"
	   						  + "<input type='hidden' name='roomcode' value=''/>" 
	   						  + "</div>"
	   						  + "</div>";
	     				  });// end of $.each()-------------
	       			  
	       			  $("#allList").html(html); 
	     				  
	       		  	 },
	                 error: function(request, status, error){
	                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	                 }
	           });  
            				
                }
            });
        };
        window.onload = init;
    });
	
	function goHomeDetail() {
		
		var frm = document.homeListFrm;
		
		frm.method = "GET";
		frm.action = "<%=ctxPath%>/homeDetail.air";
		frm.submit();
	}
    
</script>
<body>
	<form name=homeListFrm>
	<div id="optionSection" class="row menu">
	
        <div id="optionLeft" class="col-md-5">
        
            <div id="locationField" class="optionbox">
            	<span class="optionname">지역 선택</span>
            	<select id="city" name="city" style="border-right: 1px solid gray; margin-left: 6%; margin-right: 7%; width: 15%; height: 80%;">
            		<c:forEach items="${roomList }" var="RList">
            		<option value="${RList.roomSigungu }">${RList.roomSigungu }</option>
            		</c:forEach>            		         		
            	</select>            
            	
            	<span class="optionname">날짜</span>
            	<input type="text" id="checkin" class="datepicker" name="checkin" placeholder="체크인 날짜" style="margin-left: 5%; width: 15%; height: 80%; margin-right: 2%;" />~
            	<input type="text" id="checkout" class="datepicker" name="checkout" placeholder="체크아웃 날짜" style="width: 15%; height: 80%; margin-left: 2%;" />   
            	<c:forEach items="${roomList }" var="RList" varStatus="status">
            		<input type="hidden" id="cnt${status.index}" class="cnt" value="${status.index}" />
            		<input type="hidden" id="lat${status.index}" class="lat" name="lat" value="${RList.latitude }" />
            		<input type="hidden" id="lng${status.index}" class="lng" name="lat" value="${RList.longitude }" />
            	</c:forEach>       	
            </div>
           
           	<div class="optionbox">
            	<span class="optionname" style="margin-right: 6.5%;">인원 (명)</span>            
            	<span style="margin-right: 6%;">성인&nbsp;<input id="adult" class="person" value="0" name="pqty" height="48"/></span>
            	<span style="margin-right: 6%;">어린이(2~12세)&nbsp;<input id="student" class="person" value="0" name="pqty"/></span>
            	<span>유아(2세 미만)&nbsp;<input id="baby" class="person" value="0" name="pqty"/></span>            	  
            	<input type="hidden" id="allperson" name="allperson" />            	
            </div>  
            
            <div id="rulename" class="optionbox rulename">
            	<span class="optionname">이용 규칙</span>
            	<c:forEach items="${roomRule}" var="rule">
            		<span class="rule option" style="margin-left: 6%; cursor: pointer;">${rule}</span>&nbsp;            		
            	</c:forEach>
            	<input type="hidden" id="data1" name="rulename"/>
            	
            </div>        
           
        </div>
        
        <div id="optionRight" class="col-md-7">
        
        	<div class="optionbox">
        		<span class="optionname" style="margin-right: 4%;">건물 유형</span>
        		<select id=buildName1 name="buildName1" style="border-right: 1px solid gray; margin-left: 5%; height: 80%;">
            		<option value="">:::선택하세요:::</option>
            		<c:forEach items="${buildList}" var="buildName">	            	
	            		<option value="${buildName}">${buildName}</option>            		           		
            		</c:forEach>                	
        		</select>
        		<select id="buildName2" name="buildName2" style="border-right: 1px solid gray; margin-left: 5%; margin-right: 15%; height: 80%;">
        			<option value=''>:::선택하세요:::</option>
        				
        		</select>
        	</div>
            
            <div id="roomtype_name" class="optionbox roomtype_name">            	
            	<span class="optionname" style="margin-right: 9%;">임대 유형</span>
            	<c:forEach items="${roomType}" var="room">
            		<span class="buildType option" style="margin-right: 11.5%; cursor: pointer;">${room}</span>&nbsp;
            	</c:forEach>              
            	<input type="hidden" id="data2" name="roomtype_name"/>	                  	
            </div>
            
            <div class="optionbox row" id="service" style="padding:0; margin:0;width:100%;">
            	<div class="optionname col-md-2">고객 편의</div>
           		<c:forEach items="${optionList}" var="option" varStatus="status">  			
           		<c:if test="${status.index==5 }"><div class="col-md-2"></div></c:if>		
           		<span class="option col-md-2 easy" style=" display:block; margin:0;padding:0; cursor: pointer;">${option}</span>
           		</c:forEach>  
           		<input type="hidden" id="data3" name="optionname"/>
            </div> 
                        
        </div>
                
         <div class="col-md-12 optionbox last_optionbox" >
           	<span class="optionname" style="margin-right: 3%;">가격 (만 원)</span>
       		<input type="hidden" id="slider1" class="startprice" name="startprice" />
       		<input type="hidden" id="slider2" class="endprice" name="endprice" />
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
	           level: 5 // 지도의 확대 레벨
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
		           	           		           
		           // 마커가 표시될 위치입니다 
		           var markerPosition = "";
		           for(var i=0; i<20; i++ ){
		        	    var latid = 'lat' +i;
		        	    var lngid = 'lng' +i;
		        	    
		        	    var latitude = $('#'+latid).val();
		        	    var longitude = $("#"+lngid).val();
		        	    // alert(latitude);
			        	//alert((document.getElementById(latid)).value);
			        	//alert((document.getElementById(lngid)).value); 
		        	   
		           		markerPosition  = new daum.maps.LatLng(latitude, longitude);
		           	   var marker = new daum.maps.Marker({
			               map: map,
			               position: markerPosition
			           });
		           	   
		           	   var rnid = 'roomName' + i;
		           	   var rn = $('#'+rnid).text();
		           	   
		           	   if(rn.length >= 30){
		           		   rn = rn.substr(0,30)+'...';
		           		  $("#"+rnid).html(rn);
		           	   }		           	  
		           }
		           
		           /* document.getElementById('lat').value, document.getElementById('lng').value */
		           
		           // 결과값으로 받은 위치를 마커로 표시합니다
		           
		   
		         /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
		           var infowindow = new daum.maps.InfoWindow({
		               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+document.getElementById("city").value+'</div>'
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
            <div id="allList" class="row">
            <c:forEach items="${roomList}" var="RList" varStatus="status">
                <div  class="col-md-4" style="margin-bottom: 2%;">               
                    <div id="homeImg" style="margin-bottom: 3%;">
                        <img src="${RList.roomMainImg }" style="border-radius: 5px; width: 100%; height:20em; cursor: pointer;" onClick="goHomeDetail()" />
                    	<input type="hidden" id="roomcode${status.index}"class="roomcode" name="roomcode" value="${RList.roomcode }" />
                    </div>
                    <div>
                        <span style="font-size: 0.8em; font-weight: bold;">${RList.roomType_name} · 침실 <%-- ${RList.roomCount} --%>개 · 침대 <%-- ${RList.bedtype} --%> </span>
                    </div>
                    <div>
                        <%-- <input id="roomName${status.index}" style="font-weight:bold; font-size:1.2em; width: 100%; border: 0px;" value="${RList.roomName }" readonly="readonly"/> --%>
                        <span id="roomName${status.index}" style="font-weight:bold; font-size:1.2em; width: 100%; border: 0px;">${RList.roomName }</span>
                    </div>
                    <div>
                        <span>₩<fmt:formatNumber value="${RList.roomPrice}" pattern="#,###"/></span>원
                        <c:forEach items="${RList.optionList}" var="oplist" varStatus="status">
                        	<input type="hidden" name="optionname" value="${oplist.OPTIONNAME }" />
                        </c:forEach>
                        <c:forEach items="${RList.ruleList}" var="rule" varStatus="status">                       
                       	 	<input type="hidden" name="rulename" value="${rule.RULE_NAME}" />
                        </c:forEach>                         
                        <input type="hidden" name="roomtype_name" value="${RList.roomType_name }" />
                        
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