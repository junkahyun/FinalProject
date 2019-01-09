<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<div>
	<div id="header">
		<div class="row height_maxPer">
			<div id="headerlogo">
				<img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width:28px; height:31px;"/>
			</div>
			<div id="searchbarDiv">
				<div id="searchbar">
					<div id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px"></div>
					<input type="text" id="searchInput" placeholder="검색" style="">
				</div>
			</div>
			<div class="headermenus">
				<div class="headermenu" onClick="">호스트가 되어보세요</div>
				<div class="headermenu" onClick="">도움말</div>
				<div class="headermenu" onClick="">회원가입</div>
				<div id="headermenu" class="headermenu" style="cursor: pointer;" data-toggle = "modal" data-target="#userIdfind" data-dismiss = "modal">로그인</div>
			</div>
		</div>
	</div>
	
   
	
	<div class="modal fade" id="userIdfind" role="dialog">
	 <div class="modal-dialog">
	 
	  <!-- Modal content-->
	   
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="btn btn-default myclose" style="border-radius: 100%" data-dismiss="modal">X</button>
          <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="left" style="border: solid 1px silver; width: 25%;"></h4>또는<h4 class="modal-title" align="left" style="border: solid 1px silver; width: 25%;"></h4>
        </div>
        <div class="modal-body" style="height: 568px; width: 567px;">
          <div id="idFind">
          	<iframe style="border: none; width: 10%; height: 10%;" src="<%=request.getContextPath() %>/login.air">
          	</iframe>
          </div>
        </div>
        <div class="modal-footer">
         
        </div>
      </div>
      
    </div>
   </div>   
</div>
    
    
    
    
	
