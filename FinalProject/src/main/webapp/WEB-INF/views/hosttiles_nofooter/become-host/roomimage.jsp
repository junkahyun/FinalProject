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
         
         .content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}

</style>

<script type="text/javascript">
            $(document).ready(function(){
            	
            	$('.content')
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
            	            "background-color": "black",
            	            "outline-offset": "-20px"
            	        });
            	    } else {
            	        $(e.target).css({
            	            "background-color": "gray",
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

            	    
            	}


            	
            	
            	
            	
            	////////////////////////
            	
            	
                var objDragAndDrop = $(".dragAndDropDiv");
                
                // dragenter 드래그 요소가 드롭영역에 들어갈때 발생하는 이벤트
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation(); // 현재 이벤트가 상위로 전파되지 않도록 중단
                    e.preventDefault();  // 현재 이벤트의 기본 동작 중단
                    $(this).css('border', '2px dashed #0B85A1');
                });
                
                // dragover 드래그 요소가 특정영역에 있을때 발생하는 이벤트
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                
                // drop 드롭 할때 발생하는 이벤트 
                $(document).on("drop",".dragAndDropDiv",function(e){
                     
                    $(this).css('border', '2px dashed #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                 
                    handleFileUpload(files,objDragAndDrop);
                    /* if (files[0].type.match("image.*")) {
                    	alert(window.URL.createObjectURL(files[0]))
                        $("#img").css({
                            "background-image": "src(" + window.URL.createObjectURL(files[0]) + ")",
                            "outline": "none",
                            "background-size": "100% 100%"
                        });
                    } */

                    handleImgFileSelect();
                    
                });
                
             	// dragover 드래그 요소가 특정영역에 있을때 발생하는 이벤트(드롭영역에 들어갔다 나올때 css때문에 함)
                $(document).on('dragover', function (e){
	                e.stopPropagation();
	                e.preventDefault();
	                objDragAndDrop.css('border', '2px dashed #92AAB0');
				                
                });
                
                // 드래그 요소가 드롭 영역에 들거갔을때 발생하는 이벤트
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                                                
                // drop 드롭 할때 발생하는 이벤트
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();	
                    //alert("드롭함2");
                    
                });
                 
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);                    
                  
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                        
                  
                   }
                }
                 
                var rowCount=0;
                function createStatusbar(obj){
                         
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                     
                    obj.after(this.statusbar);
                  
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                  
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                     
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                     
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                 
                function sendFileToServer(formData,status)
                {
                    var uploadURL = "/fileUpload/post"; //Upload URL
                    var extraData ={}; //Extra Data.
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                  
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                  
                    status.setAbort(jqXHR);
                }
      
            });

</script>

<div>
   <div class="row" style="border: 1px solid green;">
   <div class="content"></div>

   <div class="container col-md-12" style="border: px solid red;">
	  <div class="progress" style="height: 13px;"> 
	    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
	    </div>
	  </div>
	</div> 

      <div class="col-md-6" style="margin-left: 27%; margin-top: 3%; border: 1px solid red;">
         <div class="title">게스트에게 숙소의 모습을 보여 주세요</div>
        
        <div class="row" style="border: 1px solid red;">
        	<div class="col-md-12" style="margin-bottom: 20px;">
        		 <div id="fileUpload" class="dragAndDropDiv">메인이미지</br>Drag & Drop Files Here
        		 </div>
        	</div>
        	<div class="col-md-4" style="border: 1px solid red;">
        		<img style="width: 150px; border: 1px solid black; border-radius: 5px; " src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
        	</div>
        	<div class="col-md-4" style="border: 1px solid red;">
        		<img style="width: 150px; border: 1px solid black; border-radius: 5px; " src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
        	</div>
        	<div class="col-md-4" style="border: 1px solid red;">
        		<img style="width: 150px; border: 1px solid black; border-radius: 5px; " src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
        	</div>    	
        </div>
        
         <div class="col-md-6" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 0; padding-top: 20px; padding-left: 0; padding-right: 0;" >
	         <div class="col-md-3" style="border: 0px solid red; padding: 0;">
	            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em">이전</button>
	         </div>
	         <div class="col-md-6" style="border: 0px solid red;"></div>
	         <div class="col-md-3" style="border: 0px solid red; padding-right: 0;">
	            <button type="button" style="width: 80px; height: 48px; background-color: #148487; border: none; border-radius: 3px; color: white; font-weight: bold; font-size: 1.2em; float: right;">다음</button>
	         </div>
        </div> 

      </div>

   </div>
</div>
