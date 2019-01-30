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

   .select{font-size: var(--font-form-element-font-size, 16px) ;
          line-height: var(--font-form-element-line-height, 24px) ;
          letter-spacing: var(--font-form-element-letter-spacing, normal) ;
          font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) ;
          text-transform: var(--font-form-element-text-transform, undefined) ;
          color: #484848 ;
          padding-top: var(--spacing-form-element-vertical, 10px) ;
          padding-bottom: var(--spacing-form-element-vertical, 10px) ;
          font-weight: var(--font-light-font-weight, normal) ;
          background-color: transparent ;
          border-radius: 3px;}  

   .selecthead{font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif ;
             overflow-wrap: break-word ;
             font-size: 16px ;
             font-weight: 600 ;
             line-height: 1.375em ;
             color: rgb(118, 118, 118) ;
             margin-bottom: 8px ;} 
   .dragAndDropDiv {
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
         
         
</style>

<script type="text/javascript">

			// 파일 리스트 번호
			var fileIndex = 0;
			// 파일 리스트
			var fileList = new Array();
			
            $(document).ready(function(){  
            	
            
                $(".dragAndDropDiv")
      	   	  .on("dragover", dragOver)
      	   	  .on("dragleave", dragOver)
      	   	  .on("drop", uploadFiles);
         	 
      	   function dragOver(e){
      	   	  e.stopPropagation();
      	   	  e.preventDefault();
      	   }
      	   	 
      	   function uploadFiles(e){
      	   	  e.stopPropagation();
      	   	  e.preventDefault();
      	   }
      	   	
      	   function dragOver(e) {
      	   	    e.stopPropagation();
      	   	    e.preventDefault();
      	   	    if (e.type == "dragover") {
      	   	        $(e.target).css({
      	   	        	"border": "2px dashed #0B85A1",
      	   	        	"background-color" : "#EAEAEA",
      	   	        	"outline-offset": "-20px"
      	   	        });
      	   	    } else {
      	   	        $(e.target).css({
      	   	        	"border": "2px dashed #92AAB0",
      	   	        	"background-color" : "white",
      	   	        	"outline-offset": "-10px"
      	   	        });
      	   	    }
      	    }
      	
      	   	function uploadFiles(e) {
      	   	    e.stopPropagation();
      	   	    e.preventDefault();
      	   	    dragOver(e); //1
      	   	    e.dataTransfer = e.originalEvent.dataTransfer; //2
      	   	    var files = e.target.files || e.dataTransfer.files;           	    
      	   	    
      	   	    var reader = new FileReader();
      	           reader.onload = function (e) {
      	           	for(var i=0;i<files.length;i++){
      	    	    	   console.log(e.target.result);
      	          	   }	
      	           }
      	   	    
      	   	 
      	   	    if (files.length > 1) {
      	   	        return;
      	   	    }
      	   	    
      	   	    for(var i=0; i<100; i++){
      		   	    fileList[i] = files[i]
      		   	    
      		   	    if (files[i].type.match(/image.*/)) {
      		   	        
      		   	    }else{
      		   	        alert('이미지가 아닙니다.');
      		   	        return;
      		   	    }
      	
      		   	    if (files[i].type.match(/image.*/)) {
      		   	        $(e.target).css({
      		   	            "background-image": "url(" + window.URL.createObjectURL(files[i]) + ")",
      		   	            "outline": "none",
      		   	            "background-size": "100% 100%"
      		   	        });
      		   	    }else{
      		   	      alert('이미지가 아닙니다.');
      		   	      return;
      		   	    }

   	                // 파일 배열에 넣기
   	                fileList[fileIndex] = files[i];
   	                
   	
   	                // 업로드 파일 목록 생성
   	                addFileList(files, fileIndex, files[i].name, files[i].size);
   	
   	                // 파일 번호 증가
   	                fileIndex++; 
      	   	   } 	    
      	   }
      	   	
      	   // 업로드 파일 목록 생성
      	   function addFileList(files, fIndex, fileName, fileSize){
      	   		 
      	   	  var form_data = {"fileName":fileName};   
      	   	  
/*         		  $.ajax({
      	 		 url:"dropJOSN.air",
      	 		 type:"GET",
      	 		 dataType:"JSON",
      	 		 data:form_data,
      	 		 success:function(json) { */
      	 			var html = "";
                     html += "<div id='fileTr_" + fIndex + "'>";
                     html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
                     html += "</div>"
              
                     $("#list").append(html);
      	 	/* 	 },
      	 		 error: function(request, status, error){
      	 		 	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      	 		 }
      	 	 });// end of $.ajax({ ---             		 
      	 */
      	   }
            	        	
            });// end ready --- 
            
            // 업로드 파일 삭제
            function deleteFile(fIndex){
                // 업로드 파일 테이블 목록에서 삭제
                $("#fileTr_" + fIndex).remove();
                
                var list = $("#list").html();
                if(list == ""){
	                $(".dragAndDropDiv").css({
	    	            "background-image": "url(white)",
	    	            "outline": "none",
	    	            "background-size": "100% 100%"
	    	        });
                }
            }
            
         	// dragover 드래그 요소가 특정영역에 있을때 발생하는 이벤트(드롭영역에 들어갔다 나올때)
            $(document).on('dragover', function (e){
               e.stopPropagation();
               e.preventDefault();
               $(".dragAndDropDiv").css('border', '2px dashed #92AAB0');
			                
           });
                       
           // drop 드롭영역 밖에서 드롭할 때 발생하는 이벤트
             $(document).on('drop', function (e){
               e.stopPropagation();
               e.preventDefault();	
               //alert("드롭함");
               
           }); 
    
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
        		 <div class="dragAndDropDiv">	        		
	        		 </br>Drag & Drop Files Here
	        		 <INPUT type="hidden" id="roomMainImg" name="roomMainImg"/>
	        		 <INPUT type="file" id="file" name="file" style="display:none;"/>
        		 </div>
        		 <div id="list"></div>
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
