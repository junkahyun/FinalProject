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
	   
      <div class="modal-content" style="height: 567px; width: 568px;">
        <div>
        <button class="round-button" type="button" style="border-radius: 100%" data-dismiss="modal">X</button>
          </div>
        <div style="border-bottom: 1px solid lightgray;height:10px;float:left;width:38%; margin-left:7%;"></div><span style="height:20px;width:10%;padding:0;margin-left:5%;float:left;">또는</span><div style="border-bottom: 1px solid lightgray;height:10px;float:left;width:35%; margin-right:5%;"></div>
          
          	<br/>
          <input type="text" style="border: 1px solid lightgray; margin-top: 2%; margin-left:6%; border-radius: 5px; height:40px; width:90%;" value="이메일 주소"/>
          <br/>
          <input type="text" style="border: 1px solid lightgray; style="background-image:url('/FinalProject/src/main/webapp/resources/ymimg/message.png'); background-position:0px 0px;"  margin-top: 2%; margin-left:6%; border-radius: 5px; height:40px; width:90%;" value="비밀번호"/>
          <img src="">
          
          
          <button class="col-sm-11" style="vertical-align:middle; background-color:#fd5a61; color:#fff; text-align: center; border-radius: 10px; height:50px; margin-left:5%; margin-top: 2%;">로그인</button>
        
        
          
        
        <div class="modal-body" >
          
          	
         
        </div>
       
      </div>
      
    </div>
   </div>   
</div>
    
    
    
    
	
