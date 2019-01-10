<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<div id="header">
	<div class="row height_maxPer">
		<div id="headerlogo" >
			<img src="<%=request.getContextPath() %>/resources/images/호스트아이콘.JPG " onclick=""/>
		</div>
		<div class="hostheadermenus" style="margin-left:1%;">
			<div class="headermenu" onClick="">홈</div>
			<div class="headermenu" onClick="">메시지</div>
			<div class="headermenu" onClick="">예약</div>
			<div class="headermenu" onClick="">숙소</div>
			<div class="headermenu" onClick="">성취도</div>
		</div>
		<div class="headermenuButton" onClick="" style="float:right; padding:1% 3%;">
			<button class="btn" style="background-color: #008489;">
				<span style="color: white; font-weight: bold;">숙소등록하기</span>
			</button>
		</div>
	</div>
</div>
