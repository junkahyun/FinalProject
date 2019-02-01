<%@page import="com.spring.common.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   String ctxPath = request.getContextPath(); 
%>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d69349d952e3fb841042681c3ba35f75&libraries=services"></script>

<style type="text/css">
     .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
          overflow-wrap: break-word;
          font-size: 24px;
          font-weight: 800;
          line-height: 1.25em;
          color: rgb(72, 72, 72);
          padding-top: 2px;
          padding-bottom: 20px;
          margin: 0px}  
          
      .error1{background-color: #FFEAEA;}
        .error1_text{margin-top: 5px;
               color:#d93900;
               font-weight: bold;}
               
        .error2{background-color: #FFEAEA;}
        .error2_text{margin-top: 5px;
               color:#d93900;
               font-weight: bold;}

    .my_button {
        display: inline-block;
        width: 200px;
        text-align: center;
        padding: 10px;
        background-color: #fd5a61;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
    }



    #imgname {
            border: 2px dashed #92AAB0;
             width: 500px;
             height: 400px;
             color: #0B85A1;
             padding: 10px 0px 10px 10px;
             font-size:16px;
             display: table-cell;
             border-radius: 5px;

    }

</style>

 

<script type="text/javascript">

   // 파일 리스트 번호
   var fileIndex = 0;         
   var sel_files = [];

   $(document).ready(function(){
   
      $("#seconddiv").hide();
      $("#second").hide();
      $("#third").hide();
      
      //유효성검사
      $("#roomInfo").removeClass("error1");
      $(".error1_text").hide();
      $("#roomName").removeClass("error2");
      $(".error2_text").hide();
      
      //첫번째 페이지 스크립트 시작 ------------------------------------------------------------------------------------------------
      // 사진추가하기 버튼 누르면 type="file" 버튼 누르기
        $("#addfile").click(function(){
           $("#input_imgs").click();
           $("#imgname").empty();
        });
           
          // file 추가되면
        $("#input_imgs").change(function(e){
           var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            for(var i=0; i<10; i++){
               
             var html = "";
             html += "<div id='fileTr_" + fileIndex + "'>"
             html += (i+1)+". "+filesArr[i].name + " / " + filesArr[i].size + "MB "
             html += "</div>"

              $("#imgname").append(html);   
              
              // 파일 번호 증가
           fileIndex++;
            }
       });   
       //첫번째 페이지 스크립트 끝 ------------------------------------------------------------------------------------------------
      //두번째 페이지 스크립트 시작 ------------------------------------------------------------------------------------------------
       $("#roomInfo").click(function(){
           $("#roomInfo").removeClass("error1");
             $(".error1_text").hide();
       });
      //두번째 페이지 스크립트 끝 ------------------------------------------------------------------------------------------------
      
      //두번째 페이지 스크립트 시작 ------------------------------------------------------------------------------------------------
       $("#roomName").click(function(){
           $("#roomName").removeClass("error2");
             $(".error2_text").hide();
       });
      //두번째 페이지 스크립트 끝 ------------------------------------------------------------------------------------------------
      
   });// $(document).ready(function()
      
   // 버튼 함수들
   // first ---------------------------------------------------------
   function back1(){
       var frm = document.roomtitle;
      frm.action = "roomstep2.air";
      frm.method = "GET";
      frm.submit();
   }
   
   function next1(){
      
       var imgname = $("#imgname").html();
      if(imgname == ""){
         alert("사진을 추가해주세요");
         return;
      }
     
      var form = $('form')[0];
       var formData = new FormData(form);

       $.ajax({
           url:"fileListJOSN.air",
           type:"POST",
           dataType:"JSON",
           data:formData,
           processData: false,
             contentType: false,
           success:function(json) {               
              $("#firstdiv").hide();
              $("#seconddiv").show();
              $("#second").show(); 
            },
           error: function(request, status, error){
              alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
           }
        });// end of $.ajax({ ---       
 
   }
   
   // second ---------------------------------------------------------
   function back2(){
      $("#firstdiv").show();
      $("#seconddiv").hide();
   }
   
   function next2(){
      
      var roomInfo = $("#roomInfo").val();
      if(roomInfo == ""){
         $("#roomInfo").addClass("error1");
         $(".error1_text").show();
         return;
      }
      $("#second").hide();
      $("#third").show();
   }
   
   // third ---------------------------------------------------------
   function back3(){
      $("#second").show();
      $("#third").hide();
   }
   
   function next3(){
      
      var roomName = $("#roomName").val();
      if(roomName == ""){
         $("#roomName").addClass("error2");
         $(".error2_text").show();
         return;
      }
      var frm = document.roomtitle; 
      frm.action="roomstep3.air";
      frm.method="GET";
      frm.submit();
   }

</script>

<div class="row">
   <div class="col-md-1">
      <img src="<%=request.getContextPath() %>/resources/images/airLogo.png" style="padding-right:0; width: 30px; height: 30px; margin-top: 20px; margin-left: 40px;">
   </div>
   <div class="col-md-6" style="font-size: 18px; margin-top: 20px; padding-left: 0">2단계: 상세정보를 제공해 주세요</div>
</div>
<hr/>

<form name="roomtitle" enctype="multipart/form-data">
   <div>
      <div class="row" id="firstdiv">
       
         <!-- 첫번째 입력창 시작-->
       <div class="row">
       
             <!-- 진행상태바 -->
<!--           <div class="container col-md-12" style="border: 0px solid red;">
            <div class="progress" style="height: 13px;"> 
              <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
              </div>
            </div>
          </div> -->
          
             <div class="col-md-5" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">             
               <div class="title">게스트에게 숙소의 모습을 보여 주세요</div>        
             <div class="row" style="border: 0px solid red; margin-top: 20px;">
                 <div class="col-md-12" style="margin-bottom: 20px;"> 
                     <INPUT type="file" id="input_imgs" name="file" multiple="multiple" style="display: none;"/>
                     <button id="addfile" type="button" style="margin-bottom: 20px;  width: 150px; height: 50px; font-size:16px; background-color: #fd5a61; border: none; border-radius: 3px; color: white; float: top; margin-top: 10px;">사진추가하기</button>                 
                    <div id="imgname"></div>
                 </div>
              </div> 
                   
              <div class="col-md-6" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
                   <hr/>
                  <div class="col-md-3" style="padding: 0;">
                     <button type="button" onclick="back1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
                  </div>
                  <div class="col-md-6" style="border: 0px solid red;"></div>
                  <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
                     <button type="button" onclick="next1();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>                
                  </div>
               </div>
            </div> 
       </div>
       <!-- 첫번째 입력창 끝-->
       
      </div>
      
      <div class="row" id="seconddiv" style="border: 0px solid green;">
      
      <!-- 진행상태바 -->
<!--       <div class="container col-md-12" style="border: 0px solid red;">
        <div class="progress" style="height: 13px;"> 
          <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
          </div>
        </div>
      </div> -->
       
       <!-- 입력창 반복되는 div 시작 -->
       <div class="col-md-3" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
       
            <!-- 두번째 입력창 시작 -->
           <div class="row" id="second">
               <div class="col-md-8 title">숙소 설명하기</div>
               <div class="col-md-8" style="font-size: 20px; color: #747474; padding-bottom: 10px;"> 요약 </div>
               <div class="col-md-8"> 
                  <textarea id="roomInfo" class="error1" name="roomInfo" cols="45" rows="6" style="padding: 20px; border-radius: 4px; font-size: 18px; resize: none; outline: 0 solid transparent;" placeholder="이용시 주의사항, 주변정보 등을 입력하세요."></textarea>
                  <div class="error1_text">숙소 설명을 작성해야 합니다. 게스트가 숙소의 모습을 머릿속으로 그려볼 수 있도록 상세 설명을 추가해 주세요.</div>
               </div>
            
              <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
                   <hr/>
                  <div class="col-md-3" style="padding: 0;">
                     <button type="button" onclick="back2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
                  </div>
                  <div class="col-md-6" style="border: 0px solid red;"></div>
                  <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
                     <button type="button" onclick="next2();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>                
                  </div>
              </div> 
            </div> 
           <!-- 두번째 입력창 끝 -->
            
           <!-- 세번째 입력창 시작-->
           <div class="row" id="third">
                <div class="col-md-8 title">이름 지정</div>
                <div class="col-md-8"> 
                   <textarea class="error2" id="roomName" name="roomName" cols="45" rows="1" style="padding: 20px; border-radius: 4px; font-size: 18px; resize: none; outline: 0 solid transparent;" placeholder="숙소 제목"></textarea>
                   <div class="error2_text">숙소 이름이 있어야 합니다.</div>
                </div>
             
   
               <div class="col-md-4" style="background-color: white; position: fixed; bottom: 0; padding-bottom:10px; padding-top: 20px; padding-left: 0; padding-right: 130px" >
                   <hr/>
                  <div class="col-md-3" style="padding: 0;">
                     <button type="button" onclick="back3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
                  </div>
                  <div class="col-md-6" style="border: 0px solid red;"></div>
                  <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
                     <button type="button" onclick="next3();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>                
                  </div>
               </div> 
             </div>
            <!-- 세번째 입력창 끝-->

       </div> <!-- 입력창 반복되는 div 끝 -->
         
   
        <div class="col-md-4" style="border: 0px solid blue;">
            <img src="<%=request.getContextPath() %>/resources/images/boimg/roomenrollment.PNG" />
        </div> 
   
      </div>
   </div>
</form>