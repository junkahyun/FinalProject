<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ======= #22. tiles 를 사용하는 레이아웃1 페이지 만들기  ======= --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>  
<% String ctxPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AirB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/header.css" />
<!-- link shortcut icon -->
<link rel="shortcut icon" href="<%=ctxPath%>/resources/images/main/shortcut.ico">
</head>
<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="mycontent">
			<tiles:insertAttribute name="content"/>
		</div>
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>