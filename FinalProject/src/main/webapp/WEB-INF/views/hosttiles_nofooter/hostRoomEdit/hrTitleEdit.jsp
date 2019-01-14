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
	<h3 align="left" style="font-weight: bold;">제목과 설명</h3>
	<p>게스트가 회원님의 숙소에 대해 쉽게 파악할 수 있도록 제목과 설명을 추가하세요.</p>
	<h4>한국어</h4>
	<p>제목</p>
	<p>숙소 이름을 한국어로 입력하세요.</p>
	<input type="text" class="form-control" id="title" name="title" style="width: 45%;">
	
	<p>요약</p>
	<p>회원님의 언어 능력을 활용해 숙소에 대해 한국어로 설명해주세요.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	<hr class="line" align="left">
	
	<p>숙소 설명</p>
	<p>숙소의 특징을 한국어로 자세히 설명하세요.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	
	<p>사용가능 공간/시설</p>
	<p>게스트에게 사용할 수 있는 숙소 공간에 대해 알려주세요.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	
	<p>기타 사항</p>
	<p>게스트에게 숙박 중 고려해야 할 기타 세부정보를 알려주세요.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	<hr class="line" align="left">
	<h4>지역정보</h4>
	
	<p>소개</p>
	<p>숙소가 위치한 지역의 특생을 한국어로 게스트에게 알리세요.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	
	<p>교통편</p>
	<p>게스트에게 숙소가 대중교통과 가까운지 알려줄 수 있습니다.</p>
	<p> 또한 주위의 주자공간에 대해서도 알려줄 수 있습니다.</p>
	<textarea class="form-control" rows="6" style="width: 45%;"></textarea>
	
	<hr class="line" align="left">
	
	<button type="button" class="btn"><span class="editbtn">저장하기</span></button>
	<button class="btn" style="background-color:  #008489;"><span style="color: white; font-weight: bold;">취소하기</span></button>
</div>

