<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.line{width: 70%;

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
</style>

<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold;">사진 전체로 돌아가기</a>
	<hr class="line" align="left">
</div>

<div class="col-md-4" style="margin-left: 22%;">
	<img class="homeimg" alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg">
</div>

 <div class="col-md-3">
 	<span style="font-weight: bold;">커버사진</span>
 	<hr class="line2" align="left">
 	<p>설명</p>
 	<p>사진에 대한 세부정보를 추가하세요</p>
 	<textarea rows="5" cols="45"></textarea>
 	<br><br>
	<button class="btn" style="background-color:  #008489;"><span style="color: white; font-weight: bold;">설정 저장하기</span></button>
	<br><br>
	<a>사진 삭제</a>
</div>

<div class="col-md-12" style="margin-left: 22%; width: 75%;">
	<hr class="line" align="left">
</div>









