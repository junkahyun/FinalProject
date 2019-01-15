<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.hoverBottomHY{
	border-bottom: 1px solid lightgray;
	margin:2%;
}
.hoverBottomHY:hover{
	border-bottom: 1px solid black;
}
.dropdown-menu{
	width:300px;
	position: absolute;
  	right: 0 !important;
}
</style>
<div>   
   <div id="header">
      <div class="row height_maxPer">
         <div id="headerlogo">
            <img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width:28px; height:31px;"/>
         </div>
         <div id="searchbarDiv">
            <div id="searchbar">
               <div id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px"></div>
               <input type="text" id="searchInput" placeholder="검색" style="">
            </div>
         </div>
         <c:if test="${loginuser!=null }">
         <div class="headermenus">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" onClick="">회원가입</div>
            <div class="headermenu" onClick="">로그인</div>
         </div>
         </c:if>
         <c:if test="${loginuser==null }">
         <div class="headermenus">
            <%-- <c:if test="${loginser.myroom==null }">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            </c:if>
            <c:if test="${loginser.myroom!=null }"> --%>
            <div class="headermenu" onClick="">숙소추가</div>
            <div class="headermenu" onClick="">호스트</div>
            <%-- </c:if> --%>
            <div class="headermenu dropdown" onClick="">
            	<div class="dropdown-toggle" data-toggle="dropdown">저장목록</div>
            	<ul class="dropdown-menu dropdown-menu-right">
			      <li class="hoverBottomHY" style="font-weight:bold;padding-bottom:2%;">목록<span style="float:right;">목록보기</span></li>
			      <li class="hoverBottomHY">
			      	<div class="row noSpace" style="padding-bottom:2%;">
				      	<div class="col-md-8">
				      		<div style="color:#148781">saveTitle</div>
				      		<div style="color:lightgray">saveOption</div>
				      	</div>
				      	<div class="col-md-4 noSpace">
				      		<img src="<%=request.getContextPath() %>/resources/images/homeDetail/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp" style="width:100%; height:80px;padding:0;margin:0;">
				      	</div>
			      	</div>
			      </li>
			    </ul>
            </div>
            <div class="headermenu" onClick="">메세지</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" onClick="" style="padding:0; padding-top:5.5%;">
            	<div style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
            		<img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
            	</div>
            </div>
         </div>
         </c:if>
      </div>
   </div>
</div>
