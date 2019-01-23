<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/maps/documentation/javascript/cgc/demos.css">
<%-- 참조 : https://www.airbnb.co.kr/rooms/7331795?guests=1&adults=1&s=6yWJyZHp --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>
<script>
	$(document).ready(function(){
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
    	var obj = $("#followHY").offset();
    	var objEnd = $("#followEndHY").offset();
       	$(window).scroll(function(event){
        	if($( document ).scrollTop() > obj.top){
<<<<<<< HEAD
            $("#followHY").addClass("followDiv");
=======
            $("#followHY").addClass("followDiv");
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
		}
        else{
        	$("#followHY").removeClass("followDiv");
        }
       	$("#reviewSearchWord").keydown(function(event){
       		if(event.keyCode==13){
       			alert();
       			reviewSearch();
       		}
       	});
	});   
	
  /*  	function reviewSearch(){
	   	var reviewSearchWord = $("#reviewSearchWord").val();
	   	var roomcode = $("#roomcode").val();
	   	var form_data = {"reviewSearchWord":reviewSearchWord,"roomcode":roomcode};
       	$.ajax({
    	  	url:"reviewSearch.air",
    	  	type:"POST",
    	  	dataType:"JSON",
    	  	success:function(json){
    		  	var html = "";
    		  	$.each(json,function(entryIndex,entry){
    			 	html+="<div class='row noSpace homeDetailComment'>"
                    	+"<div class='col-md-1'><div style='border: 1px solid none; width:50px;height:50px;border-radius:25px;overflow:hidden;'><img src='' style='width:50px;height:50px;'></div></div>"
                 		+"<div class='col-md-10' style='padding-top:0.5%;'><div style='font-weight:bold;'>"+entry.fk_userid+"</div><div>"+entry.review_writedate+"</div></div>"
                 		+"<div class='col-md-1'>icon</div>"
                 		+"<div class='col-md-12' style='margin-top:2%;'>"+entry.review_content+"</div></div>";
    		  	});
    		  	$("#reviewArea").html(html);
    	  	},
    	  	error:function(){
    		 
    	  	}
       	});
   	} */
   function likeRoom(){
      var saveTitle = $("#saveTitle").val();
      var roomcode = $("#roomcode").val();
      if(${loginuser == null}){
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
         dataType:"JSON",
         success:function(json){
            var n = json.n;
            if(n=="1") alert("등록이 완료되었습니다.");
            location.reload();
         },
         error:function(){
            
         }
      });
      
   }
</script>
<style>
div{
   border:0px solid;
}
.check{
   border: 1px solid red;
}
.followDiv{
   position: fixed;
   top:2%;
}
.maxWidth{
   width:1240px;
   margin:0;
   padding:0;
}
#detailSubject{
   font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif;
    margin: 0px;
    word-wrap: break-word;
    font-size: 26px;
    font-weight: 800;
}
.noSpace{
   padding:0;
   margin:0;
}
.rightborder{
   border-right: 1px solid lightgray;
}
#rsvBtn{
   width: 90%;
   margin-left:5%;
   border: none;
   height: 40px;
   background-color: #fd5a61;
   color: white;
   font-weight:bold;
   margin-top: 10%;
   border-radius: 5px;
}
.DetailsInput{
   border: 1px solid lightgray;
   height: 40px;
   border-radius: 3px;
   width:90%;
   margin-left:5%;
   margin-top:2%;
   padding:3%;
   text-align: left;
}
.infoDiv{
   margin: 3% 0;
   border-bottom: 1px solid lightgray;
   padding-bottom: 3%;
   margin-right: 5%;
   padding-right: 4%;
}
.mainSubInfo{
   height:100%;
   border-right: 1px solid lightgray;
}
.DetailButtonsHY{
   background-color:white;
   opacity:0.8;
   position:absolute; 
   bottom: 3%;
   right: 18%;
   width: 9%;
   border-radius:5px;
   height: 35px;
   box-shadow: 1px 1px 3px gray;
   padding: 7px 18px;
   font-weight:bold;
}
.DetailButtonsHY:hover{
   opacity:1;
   cursor:pointer;
}
.aTagBtnHY{
   color:#148487;
   font-weight:bold;
   font-size: 1.1em;
}
.aTagBtnHY:hover{
   cursor:pointer;
   color:#148487;
}
.infoSubjectHY{
   font-weight:bold;
   font-size:1.2em;
}
.infoSubjectHYBig{
   font-weight:bold;
   font-size:24px;
}
.homeDetailComment{
   border-bottom: 1px solid #f0f0f0;
   padding-bottom: 2%;
   margin: 0 3%;
}
.pageBarCircle,.currpageCircle{
   border:1px solid #148487;
   border-radius:15px;
   width:30px;
   height:30px;
   padding: 4px 9px;
   float:left;
   margin-left:2%;
   cursor:pointer;
}
.pageBarCircle{
   color:gray;
}
.currpageCircle{
   background-color:#148487;
}
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: white;
  overflow: auto;
  width: 100%;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  right: 0;
  top: 38px;
  z-index: 1;
  border-radius: 3px;
  border-top: 3px solid #148487;
}
.show {display: block;}
.dropUpDown{
   background-color:white;
   border: 1px solid #148487;
   font-weight:bold;
   color:#148487;
   border-radius:17px;
   width:28px;
   height:28px;
}
.dropsubrow{
   margin: 2% 0;
}
</style>
<input type="hidden" name="roomcode" id="roomcode" value="10"/>
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
            <div class="DetailButtonsHY"><img src="<%=request.getContextPath() %>/resources/images/homeDetail/upload.png" style="width:20px;height:20px;"/><span style="margin-left: 15%">공유</span></div>
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
                  <div style="border: 1px solid none; height:64px; width:64px; border-radius:40px; background-color:lightgray; overflow:hidden;margin-top: 10%;margin-left:5%;padding-top:3%;"><img src="<%=request.getContextPath() %>/resources/images/${room.host.profileimg}" style="width:64px;height:64px;"/></div>
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
               <div class="col-md-1" style="border:1px solid lightgray;height:150px;width:180px;border-radius:3px;">
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
               <table class="_p5jgym" role="presentation">
                  <tbody>
                  <%-- "_12fun97" : 예약가능 / "_z39f86g" : 예약불가 --%>
                     <tr>
                        <td></td>
                        <td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 1일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">1</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 2일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">2</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="목요일, 2019년 1월 3일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">3</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="금요일, 2019년 1월 4일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">4</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="토요일, 2019년 1월 5일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">5</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="일요일, 2019년 1월 6일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">6</div></div></div></div></td>
                     </tr>
                     <tr>
                        <td class="_z39f86g" role="button" aria-label="월요일, 2019년 1월 7일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">7</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 8일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">8</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 9일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">9</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="목요일, 2019년 1월 10일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">10</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="금요일, 2019년 1월 11일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">11</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="토요일, 2019년 1월 12일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">12</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="일요일, 2019년 1월 13일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">13</div></div></div></div></td>
                     </tr>
                     <tr>
                        <td class="_z39f86g" role="button" aria-label="월요일, 2019년 1월 14일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">14</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 15일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">15</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 16일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">16</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="목요일, 2019년 1월 17일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">17</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="금요일, 2019년 1월 18일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">18</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="토요일, 2019년 1월 19일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">19</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="일요일, 2019년 1월 20일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">20</div></div></div></div></td>
                     </tr>
                     <tr>
                        <td class="_12fun97" role="button" aria-label="월요일, 2019년 1월 21일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">21</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 22일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">22</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 23일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">23</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="목요일, 2019년 1월 24일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">24</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="금요일, 2019년 1월 25일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">25</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="토요일, 2019년 1월 26일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">26</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="일요일, 2019년 1월 27일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">27</div></div></div></div></td>
                     </tr>
                     <tr>
                        <td class="_z39f86g" role="button" aria-label="월요일, 2019년 1월 28일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">28</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="화요일, 2019년 1월 29일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">29</div></div></div></div></td>
                        <td class="_z39f86g" role="button" aria-label="수요일, 2019년 1월 30일 예약 불가능" tabindex="-1" style="width: 40px; height: 39px; background: repeating-linear-gradient(-45deg, rgb(255, 255, 255), rgb(255, 255, 255) 3px, rgb(235, 235, 235) 3px, rgb(235, 235, 235) 4px); color: rgb(0, 0, 0); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1rcgiovb">30</div></div></div></div></td>
                        <td class="_12fun97" role="button" aria-label="목요일, 2019년 1월 31일을 체크인 날짜로 선택하세요. 예약 가능한 날짜입니다." tabindex="-1" style="width: 40px; height: 39px; background: rgb(237, 246, 246); color: rgb(0, 132, 137); border: 2px solid rgb(255, 255, 255); border-radius: 7px; padding: 0px;"><div class="_47fvp1"><div class="_nuqhpy"><div class="_1p2v1ny"><div class="_1tpncgrb">31</div></div></div></div></td><td></td><td></td><td></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <%-- 후기 --%>
         <div class="infoDiv" style="padding-bottom:0;">
            <div class="row noSpace" style="width:100%;padding:0;margin-bottom:2%;">
               <div class="col-md-8 infoSubjectHYBig">후기 ${room.reviewList.size()}개<span style="color:#148487;margin-left:3%;">★★★★★</span></div>
               <div class="col-md-4"><input id="reviewSearchWord" type="text" class="form-control input-data" style="width:100%; padding-left: 20%;font-weight:bold;" placeholder="후기검색">
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
            <div id="reviewArea" class="noSpace">
               <c:if test="${room.reviewList.size() > 0 }">
               <c:forEach items="${room.reviewList }" var="review">
               <div class="row noSpace homeDetailComment">
                  <div class="col-md-1">
                     <div style="border: 1px solid none; width:50px;height:50px;border-radius:25px;overflow:hidden;"><img src="https://a0.muscache.com/im/pictures/user/853aa97c-2314-4993-88ef-75b05a3674a9.jpg?aki_policy=profile_x_medium" style="width:50px;height:50px;"></div>
                  </div>
                  <div class="col-md-10" style="padding-top:0.5%;"><div style="font-weight:bold;">${review.fk_userid }</div><div>${review.review_writedate }</div></div>
                  <div class="col-md-1">icon</div>
                  <div class="col-md-12" style="margin-top:2%;">${review.review_content }</div>
               </div>
               </c:forEach>
               </c:if>
               <c:if test="${room.reviewList.size() < 1 }">
               <div class="row noSpace homeDetailComment" style="margin-left: 5%;text-align:center; margin-bottom:5%;font-weight:bold;">아직 등록된 Review가 없습니다.</div>
               </c:if>
               <%-- 후기 페이지바 --%>
               <c:if test="${room.reviewList.size() > 0 }">
               <div class="row" style="margin:3%;color:white;">
                  <div class="currpageCircle">1</div>
                  <div class="pageBarCircle">2</div>
                  <div class="pageBarCircle">3</div>
               </div>
               </c:if>
            </div>
         </div>
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
                   };  
               
               // 지도를 생성합니다    
               var map = new daum.maps.Map(mapContainer, mapOption); 
               
               // 주소-좌표 변환 객체를 생성합니다
               var geocoder = new daum.maps.services.Geocoder();
               
               // 주소로 좌표를 검색합니다
               geocoder.addressSearch('${room.roomSido} ${room.roomSigungu} ${room.roomBname} ', function(result, status) {
               
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
      <div class="col-md-4 noSpace">
         <%-- 예약하기 --%>
         <div id="followHY" class="noSpace" style="width: 400px;padding: 0 3%;">
            <div style="height:380px;width: 400px;border:1px solid lightgray; padding: 5%;">
               <div style="height:60px; border-bottom: 1px solid lightgray;">
                  <div style="height:50px;font-size: 24px;font-weight:bold; padding-bottom: 10%;">
                     <div>￦<fmt:formatNumber value="${room.roomPrice }" pattern="#,###"/><span style="font-size:12px;">/박</span></div>
                     <div style="font-size:10px;"><span style="color:#148487;">★★★★★</span>${room.likeCount }</div>
                  </div>
                  <div style="height:240px;padding-top:5%;">
                     <div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">날짜</div>
                     <div class="row DetailsInput" style="padding-left:5%;"><div class="col-md-4">체크인</div><div class="col-md-3">→</div><div class="col-md-4">체크아웃</div></div>
                     <div style="margin-left:5%;font-weight:bold;font-size:0.9em;margin-top:3%;">인원</div>
                     <div class="dropdown DetailsInput">
                        <div onclick="myFunction()" class="dropbtn" style="padding-left:10%;cursor:pointer;">게스트 1명</div>
                        <div id="myDropdown" class="dropdown-content">
                            <div style="padding:5%;border-radius:5px;">
                               <div class="row dropsubrow">
                                  <div class="col-md-4" style="text-align:center;font-weight:bold;padding-top:2%;">성인</div>
                                  <div class="col-md-6 col-md-offset-2">
                                     <button type="button" class="dropUpDown">-</button><span style="margin: 0 13%;text-align:center;">1</span><button type="button" class="dropUpDown">+</button>
                                  </div>
                               </div>
                               <div class="row dropsubrow">
                                  <div class="col-md-4" style="text-align:center;font-weight:bold;padding-top:2%;">유아</div>
                                  <div class="col-md-6 col-md-offset-2">
                                     <button type="button" class="dropUpDown">-</button><span style="margin: 0 13%;text-align:center;">1</span><button type="button" class="dropUpDown">+</button>
                                  </div>
                               </div>
                               <div style="font-weight:500; font-size:0.9em;color:gray;text-align:center;border-top: 1px solid #f0f0f0; padding-top:3%;margin-top:10%;">최대 3명. 유아는 숙박인원에 포함되지 않습니다.</div>
                            </div>
                        </div>
                        <script>
                        /* When the user clicks on the button, 
                        toggle between hiding and showing the dropdown content */
                        function myFunction() {
                          document.getElementById("myDropdown").classList.toggle("show");
                        }
                        
                        // Close the dropdown if the user clicks outside of it
                        window.onclick = function(e) {
                          if (!e.target.matches('.dropbtn')) {
                          var myDropdown = document.getElementById("myDropdown");
                            if (myDropdown.classList.contains('show')) {
                              myDropdown.classList.remove('show');
                            }
                          }
                        }
                        </script>
                     </div>
                     <button type="button" id="rsvBtn">예약하기</button>
                     <div style="text-align:center; font-size:0.9em; font-weight:bold; margin-top: 2%;">예약 확정전에는 요금이 청구되지 않습니다.</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
   </div>
   <%-- 추천숙소 --%>
   <div class="row noSpace" id="followEndHY">
      <div class="col-md-12">
         <div class="infoSubjectHYBig" style="margin-bottom: 2%;">추천 숙소 더 보기</div>
         <div class="row" style="width: 100vw">
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