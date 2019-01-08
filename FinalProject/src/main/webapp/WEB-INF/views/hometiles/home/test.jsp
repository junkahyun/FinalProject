<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
div{
    border: 0px solid;
}
.optionName{
    font-size: 16px; 
    font-weight: 800;
    margin-bottom: 3%;
    border: none;
    background: none;
    padding: 0;
}
.foldText{
    font-size: 0.8em;
    color:gray;
}
.dropBtn{
    width:100%; 
    background: none; 
    border: 1px solid lightgray; 
    border-radius: 3px; 
    height: 35px;
}
.dropBtn:hover{
    background-color: #f1f1f1;
    border: 1px solid #f1f1f1;
    transition: 0.5s;
}
#optionSection{
	height: 230px;
	width: 99.1vw; 
	background-color: #f1f1f1;
	padding-top: 14px;
	margin:0;
}
.optionbox{
	height:40px;
	width: 100%;
	border: none;
	margin-bottom:14px;
	background-color:white;
	padding-left: 14px;
}
.optioninput{
	border:none;
}
#optionLeft,#optionRight{
	height:100%;
}
</style>
<body>
	<div id="optionSection" class="row">
        <div id="optionLeft" class="col-md-5">
        <div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
        </div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
        </div>
        <div id="optionRight" class="col-md-7">
        	<div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
            <div class="optionbox"><input type="text" class="optioninput"/></div>
        </div>
    </div>
    <div class="row" style="width: 100vw">
        <div class="col-md-4" style="height:100vh;margin:0; padding:0;">
            <img src="<%=request.getContextPath() %>/resources/images/test1.png" style="width:100%;height:100vh;padding:0;margin: 0;"/>
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
</body>