<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>	


<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script> 

<div class="">
	<h1 class="">신고글쓰기</h1>
</div>

<div class="container">
	 <div class="row">
		 	<table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
		 		<thead>
					<tr>
						<th colspan="1" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>		 		
		 		</thead>

		 		<tbody>
		 			<tr>
		 				<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
		 			</tr>
		 			<tr>	
		 				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px"></textarea></td>
		 			</tr>	
		 		</tbody>
		 	</table>
			 <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
	 </div>
</div>


