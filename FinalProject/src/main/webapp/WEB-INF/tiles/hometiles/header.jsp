
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.hoverBottomHY{
   border-bottom: 1px solid lightgray;
   margin:2%;
}
.hoverBottomHY:hover{
   border-bottom: 1px solid black;
}
.dropdown-menu{
   width:300px;
   position: absolute;
     right: 0 !important;
}
.test>div{
   border: 1px solid red;
}
</style>
<script>
   function join(){
      var frm = document.joinFrm;
      frm.action="/bnb/join.air";
      frm.submit();
   }
</script>
<div>   
   <div id="header">
      <div class="row height_maxPer">
         <div id="headerlogo">
            <img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="width:28px; height:31px;"/>
         </div>
         <div id="searchbarDiv">
            <div id="searchbar">
               <div id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px;height:20px"></div>
               <input type="text" name="birthday" id="searchInput" placeholder="검색" style="">
            </div>
         </div>
         <c:if test="${loginuser==null }">
         <div class="headermenus">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</div>
            <div class="headermenu" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</div>
         </div>
         </c:if>
         <c:if test="${loginuser!=null }">
         <div class="headermenus">
            <c:if test="${loginser.myroom==null }">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            </c:if>
            <c:if test="${loginser.myroom!=null }"> --%>
            <div class="headermenu" onClick="">숙소추가</div>
            <div class="headermenu" onClick="">호스트</div>
            </c:if>
            <div class="headermenu dropdown" onClick="">
               <div class="dropdown-toggle" data-toggle="dropdown">저장목록</div>
               <ul class="dropdown-menu dropdown-menu-right">
               <li class="hoverBottomHY" style="font-weight:bold;padding-bottom:2%;">목록<span style="float:right;">목록보기</span></li>
               <li class="hoverBottomHY">
                  <div class="row noSpace" style="padding-bottom:2%;">
                     <div class="col-md-8">
                        <div style="color:#148781">saveTitle</div>
                        <div style="color:lightgray">saveOption</div>
                     </div>
                     <div class="col-md-4 noSpace">
                        <img src="<%=request.getContextPath() %>/resources/images/homeDetail/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp" style="width:100%; height:80px;padding:0;margin:0;">
                     </div>
                  </div>
               </li>
             </ul>
            </div>
            <div class="headermenu" onClick="">메세지</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" onClick="" style="padding:0; padding-top:5.5%;">
               <div style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
                  <img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
               </div>
            </div>
         </div>
         </c:if>
      </div>
   </div>
</div>


  <%-- ****** 로그인 Modal ****** --%>
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog" style="margin-top: 10%;">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 100%; height: 400px; margin-top:5%;">
        
          <button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 3%; background-color: white;  margin-top: 10%; border: 0px;"><img src="<%=request.getContextPath() %>/resources/images/cancel.png" alt="X" style="width:24px;height:24px;"></button>

          
          <br/>
          <input value="이메일 주소" class="input-data form-control" type="email" style="font-size: 13pt; margin:0 auto; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input value="비밀번호" class="input-data form-control" type="password" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" /> 
         <br/>
          <input id="a" type="checkbox" style="cursor: pointer; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray; width: 5%; height: 5%; vertical-align: middle;"  /><label style="font-size: 10pt; margin-top: 0%; vertical-align: middle; padding-top: 3%; cursor: pointer;" for="a">비밀번호 저장</label>
          
          <br/>
          <div style=" margin-top: 2%;" >
          <a type="text" style="border: 0px solid; margin-left: 5%; margin-top: 2%; color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#pwdfind" data-dismiss = "modal">비밀 번호가 생각나지 않으세요?</a>
          </div>        
          <button type="button" class="login" style="width: 504px; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;  margin-left: 5%; margin-top: 2%;">로그인</button>

       
       <div class="modal-footer" style="margin-top: 2%;">
          <div class="join" style=" text-align: center; onClick="" >에어비엔비 계정이 없으세요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#join" data-dismiss = "modal">회원가입</a></div>  
        </div>
       
       
       
      </div>
      
      </div>
  </div>   
  
  <%-- ****** 회원가입 Modal ****** --%>
  <div class="modal fade" id="join" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 568px; height: 1050px;">
        <form name="joinFrm">
          <button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 5%; background-color: white;  margin-top: 2%; margin-bottom: 5%; border: 0px;"><img src="<%=request.getContextPath() %>/resources/ymimg/cancel.png" alt="X"></button>
        <br/>
          <span  style="text-align:center; margin-left:30%; font-weight: bold; color: #008489;" >페이스북</span><span  style="text-align:center; font-weight: bold; " >&nbsp;또는</span>&nbsp;<span  style="text-align:center;  font-weight: bold; color: #008489;" >구글</span><span  style="text-align:center; font-weight: bold; " >로 회원 가입하세요.</span>
          
          
             <div>
                <div style="border-bottom: 1px solid lightgray; margin-top: 30px;">
             </div>
             
             
          <br/>
          <input name="userid" placeholder="아이디" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray; width: 504px; height: 46px; border-radius: 10px; " />
          
          <input name="profileimg" placeholder="프로필사진" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="username" placeholder="이름" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="pwd" placeholder="비밀번호" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
         
          <input name="email" placeholder="이메일" class="input-data form-control" type="email" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="phone" placeholder="전화번호" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="post" placeholder="우편번호" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="addr" placeholder="주소" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input name="detailaddr" placeholder="상세주소" class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          <input type="radio" id="male" name="gender" value="1" style="margin-left: 5%;" /><label for="male" style="margin-left: 2%;">남자</label>
		  
		  <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
          
          
          <textarea name="introduction" placeholder="자기소개" class="input-data form-control" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" ></textarea>
          
          
         <br/>
         <span  style="border: 0px solid; font-size:13pt; margin-left: 5%; margin-top: 2%; font-weight: bold;" >생일</span>
           <br/>
           <span  style="border: 0px solid;  margin-left: 5%; margin-top: 2%; " >회원 가입을 하시려면 만 18세 이상이어야 합니다. 생일은 다른 회원에게는</span> 
           <br/>
           <span  style="border: 0px solid;  margin-left: 5%; margin-top: 2%; " >공개되지 않습니다.</span>    
         <br/>
         
  <div class="dropdown row" style="width:100%;padding:0;margin:0;" >
         
   <div class="col-md-3 calc">
       <select name="month" style="width:100%; text-align: left; margin-left: 5%; overflow:scroll; border:none; font-size: 13pt; margin-top:9%;">
         <option >월</option>
         <c:forEach var="month" begin="1" end="12">
         <option value="${month}">${month}</option>
         </c:forEach> 
        </select>
    
    </div>      
                
    <div class="col-md-3 calc" style="margin-left: 7%;">
         <select name="day" style="width:100%; text-align: left; margin-left: 5%; overflow:scroll; border:none; font-size: 13pt; margin-top:9%;">
          <option>일</option>
          <c:forEach var="day" begin="1" end="31" >
          <option value="${day}">${day}</option>
         </c:forEach>
           </select>

    </div>
    
    <div class="col-md-3 calc"  style="margin-left: 7%;">
           <c:set var="year" value="2019"></c:set>
           <select name="year" style="width:100%; text-align: left; margin-left: 5%; overflow-y:scroll; border:none; font-size: 13pt; margin-top:9%;">
          <option>년</option>
          <c:forEach var="i" begin="1900" end="${year}" step="1" >
             <option value="${year - i + 1900}">${year - i + 1900}</option>
         </c:forEach>
           </select>
 
    </div>
    
  </div>
         
          <button type="button" class="login" style="width: 504px; height: 46px; border: 1px solid rightgray; border: none; background-color: #fd5a61; color: white; border-radius: 10px;  margin-left: 5%; margin-top: 2%; " onClick="join();">가입하기</button>

       
       <div class="modal-footer" style="margin-top: 2%;">
          <div class="join" style="font-size: 13pt;  text-align: center; onClick="" >이미 에어비엔비 계정있나요? <a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인</a></div> 
        </div>
       
       
       
      </div>
      
      </div>
      </form>
  </div>
 </div> 
 
  <%-- ****** 비밀번호찾기 Modal ****** --%>
  <div class="modal fade" id="pwdfind" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 568px; height: 372px;">
       
          <button type="button" class="myclose" data-dismiss="modal" style=" margin-left: 5%; background-color: white;  margin-top: 2%; margin-bottom: 5%; border: 0px;"><img src="<%=request.getContextPath() %>/resources/ymimg/cancel.png" alt="X"></button>
        <br/>
         <span style="font-size: 15pt; font-weight: bold; margin-left: 5%; margin-bottom: 5%;">비밀번호 재설정</span>
          <br/>
             <span style="margin-top:5%; margin-left: 5%; font-size: 12pt; ">계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를</span>
             <br/>
             <span style="margin-left: 5%; font-size: 12pt; ">전송해 드립니다.</span>
             <br/>
             <br/>
             
             <span style="font-size: 11pt; font-weight: bold; margin-left: 5%; margin-bottom: 5%;">이메일 주소</span>
          <br/>
          
          <input  class="input-data form-control" type="text" style="font-size: 13pt; margin-left: 5%; margin-top: 2%; border: 1px solid rightgray;  width: 504px; height: 46px; border-radius: 10px;" />
          
          
          <div><img src="<%=request.getContextPath() %>/resources/ymimg/back.png" alt="X"><a style="color: #008489; font-weight: bold; cursor: pointer;" data-toggle = "modal" data-target="#login" data-dismiss = "modal">로그인으로 돌아가기</a></div>  
        
       
       
       
      </div>
      
      </div>
  </div>

 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.hoverBottomHY{
	border-bottom: 1px solid lightgray;
	margin:2%;
}
.hoverBottomHY:hover{
	border-bottom: 1px solid black;
}
.dropdown-menu{
	width:300px;
	position: absolute;
  	right: 0 !important;
}
</style>
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
         <c:if test="${loginuser!=null }">
         <div class="headermenus">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" onClick="">회원가입</div>
            <div class="headermenu" onClick="">로그인</div>
         </div>
         </c:if>
         <c:if test="${loginuser==null }">
         <div class="headermenus">
            <c:if test="${loginser.myroom==null }">
            <div class="headermenu" onClick="">호스트가 되어보세요</div>
            </c:if>
            <c:if test="${loginser.myroom!=null }">
            <div class="headermenu" onClick="">숙소추가</div>
            <div class="headermenu" onClick="">호스트</div>
            </c:if>
            <div class="headermenu dropdown" onClick="">
            	<div class="dropdown-toggle" data-toggle="dropdown">저장목록</div>
            	<ul class="dropdown-menu dropdown-menu-right">
			      <li class="hoverBottomHY" style="font-weight:bold;padding-bottom:2%;">목록<span style="float:right;">목록보기</span></li>
			      <li class="hoverBottomHY">
			      	<div class="row noSpace" style="padding-bottom:2%;">
				      	<div class="col-md-8">
				      		<div style="color:#148781">saveTitle</div>
				      		<div style="color:lightgray">saveOption</div>
				      	</div>
				      	<div class="col-md-4 noSpace">
				      		<img src="<%=request.getContextPath() %>/resources/images/homeDetail/68d2bca8-bf81-489a-9ba7-b6a24f91557d.webp" style="width:100%; height:80px;padding:0;margin:0;">
				      	</div>
			      	</div>
			      </li>
			    </ul>
            </div>
            <div class="headermenu" onClick="">메세지</div>
            <div class="headermenu" onClick="">도움말</div>
            <div class="headermenu" onClick="" style="padding:0; padding-top:5.5%;">
            	<div style="border: 1px solid lightgray; width:30px;height:30px;background-color:gray; border-radius:100%; padding-top:1%;overflow:hidden;padding: 0 1%;">
            		<img src="<%=request.getContextPath() %>/resources/images/user_white.png" style="width:24px;height:24px;margin-top:2px; margin-left:2px;">
            	</div>
            </div>
         </div>
         </c:if>
      </div>
   </div>
</div>
 --%>