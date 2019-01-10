<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="col-md-10">
	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<div class="">
			<h1 class="home_title">회원관리</h1>
		</div>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;">
			<table class="table">
					<col width="10%;"/>
					<col width="15%;"/>
					<col width="15%;"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				  <thead>
				    <tr>
				      <th>회원번호</th>
				      <th>이름</th>
				      <th>아이디</th>
				      <th>성별</th>
				      <th>전화</th>
				      <th>주소</th>
				      <th>회원삭제</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>1</td>
				      <td><a data-toggle="modal" data-target="#myModal">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				      <td><button type="button" class="btn btn-danger">삭제</button></td> 
				    </tr>
				    <tr>
				      <td>2</td>
				      <td><a data-toggle="modal" data-target="#myModal">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				    <tr>
				      <td>3</td>
				      <td><a data-toggle="modal" data-target="#myModal">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				    <tr>
				      <td>4</td>
				      <td><a data-toggle="modal" data-target="#myModal">Mark</a></td>
				      <td>Otto</td>
				      <td>남</td>
				      <td>01054881234</td>
				      <td>경기도 구리시 토평동 푸르지오 1004-102</td>
				    </tr>
				  </tbody>
				</table>			
			</div>
		</div>
	</div>
	
	<div id="searchbar" style="text-align: center;">
        <input type="text" id="searchInput" placeholder="검색" style="" />
        <div id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px"></div>
    </div>
	
	<div class="pageBar" style="text-align: center; margin: 2%;">
		[이전]    1    2    3    4    5		6		7		8		9    [다음]
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	    <div style="padding: 3%;">
			<div class="container">
				<div class="row">
				    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
			
						<div class="panel panel-info">
							<div class="panel-heading">
							  <h3 class="panel-title">상세 정보</h3>
							</div>
							
							<div class="panel-body" style="padding-bottom: 3%; padding-top: 3%;">
							    <div class="row">
									<div class="col-lg-3 " align="center"><img alt="프로필 사진" src="resources/images/친구와함께.JPG" class="img-circle img-responsive"></div>			
								    
							    <div class=" col-md-9 col-lg-9 "> 
							      <table class="table table-user-information">
							        <tbody>
							          <tr>
							            <td>성명</td>
							            <td>이순신</td>
							          </tr>
							          <tr>
							            <td>생년월일</td>
							            <td>2013/06/23</td>
							          </tr>
							          <tr>
							            <td>아이디</td>
							            <td>leess</td>
							          </tr>
					                  <tr>
							            <td>성별</td>
							            <td>여자</td>
							          </tr>
							            <tr>
							            <td>이메일</td>
							            <td>leess@naver.com</td>
							          </tr>
							          <tr>
							            <td>전화번호</td>
							            <td>01055551111</td>
							          </tr>
							          <tr>
							            <td>주소</td>
							            <td>경기도 구리시 푸르지오 1114-1004</td>
							          </tr>
							          <tr>
							            <td>보유쿠폰</td>
							            <td>없음</td>
							          </tr>
							          <tr>
							            <td>예약현황</td>
							            <td>없음</td>
							          </tr>
							          <tr>
							            <td>리뷰관리</td>
							            <td><span>작성한 리뷰 확인하기</span></td>
							          </tr>
							        </tbody>
							      </table>
							      
							    </div>
							  </div>
							</div>
							<div class="" style="text-align: center; background-color: white; padding-bottom: 10px;">
					        	<button type="button" class="btn btn-outline-success">종료</button>
					    	</div>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

