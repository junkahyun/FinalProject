<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ======= #22. tiles 를 사용하는 레이아웃1 페이지 만들기  ======= --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
	String ctxPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html lang="kor">
<head>
	<title>AirBnB</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<!-- Link CSS --> 
	<link rel="stylesheet" href="<%=ctxPath %>/resources/js/jquery-ui-1.12.1/jquery-ui.min.css">
	<link rel="stylesheet" href="<%=ctxPath %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/main.css">
	<!-- link shortcut icon -->
	<link rel="shortcut icon" href="<%=ctxPath%>/resources/images/main/shortcut.ico"> 
	<style type="text/css">
		section#best_reviewes{
			margin-top:40px;
			background: url(<%= ctxPath %>/resources/images/main/bg_comment.jpg) no-repeat center top;
		    background-size: cover;
		    height: 606px;
		}

		.bg_up{
			background: url('<%= ctxPath %>/resources/images/main/bg_repeat.png') repeat-x;
			position: absolute;
		    display: inline-block;
		    width: 100%;
		    height: 200px;
		    top: 0;
		    z-index: 9;
		}
		.headermenu{
			color:#fff;
		} 
	</style> 
	<!-- Link JS -->   
	<script type="text/javascript" src="<%=ctxPath %>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.form.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/resources/js/bootstrap.min.js"></script>	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/resources/js/main.js"></script>
</head>
<body ondragstart="return false;" ondrop="return false;">
	<header>
		<div class="navigation">
			<div class="col-md-6">
				<img src="<%=ctxPath %>/resources/images/main/logo.png" style="width:20%; cursor:pointer;" onClick="location.href='<%=ctxPath%>/index.air';" />
			</div>
			<div class="col-md-6">
			<c:if test="${loginuser==null }">
				<ul id="util_menu" class="no_margin-right"> 
					<li><a href="#">도움말</a></li>
					<li><a href="#" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</a></li>
					<li><a href="#" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></li>
				 </c:if>	 
		         <c:if test="${loginuser!=null }">
		         <ul id="util_menu" > 
		         <div class="headermenus">
		            <c:if test="${loginuser.myroomList==null }">
		           		<div class="headermenu" onClick="goRegistHost();">호스트가 되어보세요</div>
		            </c:if>
		            <c:if test="${loginuser.myroomList!=null }">
			            <div class="headermenu" onClick="goRegistHost();">숙소추가</div>
			            <div class="headermenu" onClick="goHostMain();">호스트</div>
		            </c:if>
		
		            <div class="headermenu dropdown resize1" onClick="myLikeRoomList();">
		               <div class="dropdown-toggle" data-toggle="dropdown">저장목록</div>
		               <ul class="dropdown-menu dropdown-menu-right">
			               <li class="hoverBottomHY" style="font-weight:bold;padding-bottom:2%;">목록<span style="float:right;">목록보기</span></li>
			               <li style="margin:2%;">
			                  <div id="myLikeRoomList" class="noSpace" style="padding-bottom:2%;">
			                  </div>
			               </li>
			             </ul> 
		            </div>
		            <div class="headermenu" onClick="">메세지</div>
		            <div class="headermenu" onClick="">도움말</div>
		
		            <div class="headermenu dropdown resize2" onClick="" style="padding:0; padding-top:5.5%;">
		               <div class="dropdown-toggle" data-toggle="dropdown" style="border: 1px solid #999; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
		                  <img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
		               </div>
		               <ul class="dropdown-menu dropdown-menu-right" style="left:auto; right:0 !important;color:#999;padding:0;text-align:right;text-weight:500;">
		               <li style="padding:0; width:50px; margin:0 auto;margin-top:5%;padding-bottom:2%; font-size:12pt;">${loginuser.userid }</li>
		               <li class="profileDrop" style="border-top:1px solid #999;" onClick="goLogout();">로그아웃</li>
		               <li class="profileDrop" onClick="goMypage();">마이페이지</li>
		             </ul> 
		            </div>
		         </div>
		         </c:if>
				</ul>
			</div>	
		</div>
		<section id="slider"><!--slider-->
	         <div class="row">
	            <div class="col-md-12">
	               <div id="slider-carousel" class="carousel slide" data-ride="carousel">
	                  <ol class="carousel-indicators">
	                     <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
	                     <li data-target="#slider-carousel" data-slide-to="1"></li>
	                     <li data-target="#slider-carousel" data-slide-to="2"></li>
	                  </ol>
	                  <div class="carousel-inner">
	                     <div class="item active">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg1.jpg" alt="" />
	                     </div>
	                     <div class="item">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg2.jpg"alt="" />
	                     </div>
	                     <div class="item">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg3.jpg" alt="" />
	                     </div>
	                  </div>
	                  <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
	                     <i class="fa fa-angle-left"></i>
	                  </a>
	                  <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
	                     <i class="fa fa-angle-right"></i>
	                  </a>
	               </div> 
	               <form name="goListFrm">
	               <div class="choose_A">
			         	<div class="col-md-2 domestic">
			         		<img id="nation_flag" alt=" " src="<%=ctxPath%>/resources/images/main/nation_flag_icon.png" width="20%"/>
			         		<span class="choose_nation">국내</span>
			         	</div>
			         	<div id="selectCity" class="col-md-2 search_column_l check_in" data-toggle = "modal" data-target="#sido" data-dismiss = "modal">
				            <span class="icon_place" id="suggest_icon"></span> 
				            <input class="ipt_search_l r_border" type="text" id="searchcity" name="sido" value="도시" size="10" readonly> 
						</div> 
			         	<div class="col-md-3 check_in search_column_r">
	            			<span class="icon_date" id="calendar_btn_s"></span>
	                        <input class="ipt_search_r" type="text" id="startdate" name="checkin" value="체크인" size="10" readonly>	                      	
				        </div>
			         	<div class="col-md-3 check_out search_column_r">
	            			<span class="icon_date" id="calendar_btn_s"></span>
	                        <input class="ipt_search_r" type="text" id="enddate" name="checkout" value="체크아웃" size="10" readonly>	                      	
				        </div>
			         	<div id="goSearch" class="col-md-2 search">
			         		검색
			         	</div>
	         		</div>
	         		</form>
	            </div> 
	         </div> 
	   </section><!--/slider-->
	   <span class="bg_up"></span>
	</header>

	<section id="recommend_lodging">
		<div class="container">
			<div id="section_title" align="center">
				<h3 class="after_underline">추천 숙소</h3>
			</div>		
			<div class="row not-rowStyle">
				<ul id="rooms_show_ul"> 
					<c:forEach items="${roomList}" var="rvo" varStatus="status">
						<c:if test="${status.count == 4 || status.count == 7 }">
							<li onClick="goRoomDetail('${rvo.roomcode}')">      
								<img class="img_room" src="${rvo.roomMainImg }" width="770" height="326" /> 
			   				 	<div class="rooms_intro city_big">
				        			<img class="img_user_fd" src="<%=ctxPath%>/resources/images/${rvo.host.profileimg}" />
				        			<br/>
							        <span class="room_name">${rvo.roomName }</span>
							        <br/>
							        <span class="index_price"><em class="bigFont">￦</em>&nbsp;<fmt:formatNumber pattern="###,###">${rvo.roomPrice}</fmt:formatNumber></span>
					    		</div> 
							</li>   
						</c:if>
						<c:if test="${status.count != 4 && status.count != 7 }">
						<li onClick="goRoomDetail('${rvo.roomcode}')">     
							<img class="img_room" src="${rvo.roomMainImg}" width="380" height="326" /> 
		   				 	<div class="rooms_intro">
			        			<img class="img_user_fd" src="<%=ctxPath%>/resources/images/${rvo.host.profileimg }" />
						        <span class="room_name">${rvo.roomName}</span>
						        <span class="index_price"><em class="bigFont">￦</em>&nbsp;<fmt:formatNumber pattern="###,###">${rvo.roomPrice}</fmt:formatNumber></span>
				    		</div> 
						</li>     
						</c:if> 
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
	<section id="company_A">
		<div class="container">
			<div id="section_title" align="center">
				<h3 class="">에어비앤비와 함께하는 여행</h3>
			</div>		
			<div class="col-md-12 info_company">
				<div class="col-md-4 info_1">
					<svg style="height:40px;width:40px;display:block;overflow:visible" viewBox="0 0 32 32" fill="#60B6B5" fill-opacity="0" stroke="#60B6B5" stroke-width="1.5" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
					<p class="bold">24시간 연중무휴 지원</p>
					<p>
					하루 24시간 언제나 여러분을 도와드립니다. 전세계 어디에서나 언제든
					에어비앤비 지원팀에 연락주세요.
					</p>
				</div>
				<div class="col-md-4 info_2">
					<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height:40px;width:40px;display:block;fill:#60B6B5"><path d="m23.57 11.4-1.75-1.76-3.85-3.87-1.78-1.79-2.7-2.71-.82-.83-.22-.23-.06-.06c-.22-.22-.53-.22-.73-.02l-1.75 1.76-3.85 3.87-3.85 3.87-1.75 1.76a1.49 1.49 0 0 0 -.44 1.05v.01c0 .38.15.77.44 1.06l.55.55a1.49 1.49 0 0 0 2.01.08v8.4c0 .81.68 1.45 1.5 1.45h15c .82 0 1.5-.65 1.5-1.45v-8.4c.59.49 1.45.47 2.01-.08l.55-.55c.29-.29.44-.68.44-1.06v-.01c0-.38-.14-.77-.44-1.06zm-3.57 11.16c0 .24-.22.45-.5.45h-15c-.28 0-.5-.21-.5-.45v-9.36l8-7.99 8 7.99zm2.85-9.74-.55.55c-.2.2-.52.2-.71.01l-9.24-9.22a.5.5 0 0 0 -.71 0l-9.24 9.22a.5.5 0 0 1 -.71-.01l-.55-.55a.5.5 0 0 1 -.01-.71l1.75-1.76 3.85-3.87 3.85-3.87 1.4-1.4.77.77 2.7 2.71 1.78 1.79 3.85 3.87 1.75 1.76a.51.51 0 0 1 -.01.71z" fill-rule="evenodd"></path></svg>
					<p class="bold">글로벌 호스팅 기준</p>
					<p>
					게스트는 숙박 후 매번 호스트에 대한 후기를 작성합니다. 에어비앤비의 모든 호스트는 일정 수준 이상의 별점을 받고 호스팅 기준을 준수해야 합니다.</p>
				</div>
				<div class="col-md-4 info_3">
					<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height:40px;width:40px;display:block;fill:#60B6B5"><path d="m15.37 13.54-.01.01a.53.53 0 0 0 .01-.01m-.37 9.46h-11.5c-.28 0-.9-.22-1.38-.58-.71-.52-1.12-1.31-1.12-2.42 0-.04 0-.07.01-.11.09-1.1 1.59-2.44 4.02-3.79a33.14 33.14 0 0 1 2.9-1.42 35.57 35.57 0 0 1 1.31-.54c.63-.26.71-.95.18-1.35a4.55 4.55 0 0 1 -.38-.31 7.1 7.1 0 0 1 -.84-.9c-.73-.92-1.17-1.96-1.2-3.09v-2.99c.07-2.36 2.38-4.5 5.04-4.5 2.67 0 4.96 2.14 4.96 4.5v3c0 1.13-.43 2.17-1.15 3.11a7.35 7.35 0 0 1 -1.09 1.13l-.08.07c-.02.02-.02.02-.05.05s-.03.03-.09.14c-.05.47-.05.47.46.7a.49.49 0 0 0 .36-.15l.06-.05a8.32 8.32 0 0 0 1.23-1.28c.84-1.1 1.35-2.35 1.35-3.72v-3c0-2.92-2.75-5.5-5.96-5.5-3.2 0-5.96 2.56-6.04 5.49v3.01c.03 1.38.56 2.62 1.42 3.71.31.39.63.73.96 1.03.06.05.1.08.15.12a34.28 34.28 0 0 0 -3.98 1.87c-2.73 1.51-4.41 3.02-4.54 4.58a2.41 2.41 0 0 0 -.01.19c0 2.55 1.91 3.99 3.5 4h11.5a.5.5 0 1 0 0-1m7.67-4.22c-.36.74-.97 1.55-1.78 2.38a20.33 20.33 0 0 1 -1.89 1.71 19.94 19.94 0 0 1 -1.89-1.71c-.81-.83-1.42-1.64-1.78-2.38-.22-.45-.33-.86-.33-1.23 0-.99.61-1.56 1.43-1.56.7 0 1.55.53 2.18 1.31a.5.5 0 0 0 .78 0c .63-.78 1.48-1.31 2.18-1.31.82 0 1.43.57 1.43 1.56 0 .36-.11.77-.33 1.23m-1.1-3.78c-.89 0-1.82.5-2.57 1.25-.75-.76-1.68-1.25-2.57-1.25-1.36 0-2.43 1.01-2.43 2.56 0 .53.15 1.08.43 1.66.41.85 1.09 1.74 1.96 2.64a21.09 21.09 0 0 0 2.31 2.05.5.5 0 0 0 .6 0 20.91 20.91 0 0 0 2.31-2.05c.87-.9 1.55-1.79 1.96-2.64.28-.58.43-1.13.43-1.66 0-1.55-1.07-2.56-2.43-2.56" fill-rule="evenodd"></path></svg>
					<p class="bold">별점 5점 호스트</p>
					<p>
					깔끔하게 정돈된 침대 시트에서부터 브런치 맛집 정보까지, 에어비앤비 호스트는 현지인의 강점을 살린 서비스를 풍성하게 제공합니다.</p>
				</div>
			</div>
		</div>
	</section>
	<section id="best_reviewes">
		<div class="container">
			<div class="index_commnet">
       			<div class="index_T">
	            	<h1 class="white">베스트 후기</h1>
	            	<span class="white">우리들의 만남</span>
        		</div>
        		
        		<div id="commentdiary">
	    			<div class="comment_column">
						<div class="cmt_con">
		  					<span class="comment_user">${reviewLeft.fk_userid}</span>
			                <div>
					            <span><img src="<%=ctxPath%>/resources/images/${reviewLeft.user.profileimg}"></span>
					            <span>${reviewLeft.room.roomName }</span>
					            <span>${reviewLeft.review_writedate}</span>
					            <span class="comment_W">${reviewLeft.review_content}</span>
					        </div>
		                
	  		  			</div>  
					    <em class="middle_line"></em>              
						</div> 
						<div class="comment_column">
						    <div class="cmt_con cmt_R">
						        <span class="comment_user">${reviewRight.fk_userid}</span>
						        <div>
							        <span><img src="<%=ctxPath%>/resources/images/${reviewRight.user.profileimg}"></span>
							        <span>${reviewRight.room.roomName }</span>
							        <span>${reviewRight.review_writedate}</span>
							        <span class="comment_W"><a href="#">${reviewRight.review_content}</a></span>
						        </div> 
						    </div>    
						</div>
					</div>
	    		</div> 
			</div>  
	</section>
	<%-- 시/도 선택 모달 --%>
	<div class="modal fade" id="sido" role="dialog">
	    <div class="modal-dialog">	    
	      <!-- Modal content-->
	      <div class="modal-content" style="width: 568px; height: 372px;"> 
	        <button type="button" class="myclose" data-dismiss="modal" style="background-color: white;  margin-top: 2%; border: 0px; float:right;"><span style="font-size:24px">X</span></button>
	        <div id="sido">
	        	<h4>시/군/구 선택하기</h4>
	        	<select class="form-control" name="sido1" id="sido1"></select>
				<select class="form-control" name="gugun1" id="gugun1"></select> 
	        </div>
	        <button type="button" class="btn btn-primary finish_sido"  data-dismiss="modal" >확인</button>
	      </div> 
	     </div>
  	 </div> 
  	 <%-- footer --%>
	<footer>
		<div class="container">
			<div class=" col-md-12 footer_menues">	
					<ul class="col-md-3">
						<li>에어비앤비</li>
						<li>채용정보</li>
						<li>미디어</li>
						<li>정책</li>
						<li>도움말</li>
						<li>다양성과 소속감</li>
					</ul>
					<ul class="col-md-3">
						<li>여행하기</li>
						<li>신뢰와 안전</li>
						<li>친구 초대하기</li>
						<li>Airbnb Citizen</li>
						<li>비즈니스 프로그램</li>
						<li>가이드북</li>
						<li>Airbnbmag</li>
						<li>에어비앤비 이벤트<span style="margin-left:3%;color: #008489; font-weight: bold;">NEW!</span></li>
						<li>한국의 변경된 환불 정책</li>
					</ul>
					<ul class="col-md-3">
						<li>호스팅하기</li>
						<li>호스팅의 장점</li>
						<li>호스트 추천하기</li>
						<li>호스팅 기준</li>
						<li>책임감 있는 호스트 되기</li>
						<li>커뮤니티 센터</li>
						<li>트립 호스팅<span style="margin-left:3%; color: #008489; font-weight: bold;">NEW!</span></li>
						<li>Open Homes 프로그램<span style="margin-left:3%; color: #008489; font-weight: bold;">NEW!</span></li>
					</ul>
					<ul class="col-md-3">
						<li>이용약관</li>
						<li>개인정보 처리방침</li>
						<li>여행지 찾기</li>
					</ul>
			</div>
			<div class="_qtix31">
				<div class="_ni9axhe">
					<div style="margin-right:8px">
						<svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:1.5em;width:1.5em;display:block;fill:#767676">
							<path d="m499.3 736.7c-51-64-81-120.1-91-168.1-10-39-6-70 11-93 18-27 45-40 80-40s62 13 80 40c17 23 21 54 11 93-11 49-41 105-91 168.1zm362.2 43c-7 47-39 86-83 105-85 37-169.1-22-241.1-102 119.1-149.1 141.1-265.1 90-340.2-30-43-73-64-128.1-64-111 0-172.1 94-148.1 203.1 14 59 51 126.1 110 201.1-37 41-72 70-103 88-24 13-47 21-69 23-101 15-180.1-83-144.1-184.1 5-13 15-37 32-74l1-2c55-120.1 122.1-256.1 199.1-407.2l2-5 22-42c17-31 24-45 51-62 13-8 29-12 47-12 36 0 64 21 76 38 6 9 13 21 22 36l21 41 3 6c77 151.1 144.1 287.1 199.1 407.2l1 1 20 46 12 29c9.2 23.1 11.2 46.1 8.2 70.1zm46-90.1c-7-22-19-48-34-79v-1c-71-151.1-137.1-287.1-200.1-409.2l-4-6c-45-92-77-147.1-170.1-147.1-92 0-131.1 64-171.1 147.1l-3 6c-63 122.1-129.1 258.1-200.1 409.2v2l-21 46c-8 19-12 29-13 32-51 140.1 54 263.1 181.1 263.1 1 0 5 0 10-1h14c66-8 134.1-50 203.1-125.1 69 75 137.1 117.1 203.1 125.1h14c5 1 9 1 10 1 127.1.1 232.1-123 181.1-263.1z">
							</path>
						</svg>
					</div>
				</div>
				<div class="_ni9axhe">
					<div dir="ltr" class="_nwmqo60">© Airbnb, Inc.</div>
				</div>
			</div>
		</div> 
	</footer> 
	<%-- Modal --%>
	
<%-- ****** 로그인 Modal ****** --%>
<div class="modal fade" id="login" role="dialog">
	<div class="modal-dialog" style="margin-top: 10%;">
	    <form id="loginFrm" name="loginFrm">
	    <!-- Modal content-->
	    <div class="modal-content" style="width: 100%; height: 400px; margin-top:5%;">
	    	<div>
		        <div style="margin-top: 3%;">
		       		<button type="button" class="myclose" data-dismiss="modal" style=" width:auto; margin-left: 3%; background-color: white; border: 0px;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
		        </div>
		        <div style="padding:0;margin:0;width:90%;margin: 5%;">
			        <input placeholder="아이디" name="userid" class="input-data form-control" type="text" style="font-size: 13pt; margin:0 auto; border: 1px solid rightgray; height: 46px; border-radius: 10px;" />
			        <input id="loginpwd" placeholder="비밀번호" name="pwd" class="input-data form-control" type="password" style="font-size: 13pt; margin-top: 2%; border: 1px solid rightgray; height: 46px; border-radius: 10px;" /> 
		        	<input id="a" type="checkbox" style="cursor: pointer;vertical-align: middle;"  />
		        	<label style="font-size: 10pt; margin-top: 0%; padding-top: 3%; cursor: pointer;" for="a">비밀번호 저장</label>
		        	<div style="margin-top: 3%;">
		        		<a type="text" style="border: 0px solid; color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#pwdfind" data-dismiss = "modal">비밀 번호가 생각나지 않으세요?</a>
		        	</div>
		    		<button type="button" onClick="goLogin();" class="login" style="width: 100%; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;margin-top: 2%;">로그인</button>
		        </div>
		    </div>
			<div class="modal-footer" style="margin-top: 2%;">
		    	<div class="join" style=" text-align: center;" onClick="" >에어비엔비 계정이 없으세요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</a></div>  
		    </div> 
		</div>
	    <!-- Modal content End -->
	    </form>
	</div>
</div>   
<%-- ****** 회원가입 Modal ****** --%>
<div class="modal fade" id="join" role="dialog">
    <div class="modal-dialog">
    	<form id="joinFrm" name="joinFrm" enctype="multipart/form-data">
        <!-- Modal content-->
        	<div class="modal-content" style="width: 100%;padding:0;">
	       		<button type="button" class="myclose" data-dismiss="modal" style="width:auto; background-color: white; border: 0px;margin-top:2%; margin-left:3%;">
	       			<img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;">
	       		</button>
            	<span  style="text-align:center; margin-left:21%; font-weight: bold; color: #008489;" >페이스북</span><span  style="text-align:center; font-weight: bold; " >&nbsp;또는</span>&nbsp;<span  style="text-align:center;  font-weight: bold; color: #008489;" >구글</span><span  style="text-align:center; font-weight: bold; " >로 회원 가입하세요.</span>
          		<div style="padding:0;margin:0;">
	                <div style="border-bottom: 1px solid lightgray; margin-top: 1%;padding:0;"></div>
			        <div style="border: 1px solid lightgray;overflow:hidden; margin:2% auto;width:100px;margin-bottom:3%; height:100px;border-radius:100%;">
			        	<img id="profilePreview" style="width:100%;"/>
			        </div>
			        <div style="position:absolute; top:15%;left:30%;">
			         	<input type="file" id="imgInput" name="file" style="display:none;position:absolute;height:30px;z-index:2;width:150px;margin-left:28%;">
				        <button id="fileInputBtn" type="button" style="width:150px; height:30px;background-color:lightgray;border:none;font-weight:bold;color:white;border-radius:3px;margin-left:30%;">프로필 이미지 선택</button>
			        </div>
			        <div style="padding:0;">
				        <label style="position:fixed; left:7%;font-weight:bold;margin-top:1.5%;">ID</label>
				        <img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top:1%;width:24px;height:24px; z-index:3;" />
				        <input name="userid" id="userid" placeholder="아이디" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        	<div class="error" style="margin-left:5%; color:red;"></div>
			        </div>
			        <div style="padding:0;">
				        <label style="position:fixed; left:7%;font-weight:bold;margin-top:1.5%;">NAME</label>
					    <img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 1%; width:24px;height:24px; z-index:3;" />
				        <input name="username" id="username" placeholder="이름" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        </div>
			        <div class="row" style="padding:0;margin-left: 2.5%;margin-top:1%;">
				        <div class="col-md-6" style="padding:0;">
				        	<label style="position:fixed;z-index:1; left:7%;font-weight:bold;margin-top:2.5%;">PW</label>
				        	<img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 2%; width:24px;height:24px; z-index:3;" />
				        	<input name="pwd" id="pwd" placeholder="비밀번호" class="col-md-6 input-data form-control registInput" type="password" style="width: 100%;padding-left: 30%;"/>
				        </div>
				        <div class="col-md-5" style="padding:0;margin-left: 2%;">
				        	<input id="pwdcheck" placeholder="비밀번호 확인" class="col-md-6 input-data form-control registInput" type="password" style="width: 92%;"/>
			        	</div>
			        	<div class="col-md-11 error" style="color:red;"></div>
			        </div>
			        <div style="padding:0;">
				        <label style="position:fixed; left:7%;font-weight:bold;margin-top:1.5%;">EMAIL</label>
				        <img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 1%; width:24px;height:24px; z-index:3;" />
				        <input name="email" id="email" placeholder="이메일" class="input-data form-control registInput" type="email" style="padding-left: 15%;"/>
			        	<div class="error" style="margin-left:5%; color:red;"></div>
			        </div>
			        <div style="padding:0;">
				        <label style="position:fixed; left:7%; font-weight:bold;margin-top:1.5%;">PHONE</label>
				        <img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 1%; width:24px;height:24px; z-index:3;" />
				        <input name="phone" id="phone" placeholder='"-"없이 입력해주세요' class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        	<div class="error" style="margin-left:5%; color:red;"></div>
			        </div>
			        <div class="row" style="padding:0;margin-top:1%;">
				        <div class="col-md-6" style="padding:0;margin-left:4.5%;">
				        	<label style="position:fixed; left:7%;font-weight:bold;margin-top:2.5%;z-index:1;">POST</label>
			        		<input name="post" id="post" placeholder="우편번호" class="input-data form-control registInput" type="text"  style="width:100%;padding-left: 28%;" readonly/>
				        </div>
				        <div class="col-md-5" style="margin-left:3%;margin-top:1%;">
				        	<button id="searchAddrBtn" type="button" style="height:40px;width:88%;border:none;background-color: lightgray;color:white;font-weight:bold;border-radius:5px;">주소찾기</button>
				        </div>
			        </div>
			        <div style="padding:0;">
			        	<img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 1%; width:24px;height:24px; z-index:3;" />
			        	<input name="addr" id="addr" onchange="checkAddr()" placeholder="주소" class="input-data form-control registInput" type="text" readonly/>
			        </div>
			        <div style="padding:0;">
			        	<img class="passIcon" src="<%= request.getContextPath() %>/resources/images/header/checked_green.png" style="position: fixed; right: 7%; margin-top: 1%; width:24px;height:24px; z-index:3;" />
			        	<input name="detailAddr" id="detailaddr" placeholder="상세주소" class="input-data form-control registInput" type="text"/>
			        </div>
			        <textarea name="introduction" id="introduction" placeholder="자기소개" class="input-data form-control registInput" style="height: 90px;"></textarea>
 					<div style="margin-top:2%;">
	 					<input type="radio" id="male" name="gender" value="1" style="margin-left: 5%;" checked/><label for="male" style="margin-left: 2%;">남자</label>
		       			<input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
	  				</div>
	  				<div class="row noSpace" style="width:100%;padding:0;margin-top:2%;font-size: 12pt;margin-left:5%;" >
		         		<div class="col-md-4">
		           			<c:set var="year" value="2019"></c:set>
		           			<select name="year" class="birth registBirthInput birth">
		          				<option value="-1">년</option>
		          				<c:forEach var="i" begin="1900" end="${year}" step="1" >
		             			<option value="${year - i + 1900}" style="width:100px;">${year - i + 1900}</option>
		         				</c:forEach>
		           			</select>
		    			</div>
		         		<div class="col-md-3">
		       				<select name="month" class="birth registBirthInput birth">
						        <option value="-1">월</option>
						        <c:forEach var="month" begin="1" end="12">
						        <option value="${month}">${month}</option>
						        </c:forEach> 
		        			</select>
						</div>          
		    			<div class="col-md-3">
			         		<select name="day" class="birth registBirthInput birth">
			          			<option value="-1">일</option>
						        <c:forEach var="day" begin="1" end="31" >
						        <option value="${day}">${day}</option>
						        </c:forEach>
			           		</select>
						</div>
					</div>
		         	<button id="registBtn" type="button" class="login" style="width: 90%;height: 40px; border: 1px solid rightgray; border: none; font-weight:bold;background-color: #fd5a61; color: white; border-radius: 10px;margin-left: 5%; margin-top: 2%;padding:0;">가입하기</button>
			        <div class="modal-footer" style="margin-top: 2%;">
		            	<div class="join" style="font-size: 12pt;  text-align: center;" onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
		        	</div>
      			</div>
			</div>
    	</form>
	</div>
</div> 
<%-- ****** 비밀번호찾기 Modal ****** --%>
<div class="modal fade" id="pwdfind" role="dialog">
	<div class="modal-dialog">
	<!-- Modal content-->
		<div class="modal-content" style="width: 100%; height: 350px;">   
			<button type="button" class="myclose" data-dismiss="modal" style="width:auto; margin-left: 3%; background-color: white; border: 0px;margin-top:2%;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
           	<div style="padding: 3% 5%;">
	           	<div style="font-size: 15pt;border-top:1px solid lightgray; padding-top:2%; font-weight: bold; margin-bottom: 5%;">비밀번호 재설정</div>
	            <div style="margin-top:5%; font-size: 12pt; ">계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를</div>
	            <div style=" font-size: 12pt; ">전송해 드립니다.</div>
	            <div style="font-size: 11pt; font-weight: bold; margin-bottom: 5%;">이메일 주소</div>
	            <input  class="input-data form-control" type="text" style="font-size: 13pt; margin: 2% 0; border: 1px solid rightgray;  width: 100%; height: 46px; border-radius: 10px;" />
	            <div><img src="<%=request.getContextPath() %>/resources/ymimg/back.png" alt="X"><a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인으로 돌아가기</a></div>  
        	</div>
        </div>
    </div>
</div>

<%-- Right Fixed Menues --%>
<div id="quick">
	<ul id="quick_menues"> 
		<li> 
			<a href="#" id="toUp">
	    		<img src="<%=ctxPath%>/resources/images/main/up.png"/>
	  		</a>
		</li>
		<li> 
		  <a href="" id="toDown">
		 	 <img src="<%=ctxPath%>/resources/images/main/down.png"/>
		  </a>
		</li>  
		<li> 
		  <a href="javascript:void plusFriendChat()">
		  <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png"/>
		  </a>
		</li>
	</ul>
	<script type="text/javascript">
		//<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('1aaa903adf0964073056fbd134bda841');
	    function plusFriendChat() {
	      Kakao.PlusFriend.chat({
	        plusFriendId: '_qxnqxij' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	      });
	    }
  	//]]>
	</script>
</div>
</body>
</html>