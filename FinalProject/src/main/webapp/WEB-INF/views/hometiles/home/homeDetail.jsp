<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href='<%=request.getContextPath()%>/resources/js/fullcalendar.min.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/js/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/homeDetail.css" /> 
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.form.min.js" type="text/javascript"></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/js/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/js/fullcalendar.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script>
	// 기본 예약인원 설정
	var adultCount = 1;
	var babyCount = 0;
	var disabledDays = [];
	$(document).ready(function(){
		// 예약 현황 가져오기
		reservationCheck();
		// 리뷰 가져오기
		getReview("1");
		// 별점설정
		var starhalf = "<img src='<%=request.getContextPath() %>/resources/images/homeDetail/half-star-shape.png' style='weight:20px;height:20px;margin-right:1%;'>";
		var starOne = "<img src='<%=request.getContextPath() %>/resources/images/homeDetail/bookmark-star.png' style='weight:20px;height:20px;margin-right:1%;'>";
		$(".starPointval").val(6);
		$(".starPoint").html(starOne+starOne+starOne);

		$(".starPointUp").click(function(){
			// 현재 별점을 가져와서 값을 올리고 별을 올린다.
			var changeval = parseInt($(this).parent().parent().find(".starPointval").val())+1;
			if(changeval>10){
				alert("별점은 5개 이상 선택이 불가능 합니다.");
				return;
			}
			$(this).parent().parent().find(".starPointval").val(changeval);
			var html = "";
			for(var i=1;i<changeval;i+=2) html += starOne;
			if(changeval%2==1) html += starhalf;
			$(this).parent().parent().find(".starPoint").html(html);
		});
		$(".starPointDown").click(function(){
			var changeval = parseInt($(this).parent().parent().find(".starPointval").val())-1;
			$(this).parent().parent().find(".starPointval").val(changeval);
			if(changeval<0){
				alert("별점은 0개 이하로 선택 불가능 합니다.");
				return;
			}
			var html = "";
			for(var i=1;i<changeval;i+=2) html += starOne;
			if(changeval%2==1) html += starhalf;
			$(this).parent().parent().find(".starPoint").html(html);
		});
		
		//$( ".input-daterange" ).datepicker( "option", "disabled", true );
		
		// 예약인원수 설정
		$("#adultTotal").text(adultCount);
		$("#adultCount").val(adultCount);
		$("#babyCount").val(babyCount);
		$("#babyhide").hide();
		$(".adultCnt").click(function(){
       		var thistext = $(this).text();
        	if(thistext=="+") adultCount ++;
        	else{
        		if(adultCount-1<1){
        			alert("1명 이하로는 선택이 불가능합니다.");
        			return;
        		}
        		adultCount--;
        	}
    		$("#adultCount").val(adultCount);
    		$("#adultTotal").text(adultCount);
       	});
       	$(".babyCnt").click(function(){
       		var thistext = $(this).text();
    		if(thistext=="+") {
    			babyCount++; 
    			if(babyCount+1>1){
        			$("#babyhide").show();
        		}
    		}
        	else {
        		if(babyCount-1<0){
        			alert("0명 이하로는 선택이 불가능합니다.");
        			return;
        		}
        		else if(babyCount-1==0) {
        			$("#babyhide").hide();
        			babyCount=0;
        		}
        		else babyCount--;
        	}
    		$("#babyCount").val(babyCount);
    		$("#babyTotal").text(babyCount);
       	});
       	// 예약창 따라오게 하는 함수
    	var obj = $("#followHY").offset();
    	var objEnd = $("#followEndHY").offset();
       	$(window).scroll(function(event){
        	if($( document ).scrollTop() > obj.top) $("#followHY").addClass("followDiv");
        	else $("#followHY").removeClass("followDiv");
       	});
       	
       	// 후기 검색 설정
       	$("#reviewSearchWord").keydown(function(event){
       		if(event.keyCode==13){
       			getReview("1");
       		}
       	});
       	// 리뷰 작성 ajax
       	$("#reviewInsertBtn").click(function(){
       		reviewInsert();
       	});
       	$("#review_content").keydown(function(){
       		if(event.keyCode==13){
       			reviewInsert();
       		}
       	});
       	$("#rsvBtn").click(function(){
       		var checkinDate = new Date($("#checkInDate").val());
       		var checkOutDate = new Date($("#checkOutDate").val());
       		var diffrent = (checkOutDate-checkinDate)/(1000*60*60*24);
       		if(checkinDate==""||checkOutDate==""){
       			alert("예약날짜를 설정해 주세요.");
       			return;
       		}
       		for(var i=0;i<diffrent;i++){
       			var temp = new Date(checkinDate.getFullYear(),checkinDate.getMonth(),checkinDate.getDate()+(i+1));
       			for(var j=0;j<disabledDays.length;j++){
       				if(disabledDays[j].getTime()==temp.getTime()){
           				alert("예약 할 수 없는 날짜 입니다.");
           				return;
           			}
       			} 
       		}
       		goReserve();
       	});
	});
	function reservationCheck(){
		// 예약현황 달력 설정
		var form_data = {"roomcode":"${room.roomcode}"};
		$.ajax({
			url:"reservationCheck.air",
			type:"POST",
			data:form_data,
			dataType:"JSON",
			success:function(json){
				var rsvArr = [];
				if(json.rsvcheck!=null){
					console.log("예약현황 없음");
				}
				else{
					$.each(json,function(entryIndex,entry){
						rsvArr.push({"title":"예약 불가", "start":entry.checkinDate, "end":entry.checkoutDate});
					});	
					for(var i=0;i<rsvArr.length;i++){
						var startday = new Date(rsvArr[i].start);
						var endday = new Date(rsvArr[i].end);
						var diff = (endday-startday)/(1000*60*60*24);
						for(var i=0;i<diff;i++){
							disabledDays.push(new Date(startday.getFullYear(),startday.getMonth(),startday.getDate()+(i+1)));
						}
					}
				}
				$('#calendar').fullCalendar({
				      header: {
				        left: '',
				        center: 'title',
				      },
				      defaultDate: '2019-01-12',
				      events: rsvArr
				});
				// 예약 날짜 datepicker설정
				$('.input-daterange').datepicker({
					startDate: '-0d',
					forceParse : 'yyyy/mm/dd',
					datesDisabled: disabledDays
				});
				
			},
			error: function(request, status, error){
            	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        	}
		});
	}
	function getReview(currentShowPageNo){
		$("#reviewListFrm").ajaxForm({
			url:"reviewSearch.air",
			type:"GET",
			dataType:"JSON",
			success:function(json){
				var html = "";
    		  	$.each(json,function(entryIndex,entry){
    			 	html+="<div class='row noSpace homeDetailComment' style='margin-top:2%;'>"
                    	+"<div class='col-md-1'><div style='border: 1px solid none; width:50px;height:50px;border-radius:25px;overflow:hidden;'><img src='' style='width:50px;height:50px;'></div></div>"
                 		+"<div class='col-md-10' style='padding-top:0.5%;'><div style='font-weight:bold;'>"+entry.fk_userid+"</div><div>"+entry.review_writedate+"</div></div>"
                 		+"<div class='col-md-1'>icon</div>"
                 		+"<div class='col-md-12' style='margin-top:2%;'>"+entry.review_content+"</div></div>";
    		  	}); 
    		  	$("#reviewArea").html(html);
    		  	// 댓글이 있는경우
    		  	if(json.length>0){
    		  		var totalPage = Math.ceil(json.length/5);
    		  		var pageBarHTML = "";
                	var blockSize = 10;
                	var loop = 1;
                	
                	var pageNo = Math.floor((currentShowPageNo-1)/blockSize) * blockSize + 1;
                	if(pageNo!=1) pageBarHTML += "&nbsp;<a href='javascript:getReview("+(pageNo-1)+");'>[이전]</a>&nbsp;";
                	while(!(loop>blockSize||pageNo>totalPage)){
                		if(pageNo==currentShowPageNo) pageBarHTML += "&nbsp;<a href='javascript:getReview("+pageNo+");' style='color:#148487;font-weight:bold;text-decoration:underline;'>"+pageNo+"</a>&nbsp;";
                		else pageBarHTML += "&nbsp;<a href='javascript:getReview("+pageNo+");'>"+pageNo+"</a>&nbsp;";
                		loop++;
                		pageNo++;
                	}
                	if(!(pageNo>totalPage)) pageBarHTML += "&nbsp;<a href='javascript:getReview("+pageNo+");'>[다음]</a>&nbsp;";
                	$("#pagebar").empty().html(pageBarHTML);
                	pageBarHTML = "";
    		  	}
    		  	else{
    		  		$("#reviewArea").html("<div style='text-align:center;margin-bottom:3%;'>댓글이 존재하지 않습니다.</div>");
    		  		$("#pagebar").empty().html("");
    		  	}
			},
			error: function(request, status, error){
            	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        	}
		})
		$("#reviewListFrm").submit();
	}
	function reviewInsert(){
		var reviewContent = $("#review_content").val();
		if(reviewContent==""){
			alert("리뷰내용을 작성해 주세요.");
			return;
		}
		$("#reviewFrm").ajaxForm({
				url:"reviewInsert.air",
				type:"POST",
				dataType:"JSON",
				success:function(json){
					if(json.n=="1"){
						alert("리뷰가 작성되었습니다.");
						location.reload();
					}
				},
				error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
			})
			$("#reviewFrm").submit();
	}
	function likeRoom(){
    	var saveTitle = $("#saveTitle").val();
      	var roomcode = $("#roomcode").val();
      	var loginuser = "${loginuser}";
      	if(loginuser == null){
         	alert("로그인이 필요합니다.");
         	location.reload();
         	return;
      	}
      	if(saveTitle==""){
         	alert("저장 될 이름을 입력해주세요");
         	return;
      	}
      	var form_data = {"roomcode":roomcode,"userid":"${loginuser.userid}","saveTitle":saveTitle};
      	$.ajax({
         	url:"likeRoom.air",
         	type:"POST",
         	data:form_data,
         	contentType:"application/json; charset=UTF-8",
         	dataType:"JSON",
         	success:function(json){
            	var n = json.n;
	            if(n=="1") alert("등록이 완료되었습니다.");
	            location.reload();
         	},
         	error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
      	});
	}
  	function goReserve(){
  		var frm = document.reserveFrm;
  		frm.guestCount.value=adultCount;
  		frm.babyCount.value=babyCount;
  		frm.action="reservationCheck.air";
  		frm.method="GET";
  	}
  	
</script>
<input type=hidden name="roomcode" id="roomcode" value="${room.roomcode}"/>
<div style="width: 1240px;margin: 0 auto;">
   <div class="row noSpace">
      <div class="col-md-12 noSpace">
         <div class="row noSpace">
            <%-- 메인 이미지 --%>
            <div class="col-md-10" style="height:550px;padding:0;">
               <img src="${room.roomMainImg}"  style="width:100%;height:100%;"/>
            </div>
            <%-- 서브 이미지 --%>
            <div class="col-md-2 noSpace" style="height:550px;overflow:hidden;">
               <div style="width:100%;float:left;"><img src="https://a0.muscache.com/im/pictures/93345256/e2b70362_original.jpg?aki_policy=large"  style="width:100%;height:100%;"/></div>
               <div style="width:100%;float:left;"><img src="https://a0.muscache.com/im/pictures/1117d665-b2a1-4fa4-bc8e-20649b8f525f.jpg?aki_policy=large"  style="width:100%;height:100%;"/></div>
               <div style="width:100%;float:left;"><img src="https://a0.muscache.com/im/pictures/16c9e6db-d825-4f13-95ff-04516fa48e44.jpg?aki_policy=large"  style="width:100%;height:100%;"/></div>
               <div style="width:100%;float:left;"><img src="https://a0.muscache.com/im/pictures/93345171/4b260c7d_original.jpg?aki_policy=large"  style="width:100%;height:100%;"/></div>
            </div>
            <%-- 공유 및 저장버튼 --%>
            <div class="DetailButtonsHY" id="kakao-link-btn" onClick="javascript:;"><img src="<%=request.getContextPath() %>/resources/images/homeDetail/upload.png" style="width:20px;height:20px;"/><span style="margin-left: 15%">공유</span></div>
            <script type='text/javascript'>
			  //<![CDATA[
			    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
			    Kakao.init('d69349d952e3fb841042681c3ba35f75');
			    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
			    Kakao.Link.createCustomButton({
			      container: '#kakao-link-btn',
			      templateId: 14473,
			      templateArgs: {
			        'title': '제목 영역입니다.',
			        'description': '설명 영역입니다.'
			      }
			    });
			  //]]>
			</script>
            <div class="DetailButtonsHY" data-toggle = "modal" data-target="#likeRoom" data-dismiss = "modal" style="right: 30%;"><img src="<%=request.getContextPath() %>/resources/images/homeDetail/heart.png" style="width: 20px; height: 20px;"/><span style="margin-left: 15%">관심</span></div>
         </div>
      </div>
   </div>
   <div class="row maxWidth" style="margin-top:2%;">
      <div class="col-md-8 noSpace">
         <div style="height:99px;">
            <div class="row noSpace">
               <%-- 숙소제목 --%>
               <div class="col-md-10">
                  <div style="font-size:0.8em;">${room.buildType_detail_name}의 ${room.roomType_name }</div>
                  <div id="detailSubject">${room.roomName }</div>
                  <div style="line-height:80%;margin-top:1%;">${room.roomSigungu }</div>
               </div>
               <%-- 호스트 프로필 --%>
               <div class="col-md-2">
                  <div style="border: 1px solid none; height:64px; width:64px; border-radius:40px; background-color:lightgray; overflow:hidden;margin-top: 10%;margin-left:5%;"><img src="<%=request.getContextPath() %>/resources/images/profile/${room.host.profileimg}" style="width:64px;height:64px;"/></div>
                  <div style="font-weight:bold;margin-left:12%;font-size:14pt; margin-top: 15%;">${room.host.userid }</div>
               </div>
            </div>
         </div>
         <%-- 침실/침대 --%>
         <div class="infoDiv" style="font-weight:bold;">
            <img src="<%=request.getContextPath()%>/resources/images/homeDetail/multiple-users-silhouette.png" />
            <span style="margin-right:5%;margin-left:1%;">인원 ${room.basic_person }명</span>
            <span style="margin-right:5%;">침실갯수 ${room.bedroomList.size() }개</span>
            <span style="margin-right:5%;">침대갯수 ${room.bedroomList.size() }개</span>
            <span style="margin-right:5%;">단독사용욕실갯수 ${room.bathCount }</span>
         </div>
         <%-- 호스트 소개 및 숙소 소개 --%>
         <div class="infoDiv">
            ${room.roomInfo }<br/><br/>
            <a class="aTagBtnHY">이 공간 자세히 알아보기</a>
         </div>
         <div class="infoDiv">
            <a class="aTagBtnHY">호스트에게 연락하기</a>
         </div>
         <%-- 편의시설 --%>
         <div class="infoDiv">
            <div class="infoSubjectHY">편의시설</div>
            <div class="row" style="margin:3%;">
            <c:forEach items="${room.optionList }" var="option">
               <div class="col-md-6" style="margin: 1% 0;"><img src="<%=request.getContextPath() %>/resources/images/optionicon/${option.OPTIONICON}" style="width:20px;height:20px; margin-right:3%;"/>${option.OPTIONNAME}</div>
            </c:forEach>
            </div>
            <a class="aTagBtnHY">편의시설 ${room.optionList.size() } 모두 보기</a>
         </div>
         <%-- 침대/침구 --%>
         <c:if test="${room.bedroomList.size() > 0 }">
         <div class="infoDiv">
            <div class="infoSubjectHY">침대/침구</div>
            <div class="row noSpace" style="margin-top:3%;">
               <c:forEach items="${room.bedroomList }" var="bed" varStatus="status">
               <div class="col-md-1" style="margin-right:2%;border:1px solid lightgray;height:150px;width:180px;border-radius:3px;">
                  <div style="padding: 20% 37%;"><img src="<%=request.getContextPath()%>/resources/images/homeDetail/bed.png"></div>
                  <div style="font-weight:bold;font-size: 12pt;">${status.index+1 }번 침실</div>
                  <div style="font-size:12pt;">${bed.BEDTYPE }사이즈 침대 ${bed.BEDCOUNT }</div>
               </div>
               </c:forEach>
            </div>
         </div>
         </c:if>
         <%-- 예약 달력 --%>
         <div class="infoDiv">
            <div class="infoSubjectHY" style="font-weight:bold;">예약 가능 여부</div>
            <div class="row noSpace" style="margin-top:3%;">
               <div id='calendar' style="width:100%;;"></div>
            </div>
         </div>
         <%-- 후기 --%>
         <form id="reviewListFrm">
		<input type=hidden name="roomcode" value="${room.roomcode}"/>
         <div class="infoDiv" style="padding-bottom:0;">
            <div class="row noSpace" style="width:100%;padding:0;margin-bottom:2%;">
               <div class="col-md-8 infoSubjectHYBig">후기 <span id="reviewSize">${room.reviewList.size()}</span>개<span style="color:#148487;margin-left:3%;">★★★★★</span></div>
               <div class="col-md-4"><input id="reviewSearchWord" name="reviewSearchWord" type="text" class="form-control input-data" style="width:100%; padding-left: 20%;font-weight:bold;" placeholder="후기검색">
                  <img src="<%=request.getContextPath()%>/resources/images/musica-searcher.png" style="opacity:0.5;width:18px;height:18px;position:absolute; top:8px;left: 25px;">
               </div>
            </div>
            <%-- 별점 평균 --%>
            <div style="margin-bottom:5%;">
               <div class="row noSpace" style="width:100%;">
                  <div class="col-md-2">정확성</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
                  <div class="col-md-2">위치</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
               </div>
               <div class="row noSpace" style="width:100%;">
                  <div class="col-md-2">의사소통</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
                  <div class="col-md-2">체크인</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
               </div>
               <div class="row noSpace" style="width:100%;">
                  <div class="col-md-2">청결도</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
                  <div class="col-md-2">가치</div><div class="col-md-4" style="color:#148487;">★★★★★</div>
               </div>
            </div>
            <%-- 후기들 --%>
            <div id="reviewArea" class="noSpace"></div>
            <div id="pagebar" style="margin: 2% 5%;"></div>
            <!-- <button data-toggle = "modal" data-target="#reviewRegist" data-dismiss = "modal">댓글달기</button> -->
         </div>
         </form>
         <div class="infoDiv">
            <%-- 지역정보 --%>
            <div class="infoSubjectHYBig">지역정보</div>
            <div style="margin-top:2%;">${room.roomSido} ${room.roomSigungu} ${room.roomBname} ${room.roomDetailAddr}</div>
            <div id="map" style="height:350px;width:100%;border: 1px solid lightgray;margin-top:3%;padding:0;"></div>
            <script> 
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = {
                       center: new daum.maps.LatLng(0,0), // 지도의 중심좌표33.450701, 126.570667
                       level: 3 // 지도의 확대 레벨
                   };  // 지도를 생성합니다    
               var map = new daum.maps.Map(mapContainer, mapOption);  // 주소-좌표 변환 객체를 생성합니다
               var geocoder = new daum.maps.services.Geocoder();  // 주소로 좌표를 검색합니다
               geocoder.addressSearch('${room.roomSido} ${room.roomSigungu} ${room.roomBname} ', function(result, status) { // 정상적으로 검색이 완료됐으면 
                    if (status === daum.maps.services.Status.OK) {
                       var coords = new daum.maps.LatLng(result[0].y, result[0].x); // 결과값으로 받은 위치를 마커로 표시합니다
                       var marker = new daum.maps.Marker({
                           map: map,
                           position: coords
                       });
                       map.setCenter(coords);
                   } 
               });  
            </script>
         </div>
         <div class="infoDiv">
            <div class="infoSubjectHYBig">환불정책</div>
            <div class="row noSpace" style="margin-top:3%;">
               숙소 이용규칙
               <br/>흡연 금지
               <br/>반려동물 동반 불가
               <br/>체크인 시간: 16:00 이후 언제나, 체크아웃 시간: 11:00까지
               <br/>키패드(으)로 셀프 체크인
               <br/><br/>
               <a class="aTagBtnHY">숙소 이용규칙 모두 보기</a>
            </div>
         </div>
      </div>
	<%-- 예약하기 --%>
	<div class="col-md-4 noSpace">
	<form name="reserveFrm">
		<input type=hidden name="roomcode" id="roomcode" value="${room.roomcode}"/>
		<div id="followHY" class="noSpace" style="width: 400px;padding: 0 3%;">
			<div style="height:380px;width: 400px;border:1px solid lightgray; padding: 5%;">
				<div style="height:60px; border-bottom: 1px solid lightgray;">
					<div style="height:50px;font-size: 24px;font-weight:bold; padding-bottom: 10%;">
						<div>￦<fmt:formatNumber value="${room.roomPrice }" pattern="#,###"/><span style="font-size:12px;">/박</span></div>
                     	<div style="font-size:10px;"><span style="color:#148487;">★★★★★</span>${room.likeCount }</div>
                  	</div>
                  	<div style="height:240px;padding-top:5%;">
                     	<div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">날짜</div>
	                    <div class="input-daterange input-group datepicker" id="datepicker" style="width:100%;padding: 2% 5%;">
						    <input type="text" class="input-sm form-control" id="checkInDate" name="rsv_checkInDate" placeholder="체크인" style="height:40px;"/>
						    <span class="input-group-addon">to</span>
						    <input type="text" class="input-sm form-control" id="checkOutDate" name="rsv_checkOutDate" placeholder="체크아웃" style="height:40px;"/>
						</div>
                     	<div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">인원</div>
                     	<div class="DetailsInput" style="padding:0;">
                        	<div class="dropdown-toggle" data-toggle="dropdown" style="padding-left:10%;padding-top:3%;cursor:pointer;">게스트 성인 <span id="adultTotal"></span>명<span id="babyhide">, 유아 <span id="babyTotal"></span>명</span><span class="caret"></span></div>
                        	<div id="myDropdown" class="dropdown-menu dropdown-content" style="width:79%;position:absolute; top: 62%; margin-left: 12%;border-top: solid #148487;">
                            	<div style="padding: 3% 5%; border-radius:5px;width:100%;">
                               		<div class="row dropsubrow" style="margin-bottom:3%;">
                                  		<div class="col-md-4" style="text-align:center;font-weight:bold;padding-top:2%;">성인</div>
                                  		<div class="col-md-6 col-md-offset-1">
                                  			<div class="row">
		                                     	<div class="col-md-4"><button type="button" class="dropUpDown adultCnt" >-</button></div>
		                                     	<div class="col-md-4"><input id="adultCount" name="guestCount" style="margin: 2% 13%;text-align:center;border:none; width:100%;" /></div>
		                                     	<div class="col-md-4"><button type="button" name="babyCount" class="dropUpDown adultCnt" >+</button></div>
                                  			</div>
                                  		</div>
	                               	</div>
	                               	<div class="row dropsubrow">
	                                  	<div class="col-md-4" style="text-align:center;font-weight:bold;padding-top:2%;">유아</div>
	                                  	<div class="col-md-6 col-md-offset-1">
                                  			<div class="row">
		                                     	<div class="col-md-4"><button type="button" class="dropUpDown babyCnt" >-</button></div>
		                                     	<div class="col-md-4"><input id="babyCount" style="margin: 2% 13%;text-align:center;border:none;width:100%;" /></div>
		                                     	<div class="col-md-4"><button type="button" class="dropUpDown babyCnt" >+</button></div>
                                  			</div>
	                                  	</div>
	                               	</div>
	                               	<div style="font-weight:500; font-size:0.9em;color:gray;text-align:center;border-top: 1px solid #f0f0f0; padding-top:3%;margin-top:10%;">최대 3명. 유아는 숙박인원에 포함되지 않습니다.</div>
	                            </div>
                        	</div>
                     	</div>
                     	<button type="button" id="rsvBtn" >예약하기</button>
                     	<div style="text-align:center; font-size:0.9em; font-weight:bold; margin-top: 2%;">예약 확정전에는 요금이 청구되지 않습니다.</div>
                  	</div>
               	</div>
            </div>
         </div>
   		</form>
	</div>
  	<%-- 추천숙소 --%>
   	<div class="row noSpace" id="followEndHY">
      	<div class="col-md-12">
         	<div class="infoSubjectHYBig" style="margin-bottom: 2%;">주변 숙소 더 보기</div>
         	<div class="row" style="width: 100vw">
         		<c:forEach items="${recommendRoomList }" var="recommendRoom">
                <div class="col-md-2" style="margin-bottom: 2%;">
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
</div>
</div>
<%-- 관심숙소 등록 modal --%>
<div class="modal fade" id="likeRoom" role="dialog" >
   <div class="modal-dialog">
      <div class="modal-content" style="padding:2%;">
         <div style="text-align:center;margin-bottom:3%;font-weight:bold;">관심 숙소로 등록 될 이름을 입력해주세요</div>
         <div><input id="saveTitle" class="input-data form-control" name="saveTitle" type="text" /></div>  
         <button type="button" onClick="likeRoom();" style="width:100%;background-color: #fd5a61;border:none; color:white;margin-top:3%;height:40px;font-weight:bold;border-radius:5px;">관심 숙소 등록하기</button>
      </div>
   </div>
</div>
<%-- 댓글작성 modal --%>
<div class="modal fade" id="reviewRegist" role="dialog">
	<form id="reviewFrm">
	<input type="hidden" name="fk_roomcode" value="${room.roomcode }">
	<input type="hidden" name="fk_userid" value="${loginuser.userid }">
	<div class="modal-doalog" style="width:800px; margin: 10% auto;padding:0;">
		<div class="modal-content" style="width:100%;padding:5%;">
			<!-- <div>나의 예약정보</div> -->
			<div style="margin-bottom:5%;">
            	<div class="row noSpace" style="width:100%;margin-bottom:2%;">
            		<div class="col-md-6">
	            		<input type="hidden" id="correct" class="starPointval" name="correct">
	                  	<div class="col-md-3" style="font-weight:bold;">정확성</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
                  	</div>
                  	<div class="col-md-6">
	                  	<input type="hidden" id="position" class="starPointval" name="position">
	                  	<div class="col-md-3" style="font-weight:bold;">위치</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
                  	</div>
               </div>
               <div class="row noSpace" style="width:100%;margin-bottom:2%;">
               		<div class="col-md-6">
	               		<input type="hidden" id="communicate" class="starPointval" name="communicate">
	                  	<div class="col-md-3" style="font-weight:bold;font-size:0.9em;">의사소통</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
	                </div>
                  	<div class="col-md-6">
	                  	<input type="hidden" id="checkin" class="starPointval" name="checkin">
	                  	<div class="col-md-3" style="font-weight:bold;">체크인</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
                  	</div>
               </div>
               <div class="row noSpace" style="width:100%;margin-bottom:2%;">
               		<div class="col-md-6">
	               		<input type="hidden" id="clean" class="starPointval" name="clean">
	                  	<div class="col-md-3" style="font-weight:bold;">청결도</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
                  	</div>
                  	<div class="col-md-6">
	                  	<input type="hidden" id="value" class="starPointval" name="value">
	                  	<div class="col-md-3" style="font-weight:bold;">가치</div>
	                  	<div class="col-md-9">
	                  		<img class='col-md-1 starPointDown' src='<%=request.getContextPath() %>/resources/images/homeDetail/left-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  		<div class="col-md-8 col-md-offset-1 starPoint" style="padding:0;"></div>
	                  		<img class='col-md-1 starPointUp' src='<%=request.getContextPath() %>/resources/images/homeDetail/right-arrow.png' style='height:18px;cursor:pointer;padding:0;'>
	                  	</div>
               		</div>
               </div>
            </div>
            <div class="container" style="width:100%;">
				<textarea id="review_content" name="review_content" class="form-control input-data" style="width:88%;float:left;height:80px;"></textarea>
				<button type="button" id="reviewInsertBtn" style="width:11%;float:left;margin-left:1%;border:none;background-color: #148487;color:white;height:80px;border-radius:3px;padding:1.5%;font-size:0.9em;">댓글달기</button>
			</div>
		</div>
	</div>	
	</form>
</div>