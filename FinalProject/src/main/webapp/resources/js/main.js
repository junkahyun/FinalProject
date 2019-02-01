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
				
			var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주특별자치도"];
			var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			var area3 = ["대덕구","동구","서구","유성구","중구"];
			var area4 = ["광산구","남구","동구",     "북구","서구"];
			var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			var area6 = ["남구","동구","북구","중구","울주군"];
			var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			var area16 = ["서귀포시","제주시","남제주군","북제주군"];

			 

			 // 시/도 선택 박스 초기화

			 $("select[name^=sido]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>구/군 선택</option>");
			 });

			 

			 // 시/도 선택시 구/군 설정

			 $("select[name^=sido]").change(function() {
			  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			  var $gugun = $(this).next(); // 선택영역 군구 객체
			  $("option",$gugun).remove(); // 구군 초기화

			  if(area == "area0")
			   $gugun.append("<option value=''>구/군 선택</option>");
			  else {
			   $.each(eval(area), function() {
			    $gugun.append("<option value='"+this+"'>"+this+"</option>");
			   });
			   document.getElementById("selectCity").value = $(this).val();
			  }
			 });
			 
			 $('#sido').on('hidden.bs.modal', function () {
				 var sido = $(this).find("select[name^=sido]").val();
				 var gugun = $(this).find("select[name^=gugun]").val();
				 var lastValue = "";
				  
				 if(sido.substring(sido.length-1) == "시"){
					 lastValue = sido;
				 }else{
					 lastValue = gugun; 
				 } 
				 
				if(lastValue == ""){
					lastValue = "도시";
				} 
			    window.parent.document.getElementById("searchcity").value = lastValue;
			     
			});
			 
			$("#goSearch").click(function(){
				var city = $("#searchcity").val();
				var checkin = $("#startdate").val();
				var checkout = $("#enddate").val();				
				
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
					var frm = document.goListFrm;
					frm.method = "GET";
					frm.action = "list.air";
					frm.submit();	
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
	       		var userid = $("#userid").val().trim();
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
    location.href="roomstep1.air";
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
 
 function goRoomDetail(roomcode){
	 var roomcode = roomcode;
	 location.href="homeDetail.air?roomcode="+roomcode;
 }
 