<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function goLogin(){
		form_data = $("#loginFrm").serialize();
		$.ajax({
			url: "login.air",
			type: "POST",
			data: form_data,
			dataType:"json",
			success:function(json){
				var logincheck = json.logincheck;
				if(logincheck=="true"){
					alert("로그인 되었습니다.");
					location.reload();
				}
				else{
					alert("아이디와 비밀번호를 확인해주세요.");
				}
			},
			error: function(request, status, error){
	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		}
		});
	}
	function goLogout(){
		$.ajax({
			url: "logout.air",
			type: "POST",
			dataType:"json",
			success:function(json){
				alert(json.msg);
				location.reload();
			},
			error: function(request, status, error){
	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		}
		});
	}
	function goRegistHost(){
		location.href="roomstap1.air";
	}
	function goMypage(){
		location.href="myEdit.air";
	}
	function goHostMain(){
		location.href="hostMain.air";
	}
	function myLikeRoomList(){
		var form_data = {"userid":"${loginuser.userid}"};
		$.ajax({
			url:"myLikeRoomList.air",
			type:"GET",
			data:form_data,
			dataType:"JSON",
			success:function(json){
				if(json.length<1){
					alert("저장 된 숙소가 없습니다.");
					return;
				}
				var html = "";
				$.each(json, function(entryIndex,entry){
					html+="<div class='row likeRoom noSpace' style='width:100%;border-bottom: 1px solid lightgray;margin-top:3%;padding-bottom:3%;'><div class='col-md-8' style='color:#148781'>"+entry.saveTitle+"</div>"
				      	+ "<div class='col-md-4 noSpace'><img src='<%=request.getContextPath() %>/resources/images/homeDetail/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp' style='width:100%; height:80px;padding:0;margin:0;'></div></div>";
				});
				$("#myLikeRoomList").html(html);
			},
			error: function(request, status, error){
	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 		}
		});
	}
    $(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<div>   
   <div id="header">
      <div class="row height_maxPer">
         <div id="headerlogo" style="cursor:pointer;" onClick="javascript:location.href='main.air'">
            <img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width:28px; height:31px;"/>
         </div>
         <div id="searchbarDiv">
            <div id="searchbar">
               <div id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px"></div>
               <input type="text" name="birthday" id="searchInput" placeholder="검색" style="">
            </div>
         </div>
         <c:if test="${loginuser==null }">
         <div class="headermenus">
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</div>
            <div class="headermenu" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</div>
         </div>
         </c:if>
         <c:if test="${loginuser!=null }">
         <div class="headermenus">
            <c:if test="${loginuser.myroom==null }">
            <div class="headermenu" onClick="goRegistHost();">호스트가 되어보세요</div>
            </c:if>
            <c:if test="${loginuser.myroom!=null }">
            <div class="headermenu" onClick="goRegistHost();">숙소추가</div>
            <div class="headermenu" onClick="goHostMain();">호스트</div>
            </c:if>
            <div class="headermenu dropdown resize1" onClick="myLikeRoomList();">
            	<div class="dropdown-toggle" data-toggle="dropdown">저장목록</div>
            	<ul class="dropdown-menu dropdown-menu-right">
			      <li class="hoverBottomHY" style="font-weight:bold;padding-bottom:2%;">목록<span style="float:right;">목록보기</span></li>
			      <li style="margin:2%;">
			      	<div id="myLikeRoomList" class="noSpace" style="padding-bottom:2%;">
			      	</div>
			      </li>
			    </ul>
            </div>
            <div class="headermenu" onClick="">메세지</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu dropdown resize2" onClick="" style="padding:0; padding-top:5.5%;">
            	<div class="dropdown-toggle" data-toggle="dropdown" style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
            		<img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
            	</div>
            	<ul class="dropdown-menu dropdown-menu-right" style="padding:0;text-align:right;text-weight:500;">
			      <li style="padding:0; width:50px; margin:0 auto;margin-top:5%;padding-bottom:2%; font-size:12pt;">${loginuser.userid }</li>
			      <li class="profileDrop" style="border-top:1px solid lightgray;" onClick="goLogout();">로그아웃</li>
			      <li class="profileDrop" onClick="goMypage();">마이페이지</li>
			    </ul>
            </div>
         </div>
         </c:if>
      </div>
   </div>
</div>


<%-- ****** 로그인 Modal ****** --%>
<div class="modal fade" id="login" role="dialog">
	<div class="modal-dialog" style="margin-top: 10%;">
	    <form id="loginFrm" name="loginFrm">
	    <!-- Modal content-->
	    <div class="modal-content" style="width: 100%; height: 400px; margin-top:5%;">
	    	<div>
		        <div style="margin-top: 3%;">
		       		<button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 3%; background-color: white; border: 0px;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
		        </div>
		        <div style="padding:0;margin:0;width:90%;margin: 5%;">
			        <input placeholder="아이디" name="userid" class="input-data form-control" type="text" style="font-size: 13pt; margin:0 auto; border: 1px solid rightgray; height: 46px; border-radius: 10px;" />
			        <input placeholder="비밀번호" name="pwd" class="input-data form-control" type="password" style="font-size: 13pt; margin-top: 2%; border: 1px solid rightgray; height: 46px; border-radius: 10px;" /> 
		        	<input id="a" type="checkbox" style="cursor: pointer;vertical-align: middle;"  />
		        	<label style="font-size: 10pt; margin-top: 0%; padding-top: 3%; cursor: pointer;" for="a">비밀번호 저장</label>
		        	<div style="margin-top: 3%;">
		        		<a type="text" style="border: 0px solid; color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#pwdfind" data-dismiss = "modal">비밀 번호가 생각나지 않으세요?</a>
		        	</div>
		    		<button type="button" onClick="goLogin();" class="login" style="width: 100%; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;margin-top: 2%;">로그인</button>
		        </div>
		    </div>
			<div class="modal-footer" style="margin-top: 2%;">
		    	<div class="join" style=" text-align: center;" onClick="" >에어비엔비 계정이 없으세요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</a></div>  
		    </div> 
		</div>
	    <!-- Modal content End -->
	    </form>
	</div>
</div>   
<%-- ****** 회원가입 Modal ****** --%>
<div class="modal fade" id="join" role="dialog">
    <div class="modal-dialog">
    	<form name="joinFrm" enctype="multipart/form-data">
        <!-- Modal content-->
        	<div class="modal-content" style="width: 100%;padding:0;">
       			<div style="margin-top: 2%;">
		       		<button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 3%; background-color: white; border: 0px;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
		        </div>
            	<span  style="text-align:center; margin-left:30%; font-weight: bold; color: #008489;" >페이스북</span><span  style="text-align:center; font-weight: bold; " >&nbsp;또는</span>&nbsp;<span  style="text-align:center;  font-weight: bold; color: #008489;" >구글</span><span  style="text-align:center; font-weight: bold; " >로 회원 가입하세요.</span>
          		<div style="padding:0;margin:0;">
	                <div style="border-bottom: 1px solid lightgray; margin-top: 1%;padding:0;"></div>
			        <div class="filebox"  style="border: 1px solid lightgray;margin:2% auto;width:100px;height:100px;border-radius:100%;">
			        	<div id="blah" style="margin-top: 35%; width:90px; height:50px;text-align:center;margin-left:5%;">이미지를 등록해 주세요</div>
			        	<input id="imgInp" type="file" style="margin-left:10%;">
			        </div>
			        <input name="userid" placeholder="아이디" class="input-data form-control registInput" type="text"/>
			        <input name="username" placeholder="이름" class="input-data form-control registInput" type="text"/>
			        <input name="pwd" placeholder="비밀번호" class="input-data form-control registInput" type="text" />
			        <input name="email" placeholder="이메일" class="input-data form-control registInput" type="email"/>
			        <input name="phone" placeholder="전화번호" class="input-data form-control registInput" type="text"/>
			        <input name="post" placeholder="우편번호" class="input-data form-control registInput" type="number"/>
			        <input name="addr" placeholder="주소" class="input-data form-control registInput" type="text"/>
			        <input name="detailaddr" placeholder="상세주소" class="input-data form-control registInput" type="text" />
			        <textarea name="introduction" placeholder="자기소개" class="input-data form-control registInput" style="height: 90px;"></textarea>
 					<div style="margin-top:2%;">
	 					<input type="radio" id="male" name="gender" value="1" style="margin-left: 5%;" /><label for="male" style="margin-left: 2%;">남자</label>
		       			<input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
	  				</div>
	  				<div class="row noSpace" style="width:100%;padding:0;margin-top:2%;font-size: 12pt;margin-left:5%;" >
		         		<div class=" col-md-4">
		           			<c:set var="year" value="2019"></c:set>
		           			<select name="year" class="registBirthInput">
		          				<option>년</option>
		          				<c:forEach var="i" begin="1900" end="${year}" step="1" >
		             			<option value="${year - i + 1900}" style="width:100px;">${year - i + 1900}</option>
		         				</c:forEach>
		           			</select>
		    			</div>
		         		<div class="col-md-3">
		       				<select name="month" class="registBirthInput">
						        <option >월</option>
						        <c:forEach var="month" begin="1" end="12">
						        <option value="${month}">${month}</option>
						        </c:forEach> 
		        			</select>
						</div>          
		    			<div class="col-md-3">
			         		<select name="day" class="registBirthInput">
			          			<option>일</option>
						        <c:forEach var="day" begin="1" end="31" >
						        <option value="${day}">${day}</option>
						        </c:forEach>
			           		</select>
						</div>
					</div>
		         	<button type="button" class="login" style="width: 90%; height: 40px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;  margin-left: 5%; margin-top: 2%; padding:0;" onClick="join();">가입하기</button>
			        <div class="modal-footer" style="margin-top: 2%;">
		            	<div class="join" style="font-size: 12pt;  text-align: center; onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
		        	</div>
      			</div>
			</div>
    	</form>
	</div>
</div> 

<%-- ****** 비밀번호찾기 Modal ****** --%>
<div class="modal fade" id="pwdfind" role="dialog">
	<div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content" style="width: 568px; height: 372px;">   
	    	<button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 5%; background-color: white;  margin-top: 2%; margin-bottom: 5%; border: 0px;"><img src="<%=request.getContextPath() %>/resources/ymimg/cancel.png" alt="X"></button>
        	<span style="font-size: 15pt; font-weight: bold; margin-left: 5%; margin-bottom: 5%;">비밀번호 재설정</span>
            <span style="margin-top:5%; margin-left: 5%; font-size: 12pt; ">계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를</span>
            <span style="margin-left: 5%; font-size: 12pt; ">전송해 드립니다.</span>
            <span style="font-size: 11pt; font-weight: bold; margin-left: 5%; margin-bottom: 5%;">이메일 주소</span>
          	<input  class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          	<div><img src="<%=request.getContextPath() %>/resources/ymimg/back.png" alt="X"><a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인으로 돌아가기</a></div>  
      	</div>
    </div>
    <div class="col-md-3 calc"  style="margin-left: 7%;">
		<c:set var="year" value="2019"></c:set>
        <select  style="width:100%; text-align: left; margin-left: 5%; overflow-y:scroll; border:none; font-size: 13pt; margin-top:9%;">
	        <option>년</option>
	        <c:forEach var="i" begin="1900" end="${year}" step="1" >
	        <option value="${year - i + 1900}">${year - i + 1900}</option>
         	</c:forEach>
        </select>
    </div>
    <button type="button" class="login" style="width: 504px; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;  margin-left: 5%; margin-top: 2%; " onClick="join();">가입하기</button>
    <div class="modal-footer" style="margin-top: 2%;">
    	<div class="join" style="font-size: 13pt;  text-align: center;" onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
    </div>    
</div>
