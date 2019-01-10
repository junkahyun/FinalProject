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
</style>

<script>
	
</script>


<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%; margin-bottom: 5%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold;">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">숙소</h3>
	<p>게스트가 머물게 될 공간에 대해 자세히 설명해 주세요.</p>

	<p>회원님의 숙소에 가장 적합한 유형을 선택하세요.</p>
	<div class="dropdown">
	    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tutorials
	    	<span class="caret"></span>
	    </button>
    	<ul class="dropdown-menu">
      		<li><a href="#">Normal</a></li>
      		<li class="disabled"><a href="#">Disabled</a></li>
     		<li class="active"><a href="#">Active</a></li>
     		<li><a href="#">Normal</a></li>
    	</ul>
  	</div>
  	
  	<hr class="line" align="left">
  	
	<p>숙소 유형</p>
	<div class="dropdown">
	    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tutorials
	    	<span class="caret"></span>
	    </button>
    	<ul class="dropdown-menu">
      		<li><a href="#">Normal</a></li>
      		<li class="disabled"><a href="#">Disabled</a></li>
     		<li class="active"><a href="#">Active</a></li>
     		<li><a href="#">Normal</a></li>
    	</ul>
  	</div>
	<br>
	<span>숙박인원</span>
	
	<span style="margin-left: 33%;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/remove.png">
			&nbsp;<span>8</span>&nbsp;
		<img alt="" src="<%=request.getContextPath()%>/resources/images/add.png">
	</span>
	
	<hr class="line" align="left">
	
	<p>게스트만 사용하도록 만들어진 숙소인가요?</p>
	<input type="radio" id="yes" name="select"><label for="yes">예, 게스트용으로 따로 마련된 숙소입니다.</label><br/>
	<input type="radio" id="no" name="select"><label for="no">아니요, 게스트용으로 따로 마련된 숙소입니다.</label>
	<hr class="line" align="left">
	<h4>침대유형</h4>
	
	<span>침대 수</span>
	
	<span style="margin-left: 33%;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/remove.png">
			&nbsp;<span>8</span>&nbsp;
		<img alt="" src="<%=request.getContextPath()%>/resources/images/add.png">
	</span>
	<hr class="line" align="left">
	
	<span>침실 수</span>
	
	<span style="margin-left: 33%;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/remove.png">
			&nbsp;<span>8</span>&nbsp;
		<img alt="" src="<%=request.getContextPath()%>/resources/images/add.png">
	</span>
	<hr class="line" align="left">
	
	
	
	<hr class="line" align="left">
	<button type="button" class="btn"><span class="editbtn">저장하기</span></button>
	<button class="btn" style="background-color:  #008489;"><span style="color: white; font-weight: bold;">취소하기</span></button>
</div>

