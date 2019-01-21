<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   $(document).ready(function(){
      $("#loginpwd").keyDown(function(event){
         if(event.target==13){
            goLogin();
         }
      })
      $("#searchAddrBtn").click(function() {
          new daum.Postcode({
               oncomplete: function(data) {
                  $("#addr").val(data.address);
                   $("#post").val(data.zonecode);
               }
           }).open();
      });
       $(".error").hide();
       $("#error_passwd").hide();
       $("#name").focus();
       $("#userid").each(function(){
          $(this).blur(function(){
             var data = $(this).val().trim();
             if(data == "") {// 입력하지 않거나 공백만 입력했을 경우
                $(this).parent().find(".error").show();
                $(this).focus();
             }
             else {// 공백이 아닌 글자를 입력했을 경우
                $(this).parent().find(".error").hide();
             }
          });
       }); // end of $(".requiredInfo").each()-------
       $("#username").each(function(){
          $(this).blur(function(){
             var data = $(this).val().trim();
             if(data == "") {
                // 입력하지 않거나 공백만 입력했을 경우
                $(this).parent().find(".error").show();
                $(this).focus();
             }
             else {
                // 공백이 아닌 글자를 입력했을 경우
                $(this).parent().find(".error").hide();
             }
          });
       }); // end of $(".requiredInfo").each()-------
       
       $("#pwd").blur(function(){
          var passwd = $(this).val();
          var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
          var bool = regExp_PW.test(passwd);
          if(!bool) {
             $("#error_passwd").show();
             $(":input").attr("disabled",true).addClass("bgcol"); 
             $(this).attr("disabled",false).removeClass("bgcol");
             $(this).focus();
          }
          else {
             $("#error_passwd").hide();
             $(":input").attr("disabled",false).removeClass("bgcol"); 
             $("#pwdcheck").focus();
          } 
       }); // end of $("#pwd").blur()---------------
       $("#pwdcheck").blur(function(){
          var passwd = $("#pwd").val();
          var passwdCheck = $(this).val();
          
          if(passwd != passwdCheck) {
             $(this).parent().find(".error").show();
             $(":input").attr("disabled",true).addClass("bgcol");
             $(this).attr("disabled",false).removeClass("bgcol");
             $("#pwd").attr("disabled",false).removeClass("bgcol");
             $("#pwd").focus();
          }
          else {
             $(this).parent().find(".error").hide();
             $(":input").attr("disabled",false).removeClass("bgcol");
          }
       });// end of $("#pwdcheck").blur()--------------
       $("#email").blur(function(){
          var email = $(this).val();
          var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
          var bool = regExp_EMAIL.test(email);
          if(!bool) {
             $(this).parent().find(".error").show();
             $(":input").attr("disabled",true).addClass("bgcol");
             $(this).attr("disabled",false).removeClass("bgcol"); 
             $(this).focus();
          }
          else {
             $(this).parent().find(".error").hide();
             $(":input").attr("disabled",false).removeClass("bgcol");
          }
       });// end of $("#email").blur()--------------
       $("#hp2").blur(function(){
          var hp2 = $(this).val();
          var bool1 = false;
          var regExp_HP2a = /[1-9][0-9][0-9]/g;
          var bool1 = (hp2.length == 3) && regExp_HP2a.test(hp2);
          var bool2 = false;
          var regExp_HP2b = /[0-9][0-9][0-9][0-9]/g;
          var bool2 = (hp2.length == 4) && regExp_HP2b.test(hp2);
          if( !(bool1 || bool2) ) {
             $(this).parent().find(".error").show();
             $(":input").attr("disabled", true).addClass("bgcol");
             $(this).attr("disabled", false).removeClass("bgcol");
          }
          else {
             $(this).parent().find(".error").hide();
             $(":input").attr("disabled", false).removeClass("bgcol");
          }
       });// end of $("#hp2").blur()-------------
       $("#hp3").blur(function(){
          var hp3 = $(this).val();
          var regExp_HP3 = /\d{4}/g;
          var bool = regExp_HP3.test(hp3);
          if(!bool) {
             $(this).parent().find(".error").show();
             $(":input").attr("disabled", true).addClass("bgcol");
             $(this).attr("disabled", false).removeClass("bgcol");
          }
          else {
             $(this).parent().find(".error").hide();
             $(":input").attr("disabled", false).removeClass("bgcol");
          }         
       });// end of $("#hp3").blur()-------------
       $("#zipcodeSearch").click(function(){
          new daum.Postcode({
             oncomplete: function(data) {
                 $("#post1").val(data.postcode1);  // 우편번호의 첫번째 값     예> 151
                 $("#post2").val(data.postcode2);  // 우편번호의 두번째 값     예> 019
                 $("#addr1").val(data.address);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
                 $("#addr2").focus();
             }
          }).open();
       });
       $(".address").blur(function(){
          var address = $(this).val().trim();
          if(address == "") {
             $(this).parent().find(".error").show();
             $(":input").attr("disabled", true).addClass("bgcol");
             $(this).attr("disabled", false).removeClass("bgcol");
          }
          else {
             $(this).parent().find(".error").hide();
             $(":input").attr("disabled", false).removeClass("bgcol");
          }
       });
       $("#imgInput").change(function(){
          readURL(this);
          $("#blah").hide();
      });
       $("#fileInputBtn").click(function(){
          $("#imgInput").click();
       });
    }); // end of $(document).ready()-------------------
   
    function join(event) {
   
        var frm = document.joinFrm;
        frm.method = "POST";
        frm.action = "/bnb/join.air";
        frm.submit();
    }// end of function goRegister(event)----------
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
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#profilePreview').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
       }
   }
</script>
<div>   
   <div id="header">
      <div class="row height_maxPer">
         <div id="headerlogo" style="cursor:pointer;" onClick="javascript:location.href='index.air'">
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
            <c:if test="${loginuser.myroomList==null }">
            <div class="headermenu" onClick="goRegistHost();">호스트가 되어보세요</div>
            </c:if>
            <c:if test="${loginuser.myroomList!=null }">
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
			        <input id="loginpwd" placeholder="비밀번호" name="pwd" class="input-data form-control" type="password" style="font-size: 13pt; margin-top: 2%; border: 1px solid rightgray; height: 46px; border-radius: 10px;" /> 
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
	       		<button type="button" class="myclose" data-dismiss="modal" style="margin-left: 3%; background-color: white; border: 0px;margin-top:2%;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
            	<span  style="text-align:center; margin-left:21%; font-weight: bold; color: #008489;" >페이스북</span><span  style="text-align:center; font-weight: bold; " >&nbsp;또는</span>&nbsp;<span  style="text-align:center;  font-weight: bold; color: #008489;" >구글</span><span  style="text-align:center; font-weight: bold; " >로 회원 가입하세요.</span>
          		<div style="padding:0;margin:0;">
	                <div style="border-bottom: 1px solid lightgray; margin-top: 1%;padding:0;"></div>
			        <div style="border: 1px solid lightgray;overflow:hidden; margin:2% auto;width:100px;margin-bottom:3%; height:100px;border-radius:100%;">
			        	<img id="profilePreview" style="width:100%;"/>
			        </div>
			        <div style="position:absolute; top:16%;left:30%;">
			         	<input type="file" id="imgInput" style="display:none;position:absolute;height:30px;z-index:2;width:150px;margin-left:28%;">
				        <button id="fileInputBtn" type="button" style="width:150px; height:30px;background-color:lightgray;border:none;font-weight:bold;color:white;border-radius:3px;margin-left:30%;">프로필 이미지 선택</button>
			        </div>
			        <label style="position:fixed; left:7%;font-weight:bold;margin-top:1.5%;">ID</label>
			        <input name="userid" id="userid" placeholder="아이디" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">NAME</label>
			        <input name="username" id="username" placeholder="이름" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        <div class="row" style="padding:0;margin-left: 2.5%;margin-top:1%;">
				        <div class="col-md-6" style="padding:0;">
				        	<label style="position:fixed;z-index:1; left:7%;font-weight:bold;margin-top:2.5%;">PW</label>
				        	<input name="pwd" id="pwd" placeholder="비밀번호" class="col-md-6 input-data form-control registInput" type="password" style="width: 100%;padding-left: 30%;"/>
				        </div>
				        <div class="col-md-5" style="padding:0;margin-left: 2%;">
				        	<input name="pwd" id="pwdcheck" placeholder="비밀번호 확인" class="col-md-6 input-data form-control registInput" type="password" style="width: 92%;"/>
			        	</div>
			        </div>
			        <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">EMAIL</label>
			        <input name="email" id="email" placeholder="이메일" class="input-data form-control registInput" type="email" style="padding-left: 15%;"/>
			        <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">PHONE</label>
			        <input name="phone" id="phone" placeholder='"-"없이 입력해주세요' class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
			        <div class="row" style="padding:0;margin-top:1%;">
				        <div class="col-md-6" style="padding:0;margin-left:4.5%;">
				        	<label style="position:fixed; left:7%;font-weight:bold;margin-top:2.5%;z-index:1;">POST</label>
			        		<input name="post" id="post" placeholder="우편번호" class="input-data form-control registInput" type="text"  style="width:100%;padding-left: 28%;"/>
				        </div>
				        <div class="col-md-5" style="margin-left:3%;margin-top:1%;">
				        	<button id="searchAddrBtn" type="button" style="height:40px;width:88%;border:none;background-color: lightgray;color:white;font-weight:bold;border-radius:5px;">주소찾기</button>
				        </div>
			        </div>
			        <input name="addr" id="addr" placeholder="주소" class="input-data form-control registInput" type="text" />
			        <input name="detailaddr" id="addrDetail" placeholder="상세주소" class="input-data form-control registInput" type="text"/>
			        <textarea name="introduction" id="introduction" placeholder="자기소개" class="input-data form-control registInput" style="height: 90px;"></textarea>
 					<div style="margin-top:2%;">
	 					<input type="radio" id="male" name="gender" value="1" style="margin-left: 5%;" checked/><label for="male" style="margin-left: 2%;">남자</label>
		       			<input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
	  				</div>
	  				<div class="row noSpace" style="width:100%;padding:0;margin-top:2%;font-size: 12pt;margin-left:5%;" >
		         		<div class="col-md-4">
		           			<c:set var="year" value="2019"></c:set>
		           			<select name="year" class="birth registBirthInput">
		          				<option value="-1">년</option>
		          				<c:forEach var="i" begin="1900" end="${year}" step="1" >
		             			<option value="${year - i + 1900}" style="width:100px;">${year - i + 1900}</option>
		         				</c:forEach>
		           			</select>
		    			</div>
		         		<div class="col-md-3">
		       				<select name="month" class="birth registBirthInput">
						        <option value="-1">월</option>
						        <c:forEach var="month" begin="1" end="12">
						        <option value="${month}">${month}</option>
						        </c:forEach> 
		        			</select>
						</div>          
		    			<div class="col-md-3">
			         		<select name="day" class="birth registBirthInput">
			          			<option value="-1">일</option>
						        <c:forEach var="day" begin="1" end="31" >
						        <option value="${day}">${day}</option>
						        </c:forEach>
			           		</select>
						</div>
					</div>
		         	<button type="button" class="login" onClick="join();"style="width: 90%;height: 40px; border: 1px solid rightgray; border: none; font-weight:bold;background-color: #fd5a61; color: white; border-radius: 10px;margin-left: 5%; margin-top: 2%;padding:0;">가입하기</button>
			        <div class="modal-footer" style="margin-top: 2%;">
		            	<div class="join" style="font-size: 12pt;  text-align: center;" onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
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
       <form name="joinFrm" enctype="multipart/form-data">
        <!-- Modal content-->
           <div class="modal-content" style="width: 100%;padding:0;">
                <button type="button" class="myclose" data-dismiss="modal" style="margin-left: 3%; background-color: white; border: 0px;margin-top:2%;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" style="width:24px;height:24px;"></button>
               <span  style="text-align:center; margin-left:21%; font-weight: bold; color: #008489;" >페이스북</span><span  style="text-align:center; font-weight: bold; " >&nbsp;또는</span>&nbsp;<span  style="text-align:center;  font-weight: bold; color: #008489;" >구글</span><span  style="text-align:center; font-weight: bold; " >로 회원 가입하세요.</span>
                <div style="padding:0;margin:0;">
                   <div style="border-bottom: 1px solid lightgray; margin-top: 1%;padding:0;"></div>
                 <div style="border: 1px solid lightgray;overflow:hidden; margin:2% auto;width:100px;margin-bottom:3%; height:100px;border-radius:100%;">
                    <img id="profilePreview" style="width:100%;"/>
                 </div>
                 <div style="position:absolute; top:16%;left:30%;">
                     <input type="file" id="imgInput" style="display:none;position:absolute;height:30px;z-index:2;width:150px;margin-left:28%;">
                    <button id="fileInputBtn" type="button" style="width:150px; height:30px;background-color:lightgray;border:none;font-weight:bold;color:white;border-radius:3px;margin-left:30%;">프로필 이미지 선택</button>
                 </div>
                 <label style="position:fixed; left:7%;font-weight:bold;margin-top:1.5%;">ID</label>
                 <input name="userid" id="userid" placeholder="아이디" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
                 <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">NAME</label>
                 <input name="username" id="username" placeholder="이름" class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
                 <div class="row" style="padding:0;margin-left: 2.5%;margin-top:1%;">
                    <div class="col-md-6" style="padding:0;">
                       <label style="position:fixed;z-index:1; left:7%;font-weight:bold;margin-top:2.5%;">PW</label>
                       <input name="pwd" id="pwd" placeholder="비밀번호" class="col-md-6 input-data form-control registInput" type="text" style="width: 100%;padding-left: 30%;"/>
                    </div>
                    <div class="col-md-5" style="padding:0;margin-left: 2%;">
                       <input name="pwd" id="pwd" placeholder="비밀번호 확인" class="col-md-6 input-data form-control registInput" type="text" style="width: 92%;"/>
                    </div>
                 </div>
                 <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">EMAIL</label>
                 <input name="email" id="email" placeholder="이메일" class="input-data form-control registInput" type="email" style="padding-left: 15%;"/>
                 <label style="position:fixed; left:7%;font-weight:bold;margin-top:3.5%;">PHONE</label>
                 <input name="phone" id="phone" placeholder='"-"없이 입력해주세요' class="input-data form-control registInput" type="text" style="padding-left: 15%;"/>
                 <div class="row" style="padding:0;margin-top:1%;">
                    <div class="col-md-6" style="padding:0;margin-left:4.5%;">
                       <label style="position:fixed; left:7%;font-weight:bold;margin-top:2.5%;z-index:1;">POST</label>
                       <input name="post" id="post" placeholder="우편번호" class="input-data form-control registInput" type="text"  style="width:100%;padding-left: 28%;"/>
                    </div>
                    <div class="col-md-5" style="margin-left:3%;margin-top:1%;">
                       <button id="searchAddrBtn" type="button" style="height:40px;width:88%;border:none;background-color: lightgray;color:white;font-weight:bold;border-radius:5px;">주소찾기</button>
                    </div>
                 </div>
                 <input name="addr" id="addr" placeholder="주소" class="input-data form-control registInput" type="text" />
                 <input name="detailaddr" id="addrDetail" placeholder="상세주소" class="input-data form-control registInput" type="text"/>
                 <textarea name="introduction" id="introduction" placeholder="자기소개" class="input-data form-control registInput" style="height: 90px;"></textarea>
                <div style="margin-top:2%;">
                   <input type="radio" id="male" name="gender" value="1" style="margin-left: 5%;" checked/><label for="male" style="margin-left: 2%;">남자</label>
                      <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
                 </div>
                 <div class="row noSpace" style="width:100%;padding:0;margin-top:2%;font-size: 12pt;margin-left:5%;" >
                     <div class="col-md-4">
                          <c:set var="year" value="2019"></c:set>
                          <select name="year" class="birth registBirthInput">
                            <option value="-1">년</option>
                            <c:forEach var="i" begin="1900" end="${year}" step="1" >
                            <option value="${year - i + 1900}" style="width:100px;">${year - i + 1900}</option>
                           </c:forEach>
                          </select>
                   </div>
                     <div class="col-md-3">
                         <select name="month" class="birth registBirthInput">
                          <option value="-1">월</option>
                          <c:forEach var="month" begin="1" end="12">
                          <option value="${month}">${month}</option>
                          </c:forEach> 
                       </select>
                  </div>          
                   <div class="col-md-3">
                        <select name="day" class="birth registBirthInput">
                            <option value="-1">일</option>
                          <c:forEach var="day" begin="1" end="31" >
                          <option value="${day}">${day}</option>
                          </c:forEach>
                          </select>
                  </div>
               </div>
                  <button type="button" class="login" onClick="join();"style="width: 90%;height: 40px; border: 1px solid rightgray; border: none; font-weight:bold;background-color: #fd5a61; color: white; border-radius: 10px;margin-left: 5%; margin-top: 2%;padding:0;">가입하기</button>
                 <div class="modal-footer" style="margin-top: 2%;">
                     <div class="join" style="font-size: 12pt;  text-align: center;" onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
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
