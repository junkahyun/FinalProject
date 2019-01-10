<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 

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
            <div class="headermenu" style="cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</div>
         </div>
      </div>
   </div>
</div>



<%-- ****** 아이디 찾기 Modal ****** --%>
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 568px; height: 567px;">
        
         
          <button type="button" class="btn btn-default myclose" data-dismiss="modal" style=" margin-left: 5%; margin-top: 2%; border: 0px;"><img src="<%=request.getContextPath() %>/resources/ymimg/cancel.png" alt="X"></button>
         <br/>
          <input value="이메일 주소" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 90%; height: 10%; border-radius: 10px;" />
          
          <input value="비밀번호" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 90%; height: 10%; border-radius: 10px;" />
         <br/>
          <input id="a" type="checkbox" style="margin-left: 5%; margin-top: 2%; border: 1px solid rightgray; width: 5%; height: 5%; vertical-align: middle;"  /><label style="font-size: 10pt; margin-top: 0%; vertical-align: middle; padding-top: 3%;"for="a">비밀번호 저장</label>
         
          <button type="button" class="login" style="width: 90%; height: 10%; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;  margin-left: 5%; margin-top: 2%; ">로그인</button>
       
       
    
       
       <div class="modal-footer" style="margin-top: 2%;">
          <div class="join" style="font-size: 10pt; text-align: center; onClick="" >에어비엔비 계정이 없으세요?   회원가입</div> 
        </div>
       
       
       
      </div>
      
      </div>
  </div>   