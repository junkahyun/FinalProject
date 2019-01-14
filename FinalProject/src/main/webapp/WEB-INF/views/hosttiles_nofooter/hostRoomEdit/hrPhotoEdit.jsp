<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
hr{width: 70%; 
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

.photodiv{
	width: 75%; 
	margin-left: 22%;
}
.imgList{
	margin-left: 22%;
}
.imgList>img{
	display: block;
}
</style>

<script>

	$(document).ready(function(){
		$(".imgList").sortable({
			items: $(".target")
		});
	});
	
	function imgfileUplode(){
		
	}
</script>

<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold;">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">사진</h3>
	<p>게스트에게 숙소의 실제 모습을 보여주는 사진을 추가하세요.</p>
	<hr align="left">
</div>

<div class="col-md-4" style="margin-left: 22%;" align="center">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg">
</div>

 <div class="col-md-3">
 	<span style="font-weight: bold;">커버사진</span>
 	<a><span style="margin-left: 60%;">변경</span></a>
 	<br>
	<button type="button" class="btn" onclick="imgfileUplode()"><span class="editbtn">캡션 추가하기</span></button>
</div>
	
<div class="col-md-12 photodiv">
	<hr align="left">
	<h3 align="left" style="font-weight: bold;">사진정렬</h3>
	<p>사진을 끌어와 원하는 순서대로 정렬할 수 있습니다.</p>
</div>
<div class="row  imgList">
	<img class="col-md-2 target" alt="" src="<%=request.getContextPath()%>/resources/images/sampleroom1.jpg">
	<img class="col-md-2 target" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg">
	<img class="col-md-2 target" alt="" src="<%=request.getContextPath()%>/resources/images/crop-square_icon-icons.com_56094.png">
</div>
	
	

