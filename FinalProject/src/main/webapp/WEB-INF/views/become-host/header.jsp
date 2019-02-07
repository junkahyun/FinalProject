<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

$(document).ready(function(){
	


$("#loginpwd").keydown(function(event){
    if(event.keyCode==13) goLogin();
 });
 $("#goLoginBtn").click(function(){
    goLogin();
 });

});


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
</script>
<div>
	<img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width: 30px; height: 30px; margin-top: 20px; margin-left: 20px;">
	<hr/>
	<button data-toggle = "modal" data-target="#login" data-dismiss = "modal" >로그인</button>
	
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
		    		<button type="button" id="goLoginBtn" class="login" style="width: 100%; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;margin-top: 2%;">로그인</button>
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