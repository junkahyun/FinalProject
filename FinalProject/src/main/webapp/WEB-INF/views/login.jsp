<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

#button {width:100px;
		 background-color: #fd5a61;
		 border: none;
		 color:#fff;
		 padding: 15px 0;
		 text-align: center;
		 text-decoration: none;
		 display: inline-block;
         font-size: 15px;
		 margin: 4px;
		 cursor: pointer;
}

.round-button{ 
 
    width: 60px; 
 
    height: 60px; 
 
    text-decoration: none; 
 
    display: inline-block; 
 
    outline: buttonshadow; 
 
    cursor: pointer; 
 
    border-style: none; 
 
    color: black; 
 
    background-color: white; 
 
    border-radius: 100%; 
 
    overflow: none; 
 
    text-align: center; 
    
    font-size: 14pt;
    }
</style>







<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
<button class="round-button" style="border-radius: 100% " >x</button>

<div class="container-fluid">
  
  <div class="row">
    
    
    
    <div>
    <button class="col-sm-12" style="vertical-align:middle; background-color:#fd5a61; color:#fff; text-align: center; border-radius: 10px; height: 5%">로그인</button>
  </div>
  </div>
</div>
</div>

<a style="cursor: pointer;" data-toggle = "modal" data-target="#userIdfind" data-dismiss = "modal">아이디찾기</a>

<div class="modal fade" id="userIdfind" role="dialog">
    <div class="modal-dialog">
    
    
    
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이디 찾기</h4>
        </div>
        <div class="modal-body" style="height: 300px; width: 100%;">
          <div id="idFind">
          	<iframe style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath() %>/idFind.do">
          	</iframe>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   
</body>
</html>