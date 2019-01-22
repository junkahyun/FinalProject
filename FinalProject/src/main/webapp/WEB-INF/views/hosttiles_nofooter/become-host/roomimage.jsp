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
         .progressBar {
             width: 200px;
             height: 22px;
             border: 1px solid #ddd;
             border-radius: 5px; 
             overflow: hidden;
             display:inline-block;
             margin:0px 10px 5px 5px;
             vertical-align:top;
         }
           
         .progressBar div {
             height: 100%;
             color: #fff;
             text-align: right;
             line-height: 22px; /* same as #progressBar height if we want text middle aligned */
             width: 0;
             background-color: #0ba1b5; border-radius: 3px; 
         }
         .statusbar{
             border-top:1px solid #A9CCD1;
             min-height:25px;
             width:99%;
             padding:10px 10px 0px 10px;
             vertical-align:top;
         }
         .statusbar:nth-child(odd){
             background:#EBEFF0;
         }
         .filename{
             display:inline-block;
             vertical-align:top;
             width:250px;
         }
         .filesize{
             display:inline-block;
             vertical-align:top;
             color:#30693D;
             width:100px;
             margin-left:10px;
             margin-right:5px;
         }
         .abort{
             background-color:#A8352F;
             -moz-border-radius:4px;
             -webkit-border-radius:4px;
             border-radius:4px;display:inline-block;
             color:#fff;
             font-family:arial;font-size:13px;font-weight:normal;
             padding:4px 15px;
             cursor:pointer;
             vertical-align:top
         }
         
}

</style>

<script type="text/javascript">
            $(document).ready(function(){
            	
            	$('.dragAndDropDiv')
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
            	 
            	    if (files.length > 1) {
            	        alert('하나만 올려라.');
            	        return;
            	    }
            	    
            	    if (files[0].type.match(/image.*/)) {
            	        
            	    }else{
            	        alert('이미지가 아닙니다.');
            	        return;
            	    }

            	    
            	    if (files[0].type.match(/image.*/)) {
            	        $(e.target).css({
            	            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
            	            "outline": "none",
            	            "background-size": "100% 100%"
            	        });
            	    }else{
            	      alert('이미지가 아닙니다.');
            	      return;
            	    }
            	    
            	    $("#imgorgFilename").val(files[0].name);
            	    $("#imgfileSize").val(files[0].size);
            	    $("#attach").val(files);
            	}
            	
            	
            });
            
         	// dragover 드래그 요소가 특정영역에 있을때 발생하는 이벤트(드롭영역에 들어갔다 나올때)
            $(document).on('dragover', function (e){
               e.stopPropagation();
               e.preventDefault();
               objDragAndDrop.css('border', '2px dashed #92AAB0');
			                
           });
                       
           // drop 드롭영역 밖에서 드롭할 때 발생하는 이벤트
             $(document).on('drop', function (e){
               e.stopPropagation();
               e.preventDefault();	
               //alert("드롭함");
               
           }); 
           
           function imageadd() { 
        	   alert("이미지 클릭함");
        	   attach();
			}
           
           function attach() {
				alert("불러짐");
			}
           

            
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
        		<!--  <div id="fileUpload" class="dragAndDropDiv">이미지 로드</br>Drag & Drop Files Here
        		 </div> -->
        		 <div class="dragAndDropDiv">
        		 <button type="button" onclick="imageadd();" style="width: 180px; height: 48px; background-color: #fd5a61; border: none; border-radius: 3px; color: white; align-items: center;">사진업로드</button>
        		 </br>Drag & Drop Files Here
        		 <INPUT type="hidden" id="imgorgFilename" name="imgorgFilename"/> 
        		 <INPUT type="hidden" id="imgfileSize" name="imgfileSize"/> 
        		 <INPUT type="file" onclick="attach" id="attach" name="attach" style="display:none;"/>
        		 </div>
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
