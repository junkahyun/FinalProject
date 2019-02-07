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
		
		if(reportvo.commentCount > 0) {
			goViewComment("1");
		}
		
	});
	
	function goAddWrite() {
		
		var frm = document.addWriteFrm;
		var nameval = frm.name.value.trim();
		
		if(nameval == "") {	// 로그인을 안했다면
			alert("먼저 로그인 하세요!");
			return;
		}
		
		var contentval = frm.content.value.trim();
		
		if(contentval == "") {
			alert("내용을 입력해주세요!");
			frm.content.value="";
			frm.content.focus();
			return;
		}
		
		
		
	} // end of function goAddWrite()--------------------------------
	
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
	        <th>글 유형</th>
		        <c:if test="${reportvo.reporttype == 0}">
		        	<td style="text-align: left;">투숙객</td>
		        </c:if>
		        <c:if test="${reportvo.reporttype == 1}">
		        	<td style="text-align: left;">호스트</td>
		        </c:if>
		        <c:if test="${reportvo.reporttype == 2}">
		        	<td style="text-align: left;">자유 게시글</td>
		        </c:if>
	      </tr>
	      <tr>
	        <th>아이디</th>
	        <td style="text-align: left;">${reportvo.fk_userid}</td>
	      </tr>
	      <tr>
	        <th>제목</th>
	        <td style="text-align: left;">${reportvo.report_subject}</td>
	      </tr>
	      <tr>
	        <th>내용</th>
	        <td style="text-align: left;">
	        ${reportvo.report_content}
	        </td>
	      </tr>
	      <tr>
	        <th>조회수</th>
	        <td style="text-align: left;">${reportvo.viewcnt}</td>
	      </tr>
	      <tr>
	        <th>등록일</th>
	        <td style="text-align: left;">${reportvo.report_date}</td>
	      </tr>
	  </table>
	  
	  <form name="editFrm">
		  <div style="text-align: left; margin-bottom: 5%;">
			  <div style="margin-bottom: 1%;">이전글 :<a><span class="move" style="cursor: pointer;" onClick="javascript:location.href='reportDetail.air?report_idx=${reportvo.previousseq}'">${reportvo.previoustitle}</span></a></div>
			  <div style="margin-bottom: 5%;">다음글 :<a><span class="move" style="cursor: pointer;" onClick="javascript:location.href='reportDetail.air?report_idx=${reportvo.nextseq}'">${reportvo.nexttitle}</span></a></div>
		  	
		  	  <button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/board_report.air'">목록보기</button>
			  <c:if test="${sessionScope.loginuser.userid == 'admin' || sessionScope.loginuser.userid == reportvo.fk_userid}">
			  	<button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/deleteReport.air?report_idx=${report_idx}'">삭제</button>
			  </c:if>
			  <c:if test="${sessionScope.loginuser.userid == reportvo.fk_userid}">
			  	<button type="button" class="btn" onClick="javascript:location.href='<%= request.getContextPath()%>/boardEdit.air?report_idx=${report_idx}'">수정</button>
			  </c:if>
		  </div>
		  <input type="hidden" name="report_idx" value="${report_idx}"/>
	  </form>
	  
	  <!-- 댓글쓰기 폼 -->
	  <form name="addWriteFrm" style="text-align: left;">     
		      <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" readonly />
		성명 : <input type="text" name="name" value="${sessionScope.loginuser.username}" class="short" readonly/>
	       댓글내용 : <input type="text" name="content" class="long" />
	    
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) -->
	    <input type="hidden" name="parentSeq" value="${report_idx}" />  
	    
	    <button type="button" class="btn" onClick="goAddWrite();" >쓰기</button>
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
