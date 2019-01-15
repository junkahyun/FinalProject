<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-b820ae7d16d76b0900accdef6c28185e.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/common-c2d2e28a641516ec0a21bccaae33f2ea.css" media="all" rel="stylesheet" type="text/css" />
<link href="https://a0.muscache.com/airbnb/static/packages/address_widget-4f18ee66a37930ce1c93c8f33690c7b0.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/phonenumbers-7c1faf80765f8cab48b45693af597ea9.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/business_travel/quick_enroll-9fe44fac8aa94516d93764b9b4e57633.css" media="screen" rel="stylesheet" type="text/css" /><link href="https://a0.muscache.com/airbnb/static/packages/edit_profile-57ea8223a84513da61b565fa5448d1c2.css" media="screen" rel="stylesheet" type="text/css" />
          <style data-aphrodite="data-aphrodite">._1k01n3v1{color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;}._1k01n3v1:hover{text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;}._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
<style type="text/css">
._1k01n3v1 {
    color: var(--color-text-link, #008489) !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
}
.firstDIV{
	margin-top: 5%;
	margin-bottom: 5%; 
}
</style>
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">

$(document).ready(function(){
 	$("#showInputPhone").hide(); 

	
	//appendMonth();
	var selectMonthValue = ${birthdayMM};
	var selectYearValue = ${birthdayYY};
	var selectDayValue = ${birthdayDD};
	$("#month option[value="+selectMonthValue+"]").attr("selected","selected");
	$("#year option[value="+selectYearValue+"]").attr("selected","selected");
	$("#day option[value="+selectDayValue+"]").attr("selected","selected");

});

 /* function appendMonth(){
	var selectValue = ${birthdayMM};
	var optionVal = document.getElementById("month"); 
	var optionIndex = 0;

	for(var i=1;i<=12;i++){
		if(i<=9){
			optionVal.add(new Option("0"+i+"월","0"+i),optionIndex++);
		}else{
			optionVal.add(new Option(i,i),optionIndex++);
		}
	

	}
	$("#month option[value=${birthdayMM}]").attr('selected','selected');
	
}   */
function showPhone(){
	$("#showInputPhone").show();
}

</script>


<div class="row firstDIV">
<!--  사이드바 -->
	<div class="col-md-1" ></div>
    <div class="col-md-3">
	      <div class="sidenav" align="center">
			  <ul class="sidenav-list">
			    <li>
			      <a href="https://www.airbnb.co.kr/users/edit/231754930" aria-selected="true" class="sidenav-item"><h4>프로필 수정</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item"><h4>후기</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item"><h4>예약 관리</h4></a>
			    </li>
			    <li>
			      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item"><h4>나의 쿠폰</h4></a>
			    </li>
			  </ul>
		 </div>	
	  </div>
<!--  사이드바끝 -->  
    <div class="col-md-6">
     <div id="dashboard-content">
		<form>
			<h1 class="screen-reader-only">프로필 수정</h1>
			<div class="panel space-4">
			  <div class="panel-header">
			    <h2 class="edit-profile-section-heading">필수사항 </h2>
			  </div>
			  <div class="panel-body">
				<div class="col-md-12" style="padding:0;">
			    	<div class="col-md-2" style="margin:0;">
			    		<input type="hidden" name="password" id="user_email_password" value="">
			      		<img src="<%= ctxPath %>/resources/images/${myInfo.profileimg}" style="border-radius: 200px%; border: 1px solid lightgray; background-color: lightgray;">
				 		<input type="file" name="profileimg"/>
				    </div>
				    <div class="col-md-10 row row-condensed" style="padding:0;">
				        <div class="col-md-1">
				        	 <label for="username">이름</label>
				        </div>
				        <div class="col-md-11" style="padding-left:2%; padding-right: 0">				        
				          <input id="username" name="username" style="width:100%" type="text" value="${myInfo.username}">
					      <div class="text-muted space-top-1">예약 요청 시 호스트는 회원님의 이름을 모두 확인할 수 있습니다.</div>
				        </div>
				     </div>
			      </div>
			      <!--  내이미지 파일 시작-->
			     
			       <div>
			        <img src="<%= request.getContextPath()%>/ ">
			      </div>
			      <!--  내이미지 파일 시작-->
			      <div class="row row-condensed space-4">
			      	<label class="text-right col-sm-3" for="user_sex">
				               성별 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
				    </label>
				    <div class="col-sm-9">      
					      <div class="select">					     
					        <select id="user_sex" name="user[sex]">
					        	<option  value=""  <c:if test="${str_gender eq '' }">selected="selected"</c:if> >성별</option>
								<option value="Male" <c:if test="${str_gender eq 'Male' }">selected="selected"</c:if> >남자</option>
								<option value="Female" <c:if test="${str_gender eq 'Female' }">selected="selected"</c:if> >여자</option>
								<option value="Other" <c:if test="${str_gender eq 'Other' }">selected="selected"</c:if> >기타</option>
							</select>
						 
					      </div>	
					      <div class="text-muted space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
				     </div>
			      </div>
			<!--  생년월일 -->
			       <div class="row row-condensed space-4">
				        <label class="text-right col-sm-3" for="user_birthdate">
							생년월일 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
				        </label>
			        <div class="col-sm-9">	          
			        <fieldset>
			          <legend class="screen-reader-only">생년월일</legend>
			          <div class="select">
			            <select aria-label="월" id="month" name="month">
			            	<option value="">월</option>
		            		<c:forEach varStatus="status" begin="1" end="12">
			            			<option value="${status.count}">${status.count}월</option>
			            	</c:forEach>
			            </select>					
			          </div>
			          <div class="select">
			            <select aria-label="일" id="day" name="day">
						 <option value="">일</option>
						 <c:forEach varStatus="status" begin="1" end="31">
						 	<option value="${status.count}">${status.count}일</option>
						 </c:forEach>
						
						</select>	
			          </div>
			          <div class="select">
			            <select aria-label="년" id="year" name="year">
							<option value="">년</option>
							<c:forEach var="i" begin="1" end="2019" step="1">
								<c:set var="j" value="${2019-i+1}"></c:set>
									<option value="${j}">${j}년</option>
				
								</c:forEach>
							
							</select>	
			          </div>
			        </fieldset>	
			          <div class="text-muted space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
			        </div>
			      </div>
				<!--  생년월일 끝-->
			   	<div class="row row-condensed space-4">
			        <label class="text-right col-sm-3" for="user_email">
			       	   이메일 주소 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
			        </label>
			        <div class="col-sm-9">
			        	<input id="user_email" name="user[email]" size="30" type="text" value="${myInfo.email}">
			            <div class="text-muted space-top-1">이메일 주소는 다른 에어비앤비 회원에게 공개되지 않습니다.</div>
			        </div>
			      </div>
			
			      <div class="row row-condensed space-4">
			        <label class="text-right col-sm-3" for="user_phone_numbers">
			          전화번호
			        </label>
			         <div class="col-sm-9"> 
			    	<c:if test="${myInfo.phone ne null}">
			    		<input id="user_email" name="user[email]" size="30" type="text" value="${myInfo.phone}">
			    		<div style="margin-top:8px"><button type="button" class="_1k01n3v1" aria-busy="false" onClick="showPhone()">전화번호 변경하기</button></div>
				       	<!--  전화번호 입력 버튼 선택 시  -->
				     	 <!--  번호 입력 네모 박스 -->
				      	 <div class="col-sm-9" id="showInputPhone">
			                <div data-hypernova-key="edit_profilephone_numbersbundlejs" data-hypernova-id="2bfcb4d3-787f-44ee-b8a5-8f3873c1a055">
			                	<div dir="ltr" data-reactroot=""><div style="margin-top:9px">
			                			<div class="text-muted" style="margin-top:4px">예약 요청, 미리 알림 및 기타 알림을 보내드립니다.</div>			                			
				                	<div style="margin-top:8px"><div class="phone-number-verify-widget "><div class="_16lavrk"><div class="phone-number-input-widget"><strong>전화번호 추가하기</strong><div style="margin-bottom: 16px;">이 전화번호로 알림을 보내드립니다.</div><div class=""></div><div class="pniw-number-container clearfix"><input type="tel" id="phone_number" style="width: 70%" ></div>
					                <div style="margin-top: 16px;"><button type="button" class="btn btn-primary" style="margin: 2%">문자로 인증하기</button><button type="button" class="btn btn-primary">전화로 인증</button></div>
									</div></div></div>
				                </div>
				                </div></div></div>
			                </div>
					   	</div> 
			    	</c:if>
			        <c:if test="${myInfo.phone eq null}">
				        <div style="margin-top:8px"><button type="button" class="_1k01n3v1" aria-busy="false" onClick="showPhone()">전화번호 입력</button></div>
				       	<!--  전화번호 입력 버튼 선택 시  -->
				     	 <!--  번호 입력 네모 박스 -->
				      	 <div class="col-sm-9" id="showInputPhone">
			                <div data-hypernova-key="edit_profilephone_numbersbundlejs" data-hypernova-id="2bfcb4d3-787f-44ee-b8a5-8f3873c1a055"><div dir="ltr" data-reactroot=""><div style="margin-top:9px"><div><strong>입력된 전화번호가 없습니다.</strong><div style="margin-top:4px"><div class="text-muted">예약 요청, 미리 알림 및 기타 알림을 보내드립니다.</div></div>
				                <div style="margin-top:8px"><div class="phone-number-verify-widget "><div class="_16lavrk"><div class="phone-number-input-widget"><strong>전화번호 추가하기</strong><div style="margin-bottom: 16px;">이 전화번호로 알림을 보내드립니다.</div><div class=""></div><div class="pniw-number-container clearfix"><input type="tel" id="phone_number" style="width: 70%" ></div>
					                <div style="margin-top: 16px;"><button type="button" class="btn btn-primary" style="margin: 2%">문자로 인증하기</button><button type="button" class="btn btn-primary">전화로 인증</button></div>
									</div></div></div>
				                </div>
				                </div></div></div>
			                </div>
					   	</div> 
						  <!--  번호 입력 네모 박스 끝 -->
			        	<!--  전화번호 입력 버튼 선택 시  -->
		        	</c:if>
		         
			        </div>
			      </div>
			
			          <div class="row row-condensed space-4">
			        <label class="text-right col-sm-3" for="user_profile_info_about">
			       		   자기소개 
			        </label>
			        <div class="col-sm-9">			          
			      		<textarea cols="40" id="user_profile_info_about" name="user_profile_info[about]" rows="5" >${myInfo.introduction}</textarea>
			
			          <div class="text-muted space-top-1">에어비앤비는 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지 알려주세요. <br><br> 어떤 것들을 좋아하는지 알려주세요. 가장 좋아하는 여행지, 책, 영화, TV 프로그램, 음악, 음식 등 뭐든지 좋습니다.<br><br> 회원님은 어떤 스타일의 게스트 또는 호스트인가요? <br><br> 인생의 좌우명은 무엇인가요?</div>
			        </div>
			      </div>
			  </div>
			</div>
			<button type="submit" class="btn btn-primary btn-large" onClick="editInfo();">
			  저장하기
			</button>
			</form>
		
		     </div>
    </div>
  </div>
