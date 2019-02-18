<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
</head>

<style>

.fa-angle-left:focus{text-decoration: underline;
}

h3{font-weight: bold; margin-top: 5%; margin-bottom: 3%;
}
.btn{background-color: #008489; color: white; 
}
.cancelbtn{background-color: white; color: #008489; border: 1px solid #008489; width: 5%; padding: 1%; font-weight: bold; font-size: 12pt;
}
.successbtn{background-color: #008489; color: white; padding: 1%; width: 5%; font-weight: bold; font-size: 12pt; cursor: auto;
}
input:focus {
  outline: none; 
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
	-webkit-appearance: none;
    margin: 0;

}

input[type="checkbox"]{cursor: pointer;
}
.checkYesorNo{cursor: pointer; font-size: 12pt;
}
.click{border: 1px solid #008489; }

select:focus {
  outline: none; 
}
</style>

<script>

	$(document).ready(function(){
		
		$(".option").click(function(){

  	      $(".option").each(function(){
  	      	var check = $(this).prop("checked");
  	      	
  	      	if(check){
  	      		$(this).parent().find("label").css("background-color","#148487");
  	      	}
  	      	else{
  	      		$(this).parent().find("label").css("background-color","white");
  	      	}
  	      });
  	      		
    	});
		
		$(".rule").click(function(){
		
		   $(".rule").each(function(){
		   	var check = $(this).prop("checked");
		   	
		   	if(check){
		   		$(this).parent().find("label").css("background-color","#148487");
		   	}
		   	else{
		   		$(this).parent().find("label").css("background-color","white");
		   	}
		   });
		   	
		});
	});
	
	function goRoomList(roomcode){
		location.href="hostRoomEdit.air?roomcode="+roomcode;
	}
	
	function saveOptionAndRule(){
		var frm = document.optionAndrule;
		
		var optionchk = $('input[name="optionchk"]:checked').val();
		var rulechk = $('input[name="rulechk"]:checked').val();
		
		if(optionchk == null || rulechk == null){
			alert("옵션 또는 규칙을 정해주세요.");
			return;
		}
		frm.action = "changeOptionAndRule.air";
		frm.method = "GET";
		frm.submit();
	}

</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
   <i class="fas fa-angle-left"></i>&nbsp;
   <a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; "onclick="goRoomList('${roomcode }');">수정사항으로 돌아가기</a>

	<h3 >어떤 편의시설을 제공하시나요?</h3>
	<!-- 체크인과 체크아웃 -->
	<hr style="width: 50%;" align="left">
	<!-- <div>
		<div class="col-md-6" style="width:25%;">
			<div style="font-size: 0.7rem; margin-bottom: 5%;">
				<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
				<span style="font-size: 13pt; color: black;">필수품목</span>
			</div>
		</div>
		
		<div class="col-md-6" style="width:25%;">
			<div style="font-size: 0.7rem; margin-bottom: 5%;">
				<i class="fas fa-check-square fa-3x" style="cursor: pointer; color: #008489;"></i>&nbsp;&nbsp;
				<span style="font-size: 13pt; color: black;">필수품목</span>
			</div>
			
		</div>
	</div> -->
	<form name="optionAndrule">
	<input type="hidden" id="roomcode" name="roomcode" value="${roomcode }">
	<div class="row" id="fourth">
         <div class="row" style="padding: 0; border: 0px solid green;"  >
            <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 0px solid blue;  width: 50%;">
            
				<c:forEach items="${options}" var="map" varStatus="status"> 
				 	<div class="row" style="border: 0px solid red; padding-left: 15px;"> 
                        <div class="col-md-1" style="border: 0px solid black;">
                              <input type="checkbox" value="${map.option_idx}" name="optionchk" class="option" id="${status.count}option" style="display: none;"/>
                              <label for="${status.count}option" style="width: 20px; height: 20px; border: 1px solid #bcbcbc; display: inline-block;"></label>
                        </div>
                        <div class="col-md-10" style="border: 0px solid blue; margin-bottom: 20px;" >		                        	
                              <label for="${status.count}option">
                              	<span id="cklist">${map.optionname }</span><br/>
                              	<input type="hidden" value="${map.option_idx}"/>		                              
                              </label>		                            
                        </div>  
                 	</div>
                 </c:forEach>	
                 	                 
            </div>
         </div>

       
        
        <h3>이용규칙을 정해주세요</h3>
         <div class="row" style="padding: 0; border: 0px solid green;" >
            <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 0px solid blue; width: 50%;">
            
				<c:forEach items="${rule}" var="map" varStatus="status"> 
				 	<div class="row" style="border: 0px solid red; padding-left: 15px;"> 
                        <div class="col-md-1" style="border: 0px solid black;">
                              <input type="checkbox" value="${map.rule_idx}" name="rulechk" class="rule" id="${status.count}rule" style="display: none;"/>
                              <label for="${status.count}rule" style="width: 20px; height: 20px; border: 1px solid #bcbcbc; display: inline-block;"></label>
                        </div>
                        <div class="col-md-10" style="border: 0px solid blue; margin-bottom: 20px;" >		                        	
                              <label for="${status.count}rule">
                              	<span id="rulelist">${map.rule_name}</span><br/>
                              	<input type="hidden" value="${map.rule_idx}"/>		                              
                              </label>		                            
                        </div>  
                 	</div>
                 </c:forEach>	
                 	                 
            </div>
		</div>
	</div>
	</form>
	<hr style="width: 50%;" align="left">
	<div style="padding-bottom: 5%;">
	<button class="btn successbtn" onClick="saveOptionAndRule();">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="btn cancelbtn"  onclick="goRoomList('${roomcode }');">취소</button>
	</div>
</div>
