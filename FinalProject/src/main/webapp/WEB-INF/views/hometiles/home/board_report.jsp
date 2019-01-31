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
		
		goSearch("1");
		
		$("#searchWord").keydown(function(event){
			
			if(event.keyCode == 13) {	// 엔터를 했을 경우
				
				var addrSearch = $(this).val();
				goSearch("1");
				
				return false;
			}
			
		 });

	});
	
	function goSearch(currentShowPageNo) {
		
		var searchWord = $("#searchWord").val().trim();
		var searchType = $("#searchType").val().trim();
		var data_form = {"searchWord":searchWord, "searchType" : searchType, "currentShowPageNo":currentShowPageNo};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/board_reportJSON.air",
			type:"GET",
			data:data_form,
			dataType:"JSON",
			success:function(json){ 
				var html = "";
				if(json.length > 0) {
					$.each(json, function(entryIndex, entry){
						var status = "";
						
						if(entry.report_status == 1) {
							status = "<td style='text-align: center; font-weight: bold;'>해결</td>";
						}
						else if(entry.report_status == 0) {
							status = "<td style='text-align: center; font-weight: bold;'>미해결</td>";
						}
					
						
					    html += "<tr>"+
								"<td>"+entry.rno+"</td>"+
							    "<td>"+entry.fk_userid+"</td>"+
							    "<td><a href='reportDetail.air?report_idx="+entry.report_idx+"'>"+entry.report_subject+"</a></td>"+
							    "<td style='text-align: center;'>"+entry.report_date+"</td>"+
							    status+
							    "</tr>";
								   
						$("#result").html(html);
						
						makePageBar(currentShowPageNo);
						
					});
				}
				else {
					$("#result").html("<tr><td colspan='8' style='color:red;'>검색된 데이터가 없습니다.</td></tr>");
				} 
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
	function makePageBar(currentShowPageNo) {
		
		var searchWord = $("#searchWord").val().trim();
		var searchType = $("#searchType").val().trim();
		var data_form = {"searchWord":searchWord, "searchType" : searchType, "currentShowPageNo":currentShowPageNo};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/getTotalPagess.air",
			type:"GET",
			data:data_form,
			dataType:"JSON",
			success:function(json){
				
				var totalPage = json.totalPage;
				
				if(totalPage > 0) {
					// 댓글이 있는 경우
					
					var pageBarHTML = "";

					var blockSize = 10;
					// blockSize는 1개 블럭(토막)당 보여지는 페이지 번호의 갯수이다.
					
					var loop = 1;
					/*
						loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수이다.
						증가하는 용도이다
					*/
					
					var pageNo = Math.floor((currentShowPageNo - 1)/blockSize) * blockSize + 1;
					
					
					// **** [이전] 만들기 ***** //
					if( pageNo != 1 ) {
						
						pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+(pageNo-1)+"\");'>[이전]</a>&nbsp;";
						
					}
					
					//--------------------------------//
					while(! (loop > blockSize || pageNo > totalPage) ) {
						
						if(pageNo == currentShowPageNo) {
							// 현재 내가 보는 페이지와 똑같다면
							pageBarHTML += "&nbsp;<span style='color:red; font-weight: bold; text-decoration:underline;'>"+pageNo+"</span>&nbsp;";
						}
						else {
							pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+pageNo+"\");'>"+pageNo+"</a>&nbsp;";
						}
						
						loop++;
						pageNo++;
						
					}// end of while()----------------
					
					//--------------------------------//
					
					// **** [다음] 만들기 ***** //
					if( !(pageNo > totalPage) ) {
						
						pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+pageNo+"\");'>[다음]</a>&nbsp;";
						
					}
					
					//////////////////////////////
					$("#pageBar").empty().html(pageBarHTML);
					pageBarHTML = "";
				}
				else {
					// 댓글이 없는 경우(안해도 괜찮음)
					$("#pageBar").empty();
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		}); 
		
	} // end of makeCommentPageBar ---------------
	
</script>

<div>

	<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
		<h2>신고게시판</h2>
	</div> 
	
	<div class="container">	
		<form name="memberFrm" style="">
			<div id="searchbar" style="padding-top: 1%; text-align: right; border:none; box-shadow : none; width: 100%;">
				<select id="searchType" name="searchType" style="">
					<option value="rno">번호</option>
					<option value="fk_userid">아이디</option>
				</select>
		        <input type="text" id="searchWord" name="searchWord" placeholder="검색" style=""><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px; height:20px; cursor: pointer;" onClick="goSearch('1');"/></input>
		    </div>
		</form>
	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;">
				<table class="table table-hover">
					<col width="7%;"/>
					<col width="13%;"/>
					<col width="40%;"/>
					<col width="10%"/>
					<col width="10%"/>
			    	<thead>
						<tr>
					      	<th>번호</th>
					        <th>아이디</th>
					        <th>제목</th>
					        <th style="text-align: center;">날짜</th>
					        <th style="text-align: center;">처리상태</th>
						</tr>
			    	</thead>
					<tbody id="result">
						
				    </tbody>
				</table>			
			</div>
		</div>
	</div>
</div>




<div class="pageBar" id="pageBar" style="text-align: center; margin: 2%;">
	
</div>
   