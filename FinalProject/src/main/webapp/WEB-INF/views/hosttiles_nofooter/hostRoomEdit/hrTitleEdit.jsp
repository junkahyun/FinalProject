<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>
.line{width: 45%;

}
.line2{
	width: 78%;
}
.homeimg{
	width: 100%;
}
p{font-size: 12pt; 
}

body{color: #484848;
}

a{font-weight: bold; color: #008489; font-size: 10pt; 
}

h4,h3{font-weight: bold; margin-top: 2%; 
}

div{border:  0px solid gray;  
}

/* Style the tab */
.tab {
  overflow: hidden;
  border-bottom: 1px solid #ccc;
  font-weight: bold;
  display: inline-block;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  
}
.number{font-weight: bold; font-size: 12pt;
}

/* Change background color of buttons on hover */

.tab button:focus{
   color: #008489;
   font-weight: bold;
   display: inherit;
   text-decoration: underline;
}

.tablinks{border-bottom: 1px solid #008489;
}
/* Style the tab content */
.tabcontent {
  width: 70%;
}
.btn{font-size: 12pt; background-color: white; border: 1px solid #008489;
}
.editbtn{color: #008489; font-weight: bold;
}
.bedAndPeople{font-size: 12pt; margin-bottom: 3%;
}

.fa-angle-left:focus{text-decoration: underline;
}

.gohostroomEdit{
	font-size: 13pt; 
	color: #008489; 
	cursor: pointer; 
	font-weight: bold;
}
</style>

<script>
	$(document).ready(function(){
		$("#title").focus(function(){
			$("#title").val("");
		});
		
		$("#roomContent").focus(function(){
			$("#roomContent").val("");
		});
		
		$("#saveRoomInfo").click(function(){
			var form_data = {"roomcode":"${roomvo.roomcode}",roomname:$("#title").val(), roomInfo:$("#roomContent").val()};
			console.log(form_data);
			$.ajax({
				url:"changeRoomInfo.air",
				data:form_data,
				type:"POST",
				dataType:"JSON",
				success:function(json){
					alert("저장하기 완료");
					$("#title").val(json.roomname);
					$("#roomContent").val(json.roomInfo);					
				},
				error:function(){
					
				}
			}); 
			
		});	
	});
	

	function savecancel(){
		var form_data = {"roomcode":"${roomvo.roomcode}"};
		console.log(form_data);
		$.ajax({
			url:"savecancel.air",
			data:form_data,
			type:"GET",
			dataType:"JSON",
			success:function(json){
					//alert("취소");
					$("#title").val(json.roomname);
					$("#roomContent").val(json.roomInfo);					
			},
			error:function(){
				
			}
		}); 
	}
	
	function gohostRoomEdit(roomcode) {
		location.href="hostRoomEdit.air?roomcode="+roomcode;
	}
</script>

<form name="roomInfo">
<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%; margin-bottom: 5%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a class="gohostroomEdit" onclick="gohostRoomEdit('${roomvo.roomcode}');">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">제목과 설명</h3>
	<p>게스트가 회원님의 숙소에 대해 쉽게 파악할 수 있도록 제목과 설명을 추가하세요.</p>
	<h4>한국어</h4>
	<p>제목</p>
	<p>숙소 이름을 한국어로 입력하세요.</p>
	<input type="hidden" name="roomcode" value="${roomvo.roomcode }">
	<input type="text" class="form-control" id="title" name="title" style="width: 45%;" value="${roomvo.roomName }">
	<hr class="line" align="left">
	
	<p>숙소 설명</p>
	<p>숙소의 특징을 한국어로 자세히 설명하세요.</p>
	<textarea id="roomContent" name="roomContent" class="form-control" rows="6" style="width: 45%;">${roomvo.roomInfo}</textarea>
	
	<hr class="line" align="left">
	
	<button id="saveRoomInfo" type="button" class="btn"><span class="editbtn">저장하기</span></button>
	<input type="button" id="cancel" class="btn" style="background-color:  #008489;color: white; font-weight: bold;" value="취소하기" onclick="savecancel();">
</div>
</form>
