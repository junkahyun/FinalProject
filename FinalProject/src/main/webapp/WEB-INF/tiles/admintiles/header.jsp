<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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
	<nav class="navbar navbar-default navbar-static-top" >
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle navbar-toggle-sidebar collapsed">
			MENU
			</button>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">
				Administrator
			</a>
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
		</div>
<<<<<<< HEAD
		<div class="headermenus">
			<div class="headermenu" onClick="">호스트가 되어보세요</div>
			<div class="headermenu" onClick="">도움말</div>
			<div class="headermenu" onClick="">회원가입</div>
			<div class="headermenu" onClick="">로그인</div>
		</div>
	</div>
=======

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
			
			<ul class="nav navbar-nav navbar-right" style="display:block;">
				<li><a href="http://www.pingpong-labs.com" target="_blank">Visit Site</a></li>
				
			</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
<<<<<<< HEAD
	</nav>  	<div class="container-fluid main-container">
  		<div class="col-md-2 sidebar">
  			<div class="row">
	<!-- uncomment code for absolute positioning tweek see top comment in css -->
	<div class="absolute-wrapper"> </div>
	<!-- Menu -->
	<div class="side-menu">
		<nav class="navbar navbar-default" role="navigation">
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
  
	<footer class="pull-left footer">
		<p class="col-md-12">
			<hr class="divider">
			Copyright &COPY; 2015 <a href="http://www.pingpong-labs.com">Airbnb</a>
		</p>
	</footer>
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
</div>
=======
	</nav>  	
	
>>>>>>> branch 'master' of https://github.com/Hyun0JAM/FinalProject.git
