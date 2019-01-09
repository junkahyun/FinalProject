<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<div class="headermenus">
			<div class="headermenu" onClick="">호스트가 되어보세요</div>
			<div class="headermenu" onClick="">도움말</div>
			<div class="headermenu" onClick="">회원가입</div>
			<div class="headermenu" onClick="">로그인</div>
		</div>
	</div>
</div>