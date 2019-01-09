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
        <div>
        <button class="round-button" type="button" style="border-radius: 100%" data-dismiss="modal">X</button>
          </div>
        <div style="border-bottom: 1px solid lightgray;height:10px;float:left;width:40%;"></div><span style="height:20px;width:10%;padding:0;margin-left:5%;float:left;">또는</span><div style="border-bottom: 1px solid lightgray;height:10px;float:left;width:45%;"></div>
          
        <div>  
          <button class="col-sm-12" style="vertical-align:middle; background-color:#fd5a61; color:#fff; text-align: center; border-radius: 10px; height: 100%">로그인</button>
        </div>
        
        
          
        
        <div class="modal-body" style="height: 568px; width: 567px;">
          
          	<iframe style="border: none; " src="<%=request.getContextPath() %>/login.air">
          	 
          	</iframe>
         
        </div>
       
      </div>
      
    </div>
   </div>   
</div>
    
    
    
    
	
