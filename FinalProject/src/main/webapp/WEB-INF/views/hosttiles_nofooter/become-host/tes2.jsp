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
       


</style>

<script type="text/javascript">
            $(document).ready(function(){  
                for (var i = 0; i < 10; i++){
	        	    $("#roomMainImg").val(i);
    	    	} 
            });

                      
           
            function next() {
            	var frm = document.image; 
        		frm.action="tes2.air";
        		frm.method="POST";
        		frm.submit();
			}

</script>




<form name="image" enctype="multipart/form-data">
<INPUT type="hidden" id="roomMainImg" name="roomMainImg[]"/>
</form>
