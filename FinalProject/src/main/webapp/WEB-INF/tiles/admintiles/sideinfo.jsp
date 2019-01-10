<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	<script type="text/javascript">
		$(document).ready(function(){
			$("a.inherits").bind("click",function(){
				$(this).parent().parent().find("li").removeClass("active");
				$(this).parent().addClass("active");
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
		<nav class="navbar navbar-default" role="navigation" >
			<!-- Main Menu -->
			<div class="side-menu-container">
				<ul class="nav navbar-nav" >
					<li class="active"><a href="#" class="inherits"> 관리자_메인</a></li>
					<li><a href="#" class="inherits">회원관리</a></li>
					<li><a href="#" class="inherits">숙소관리</a></li>
					<li><a href="#" class="inherits">1:1문의관리</a></li>
					<li><a href="#" class="inherits">항공관리</a></li>
					<li><a href="#" class="inherits">트립관리</a></li>
					<li><a href="#" class="inherits">통계</a></li>  
					<li><a href="#" class="inherits">로그아웃</a></li> 
				</ul>
			</div><!-- /.navbar-collapse -->
		</nav> 
		</div>
	</div>  		
</div>  