<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function () {
		  	$('.navbar-toggle-sidebar').click(function () {
		  		$('.navbar-nav').toggleClass('slide-in');
		  		$('.side-body').toggleClass('body-slide-in');
		  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
		  	});

		  	$('#search-trigger').click(function () {
		  		$('.navbar-nav').removeClass('slide-in');
		  		$('.side-body').removeClass('body-slide-in');
		  		$('.search-input').focus();
		  	});
		  });
	</script>
<div class="container-fluid main-container">
  		<div class="col-md-2 sidebar">
  			<div class="row">
	<!-- uncomment code for absolute positioning tweek see top comment in css -->
	<div class="absolute-wrapper"> </div>
	<!-- Menu -->
	<div class="side-menu">
		<nav class="navbar navbar-default" role="navigation" style="display:block;">
			<!-- Main Menu -->
			<div class="side-menu-container">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#"> 관리자_메인</a></li>
					<li><a href="#">회원관리</a></li>
					<li><a href="#">숙소관리</a></li>
					<li><a href="#">1:1문의관리</a></li>
					<li><a href="#">항공관리</a></li>
					<li><a href="#">트립관리</a></li>
					<li><a href="#">통계</a></li>  
					<li><a href="#">로그아웃</a></li> 
				</ul>
			</div><!-- /.navbar-collapse -->
		</nav> 
		</div>
	</div>  		
</div>  