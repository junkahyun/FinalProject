$(document).ready(function(){
	
			// 윈도우 일정 스크롤 내려갈 시 퀵메뉴 보이기
			$(window).scroll(function(){
				if ($(this).scrollTop() > 200) {
		          $('#quick').fadeIn(); 
				}else {
		    	  $('#quick').fadeOut(); 
				}
			}); 
			
			// toUp Click function
			$("#toUp").click(function(){
				$('html, body').animate({
			      scrollTop: 0
			    }, 400);
			    return false;
			});
			
			$("#toDown").click(function(){
				$('html, body').animate({
			      scrollTop: $(document).height()
			    }, 400);
			    return false;
			});
			
			$("#startdate").datepicker({
				dateFormat: "yy-mm-dd", 
				minDate: 0, 
				changeMonth : true,
				changeYear : true,
				monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNamesMin :['일','월','화','수','목','금','토']
			});
			$("#enddate").datepicker({
				dateFormat: "yy-mm-dd", 
				minDate: 0, 
				changeMonth : true,
				changeYear : true,
				monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNamesMin :['일','월','화','수','목','금','토']
			});
				 
			 $('#sido').on('hidden.bs.modal', function () {
				var sido = $(this).find("select[name^=sido]").val();
				var gugun = $(this).find("select[name^=gugun]").val();
				var dong = $(this).find("select[name^=dong]").val();  
				
			    window.parent.document.getElementById("searchcity").value = sido;
			    window.parent.document.goListFrm.sido.value = sido;
			    window.parent.document.goListFrm.gugun.value = gugun;
			    window.parent.document.goListFrm.dong.value = dong; 
			});
			 
			$("#goSearch").click(function(){
				var city = $("#searchcity").val();
				var checkin = $("#startdate").val();
				var checkout = $("#enddate").val();				
				
				var indate = checkin.substring(8);
				var outdate = checkout.substring(8);
				//alert("checkin : " + checkin);
				
				var flag = false;
				
				if(city == "도시"){
					alert("도시를 설정해주세요.");
					flag = true;
					return;
				}
				if(checkin == "체크인"){
					alert("체크인 날짜를 설정해주세요.");
					flag = true;
					return;
				}
				if(checkout == "체크아웃"){
					alert("체크아웃 날짜를 설정해주세요.");
					flag = true;
					return;
				}
				 
				if(!flag){
					if(parseInt(outdate) - parseInt(indate) < 0 ){
						alert("체크아웃 날짜가 체크인 날짜보다 먼저일 수 없습니다.");
					}else{
						var frm = document.goListFrm;
						//alert(frm.sido.value + frm.gugun.value + frm.dong.value);
						frm.method = "GET"; 
						frm.action = "list.air";
						frm.submit();	
					} 
				} 
			});
			
			// 회원가입 , 로그인, 비밀번호찾기
			$(".passIcon").addClass("passIconHide");
			$(".error").hide();
			
	   		$("#loginpwd").keydown(function(event){
	         	if(event.keyCode==13) {
	         		goLogin();
	         	}
	      	});
	   		
	      	$("#searchAddrBtn").click(function() {
	          	new daum.Postcode({
	               	oncomplete: function(data) {
	                  	$("#addr").val(data.address);
	                   	$("#post").val(data.zonecode);
	               	}
	           	}).open();
	          	$("#detailaddr").focus();
	      	});
	       	$("#userid").blur(function(){
	       		var userid = $("#userid").
	       		val().trim();
	       		if(userid==""){
	   				$("#userid").parent().find(".error").text("아이디를 입력해 주세요.");
	   				$("#userid").parent().find(".passIcon").addClass("passIconHide");
	   				$("#userid").parent().find(".error").show();
	       			return;
	       		}
	           	var form_data = {"userid":userid};
	       		$.ajax({
	           		url:"idDuplicateCheck.air",
	           		type:"POST",
	           		data:form_data,
	           		dataType:"json",
	           		success:function(json){
	           			var n = json.n;
	           			if(n=="1"){
	           				$("#userid").parent().find(".error").text("이미 사용중인 아이디 입니다.");
	           				$("#userid").parent().find(".passIcon").addClass("passIconHide");
	           				$("#userid").parent().find(".error").show();
	           			}
	           			else{
	           				$("#userid").parent().find(".passIcon").removeClass("passIconHide");
	           				$("#userid").parent().find(".error").hide();
	           			}
	           		},
	           		error: function(request, status, error){
	                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	                }
	           	});
	       	}); // end of $(".requiredInfo").each()-------
	       	$("#username").blur(function(){
	           	var data = $(this).val().trim();
	           	if(data == "") { // 입력하지 않거나 공백만 입력했을 경우
	   				$("#username").parent().find(".passIcon").addClass("passIconHide");
	           	}
	           	else{
	   				$("#username").parent().find(".passIcon").removeClass("passIconHide");
	           	}
	       	}); // end of $(".requiredInfo").each()-------
	       
	       	$("#pwd").blur(function(){
	          	var passwd = $("#pwd").val();
	          	var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
	          	var bool = regExp_PW.test(passwd);
	          	if(!bool) {
	   				$("#pwd").parent().parent().find(".error").text("암호는 영문,숫자,특수문자가 혼합된 10글자 이상이어야합니다.");
	   				$("#pwd").parent().parent().find(".passIcon").addClass("passIconHide");
	   				$("#pwd").parent().parent().find(".error").show();
	   				$("#pwd").focus();
	          	}
	          	else{
	          		$("#pwd").parent().parent().find(".error").hide();
	          	}
	       	}); // end of $("#pwd").blur()---------------
	       	$("#pwdcheck").blur(function(){
	          	var passwd = $("#pwd").val();
	          	var passwdCheck = $("#pwdcheck").val();
	          	if(passwd != passwdCheck) {
	   				$("#pwdcheck").parent().parent().find(".error").text("암호를 동일하게 입력해 주세요");
	   				$("#pwdcheck").parent().parent().find(".passIcon").addClass("passIconHide");
	   				$("#pwdcheck").parent().parent().find(".error").show();
	          	}
	          	else{
	   				$("#pwdcheck").parent().parent().find(".passIcon").removeClass("passIconHide");
	   				$("#pwdcheck").parent().parent().find(".error").hide();
	          	}
	       	});// end of $("#pwdcheck").blur()--------------
	       	$("#email").blur(function(){
	          	var email = $(this).val();
	          	var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
	          	var bool = regExp_EMAIL.test(email);
	          	if(!bool) {
	   				$("#email").parent().find(".error").text("이메일 형식에 맞게 입력해 주세요.");
	   				$("#email").parent().find(".passIcon").addClass("passIconHide");
	   				$("#email").parent().find(".error").show();
	          	}
	          	else{
	   				$("#email").parent().find(".passIcon").removeClass("passIconHide");
	   				$("#email").parent().find(".error").hide();
	          	}
	       	});// end of $("#email").blur()--------------
	       	$("#phone").blur(function(){
	          	var phone = $("#phone").val();
	          	var regExp_PHONE = /^\d{3}\d{3,4}\d{4}$/;
	          	var bool = regExp_PHONE.test(phone);
	          	if(!bool) {
	          		$("#phone").parent().find(".error").text("핸드폰 형식에 맞게 입력해 주세요.");
	   				$("#phone").parent().find(".passIcon").addClass("passIconHide");
	   				$("#phone").parent().find(".error").show();
	          	}
	          	else{
	   				$("#phone").parent().find(".passIcon").removeClass("passIconHide");
	   				$("#phone").parent().find(".error").hide();
	          	}
	       	});// end of $("#hp2").blur()-------------
			$("#detailaddr").blur(function(){
				var addr = $("#addr").val();
				var detailaddr = $("#detailaddr").val().trim();
	       		if(addr==""){
	     			$("#addr").parent().find(".passIcon").addClass("passIconHide");
	           	}
	       		else{
	       			$("#addr").parent().find(".passIcon").removeClass("passIconHide");
	       		}
				if(detailaddr==""){
	    			$("#detailaddr").parent().find(".passIcon").addClass("passIconHide");
	       		}
				else{
	    			$("#detailaddr").parent().find(".passIcon").removeClass("passIconHide");
				}
	       	});
	       	$("#imgInput").change(function(){
	          	readURL(this);
	          	$("#blah").hide();
	      	});
	       	$("#fileInputBtn").click(function(){
	          	$("#imgInput").click();
	       	});
	       	$("#registBtn").click(function(){
	       		var flag = false;
	       		$(".birth").each(function(){
	       			var thisval = $(this).val();
	       			if(thisval == -1){
	       				flag = true;
	       			}
	       		});
	       		if(flag == true){
	       			alert("생년월일을 입력해주세요.");
	       			return;
	       		}
	       		var checkCnt = 0;
	       		$(".registInput").each(function(){
	           		var hidden = $(this).parent().find(".passIcon").css("display") == "none";
	       			if(hidden){
	       				checkCnt++;
	       			}
	       		});
	       		if(checkCnt==0){
	       			$("#joinFrm").ajaxForm({
	       				url:"joinEnd.air",
	       				type:"POST",
	       				//data:form_data, 
	       				dataType:"JSON",
	       				success:function(json){
	       					var n = json.n;
	       					if(n=="1"){
	       						alert("회원가입 되었습니다.");
	       						location.reload();
	       					}
	       				},
	       				error: function(request, status, error){
	                        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	                    }
	       			})
	       			$("#joinFrm").submit();
	       		}
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
          var userid = json.userid;
          
          //alert(userid);
          if(logincheck=="true" && userid != "admin"){
             alert("로그인 되었습니다.");
             location.reload();
          }else if(logincheck=="true" && userid == "admin"){
        	  alert("관리자로 로그인 되었습니다.");
        	  location.href="admin.air";
          }else{
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
    location.href="roomstep1.air";
 }
 function goMypage(){
    location.href="myEdit.air";
 }
 function goHostMain(){
    location.href="hostMain.air";
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
 
 function goRoomDetail(roomcode){
	 var roomcode = roomcode;
	 location.href="homeDetail.air?roomcode="+roomcode;
 }
 