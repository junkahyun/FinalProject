<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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

div{border:  1px solid gray;  
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

<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%; border: 1px soil gray;">
	<i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold;">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">사진</h3>
	<p>게스트에게 숙소의 실제 모습을 보여주는 사진을 추가하세요.</p>
	<hr align="left">
</div>

<div class="col-md-4" style="margin-left: 22%; border: 1px soil gray;" align="center">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/sampleRoom.jpg">
</div>

 <div class="col-md-3" style="border: 1px soil gray;">
 	<span style="font-weight: bold;">커버사진</span>
 	<a><span style="margin-left: 60%;">변경</span></a>
 	<br>
	<button type="button" class="btn"><span class="editbtn">캡션 추가하기</span></button>
</div>
	
<div class="col-md-12" style="width: 75%; margin-left: 22%; border: 1px soil gray;">
	<hr align="left">
	<h3 align="left" style="font-weight: bold;">사진정렬</h3>
	<p>사진을 끌어와 원하는 순서대로 정렬할 수 있습니다.</p>
</div>
	
	
	

