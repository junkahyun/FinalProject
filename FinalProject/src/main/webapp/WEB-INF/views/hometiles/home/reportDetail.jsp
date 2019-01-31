<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cxtPath = request.getContextPath();
%> 

<script type="text/javascript">
	$(document).ready(function(){
		
		
		
	});
</script>


<div class="container" style="padding: 2%; border: solid 0px gray; width: 83%; float:right; text-align: right;">
  
  <div style="margin-left: 8%; margin-bottom: 3%;">
  	<h2 style="text-align: left;">신고게시판</h2>
  </div>
  
  <div class="col-md-12" style="padding: 2%; float: center; padding-left: 8%;">
	  <table class="table table-bordered" style="width: 80%; padding-left: 8%;">
	  	<col width="8%"/>
	  	<col width="50%;"/>
	  	  <tr>
	        <th>신고유형</th>
	        <td style="text-align: left;">호스트신고</td>
	      </tr>
	      <tr>
	        <th>글번호</th>
	        <td style="text-align: left;">1</td>
	      </tr>
	      <tr>
	        <th>이름</th>
	        <td style="text-align: left;">홍길동</td>
	      </tr>
	      <tr>
	        <th>제목</th>
	        <td style="text-align: left;">백승철 신고합니다.</td>
	      </tr>
	      <tr>
	        <th>내용</th>
	        <td style="text-align: left;">
	        <textarea rows="8" cols="40" style="width:100%; border:none;" readonly ><p><img src="/bnb/resources/photo_upload/20190130110606179769607476562.jpg" title="20190130110606179769607476562.jpg"><br style="clear:both;">마우스가 무섭게 생겼어요</p></textarea>
	        </td>
	      </tr>
	      <tr>
	        <th>조회수</th>
	        <td style="text-align: left;">3</td>
	      </tr>
	      <tr>
	        <th>날짜</th>
	        <td style="text-align: left;">2018-12-31 11:42:11</td>
	      </tr>
	  </table>
	  
	  <div style="text-align: left; margin-bottom: 5%;">
		  <div style="margin-bottom: 1%;">이전글 :<span class="move" onClick="javascript:location.href='view.action?seq=${boardvo.previousseq}'">누구세요?</span></div>
		  <div style="margin-bottom: 5%;">다음글 :<span class="move" onClick="javascript:location.href='view.action?seq=${boardvo.nextseq}'">재밌어요!</span></div>
	  	
	  	  <button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/board_report.air'">목록보기</button>
		  <button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/edit.action?seq=${boardvo.seq}'">수정</button>
		  <button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/del.action?seq=${boardvo.seq}'">삭제</button>
	  </div>
	  
	  
	  <form name="addWriteFrm" style="text-align: left;">     
		      <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" readonly />
		성명 : <input type="text" name="name" value="${sessionScope.loginuser.username}" class="short" readonly/>
	       댓글내용 : <input type="text" name="content" class="long" />
	    
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->
	    <input type="hidden" name="parentSeq" value="${boardvo.seq}" />  
	    
	    <button type="button" onClick="goAddWrite();" >쓰기</button>    
	  </form>
	  
    </div>
    
    <table  class="table table-bordered" id="table2" style="width: 80%; margin-top: 2%; margin-bottom: 3%; margin-left: 8%;">
		<thead>
			<tr>
				<th style="width: 18%; text-align: center;">댓글작성자</th>
				<th style="width: 67%; text-align: center;">내용</th>
				<th style="text-align: center;">작성일</th>
			</tr>
		</thead>
		<tbody id="commentDisplay">
		</tbody>
	</table>

	<div id="pageBar" style="height: 50px; margin-left: 30%;"></div>
</div>
