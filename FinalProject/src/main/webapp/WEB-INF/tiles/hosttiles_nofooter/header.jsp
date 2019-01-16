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

		<div class="row" style="padding-right:2.5%;">
			<div class="headermenu" onClick="" style="padding:0;float:right;padding-top:1%;">
	        	<div style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
	        		<img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
	        	</div>
	        </div>
			<div class="headermenuButton" onClick="" style="float:right; padding:1% 1.5%;">
				<button class="btn" style="background-color: #008489;">
					<span style="color: white; font-weight: bold;">숙소등록하기</span>
				</button>
			</div>
		</div>
	</div>
</div>
