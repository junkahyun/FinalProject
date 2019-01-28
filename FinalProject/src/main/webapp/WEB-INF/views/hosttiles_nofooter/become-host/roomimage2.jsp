<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css"> 

   .title{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif;
          overflow-wrap: break-word;
          font-size: 24px;
          font-weight: 800;
          line-height: 1.25em;
          color: rgb(72, 72, 72);
          padding-top: 2px;
          padding-bottom: 2px;
          margin: 0px}        

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



    .imgs_wrap {
 			 border: 2px dashed #92AAB0;
             width: 1000px;
             height: 400px;
             color: #92AAB0;
             text-align: center;
             vertical-align: middle;
             padding: 10px 0px 10px 10px;
             font-size:200%;
             display: table-cell;
             border-radius: 5px;

    }
    .imgs_wrap img {
        max-width: 150px;
        margin-left: 10px;
        margin-right: 10px;
    }

         
         
</style>

<script type="text/javascript">

			// 파일 리스트 번호
			var fileIndex = 0;			
			var sel_files = [];
			
            $(document).ready(function(){  
            	
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
                     html += "<div id='fileTr_" + fileIndex + "'>";
                     html +=         filesArr[i].name + " / " + filesArr[i].size + "MB "  + "<a href='#' onclick='deleteFile(" + fileIndex + "); return false;' class='btn small bg_02'>삭제</a>"
                     html += "</div>"

                   	$("#imgname").append(html);   
                   	
                   	// 파일 번호 증가
      	            fileIndex++;
              	   }
                });	
            	
            	
           });// end of ready()	
            	
            
           function next() {  
             	var frm = document.image; 
        		frm.action="roomstep3.air";
        		frm.method="POST";
        		frm.submit();
		   }

</script>




<form name="image" enctype="multipart/form-data">
<div>
   <div class="row" style="border: 0px solid green;">

   <div class="container col-md-12" style="border: 0px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
	    </div>
	  </div>
	</div> 

      <div class="col-md-6" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
         <div class="title">게스트에게 숙소의 모습을 보여 주세요</div>
        
        <div class="row" style="border: 0px solid red; margin-top: 20px;">
        	<div class="col-md-12" style="margin-bottom: 20px;"> 
        	 	<div class="imgs_wrap">       		
	        		 <IMG id="img"/>
	        		 <INPUT type="file" id="input_imgs" name="file" multiple="multiple" style="display: none;"/>
        		 </div>
        		 <button id="addfile" type="button" style="width: 150px; height: 50px; font-size:16px; background-color: #fd5a61; border: none; border-radius: 3px; color: white; float: top;">사진추가하기</button>	        		
        		<div id="imgname"></div>
        	</div>
        </div>
        
         <div class="col-md-6" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
	         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
	            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
	         </div>
	         <div class="col-md-6" style="border: 0px solid red;"></div>
	         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
	            <button type="button" onclick="next();" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
	         </div>
        </div> 

      </div>

   </div>
</div>
</form>
