<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
hr {
	width: 70%;
}

p {
	font-size: 12pt;
}

body {
	color: #484848;
}

a {
	font-weight: bold;
	color: #008489;
	font-size: 10pt;
	cursor: pointer;
}

h4, h3 {
	font-weight: bold;
	margin-top: 2%;
}

div {
	border: 0px solid gray;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border-bottom: 1px solid #ccc;
	font-weight: bold;
	display: inline-block;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

.number {
	font-weight: bold;
	font-size: 12pt;
}

/* Change background color of buttons on hover */
.tab button:focus {
	color: #008489;
	font-weight: bold;
	display: inherit;
	text-decoration: underline;
}

.tablinks {
	border-bottom: 1px solid #008489;
}
/* Style the tab content */
.tabcontent {
	width: 70%;
}

.btn {
	font-size: 12pt;
	background-color: white;
	border: 1px solid #008489;
}

.editbtn {
	color: #008489;
	font-weight: bold;
}

.bedAndPeople {
	font-size: 12pt;
	margin-bottom: 3%;
}

.fa-angle-left:focus {
	text-decoration: underline;
}

.photodiv {
	width: 75%;
	margin-left: 22%;
}

.img-thumbnail{
	border: none;
	padding: 0;
}

.filebox {
	margin-top: 3%;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #008489;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #008489;
	border-bottom-color: #008489;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
.gohostroomEdit{
	font-size: 13pt; 
	color: #008489; 
	cursor: pointer; 
	font-weight: bold;
}

.img-largeThumbnail{
	display: inline-block;
	height: auto;
	max-width: 100%;
	line-height: 1.428571429;
	background-color: #fff;
	-webkit-transition: all .2s ease-in-out;
	transition: all .2s ease-in-out
}
.opacityDiv{
	opacity:0.2;
}
</style>
<script>

	$(document).ready(function(){
		$("#imgfile").on("change",ImgsFilesSelect);
	});
	
	// =========== 이미지 파일 올리기 =============
	var imgArr = []; // 이미지를 담을 배열 
	function ImgsFilesSelect(e) {
		imgArr = [];
		 
		//$("#imgList").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0; // id에 고유값을 주기 위한 index
		filesArr.forEach(function (f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				return;
			}
			
			imgArr.push(f);	
			
			/* var reader = new FileReader();
			reader.onload = function(e){
				var html = "<div id='imgbox"+index+"' class='col-md-2 imgbox'><img class='img-thumbnail' src='"+e.target.result	+"'/><br><a onClick='removePhoto("+index+");'>삭제하기</a></div>";
				$("#imgList").append(html);
				index++;
			}
			reader.readAsDataURL(f); */
			
		});
		submitPhoto();
	}
	
	function submitPhoto() {
	
		var form_data = new FormData($("#fileUpimg")[0]);

		$.ajax({
			url:"imgfileupload.air",
			type:"POST",
			data: form_data,
			contentType:false,
	        processData:false,
	        dataType:"JSON",
	        success:function(json){
	        	alert("파일 업로드 저장 완료.");
	        	var resultHTML = "";	
	        	$.each(json,function(entryIndex, entry){
					resultHTML += "<div class='col-md-2'>"+
								"<img class='img-thumbnail' alt='' src='resources/images/"+entry.roomImgList+"'/><a onclick='deletePhoto('"+entry.roomImgList+"');'>삭제하기</a>"+
								"</div><br>";
				});// end of each
				
	        	$("#imgs").empty().html(resultHTML);
	        	location.reload();
	        },
	        error:function(){
	            
	        }
		});
	}
	
	function deletePhoto(Img){
		
		var form_data = {"img":Img, "roomcode":"${roomvo.roomcode}"};
		
		$.ajax({
			url:"imgfiledelete.air",
			type:"POST",
			data: form_data,
	        dataType:"JSON",
	        success:function(json){
	        	alert("파일 삭제 완료.");
	        	var resultHTML = "";	
	        	$.each(json,function(entryIndex, entry){
					resultHTML += "<div class='col-md-2'>"+
								"<img class='img-thumbnail' alt='' src='resources/images/"+entry.roomImgList+"'/><a onclick='deletePhoto('"+entry.roomImgList+"');'>삭제하기</a>"+
								"</div><br>";
				});// end of each
	        	$("#imgs").empty().html(resultHTML);
	        	location.reload();
	        },
	        error:function(){
	            
	        }
		});
	}
	
	function changeCover(Img){
		
	}
	
</script>
<div class="col-md-12" style="margin-top: 1%; width: 75%; margin-left: 22%;">
	<i class="fas fa-angle-left"></i>&nbsp;<a class="gohostroomEdit"  href="javascript:history.back();">수정으로 돌아가기</a>
	<h3 align="left" style="font-weight: bold;">사진</h3>
	<p>게스트에게 숙소의 실제 모습을 보여주는 사진을 추가하세요.</p>
	<hr align="left">
</div>
<div class="col-md-4" style="margin-left: 22%;" align="center">
	<img class="img-largeThumbnail" alt="" src="${roomvo.roomMainImg }">
</div>

 <div class="col-md-3">
 	<span style="font-weight: bold;">커버사진</span>
 	<a data-toggle="modal" data-target="#myModal">
 		<span style="margin-left: 60%;">변경</span>
 	</a>
</div>

<form id="fileUpimg" name="fileUpimg" enctype="multipart/form-data">
	<input type="hidden" name="roomcode" value="${roomvo.roomcode }"/>
	<div class="col-md-12 photodiv">
		<hr align="left">
		<h3 align="left" style="font-weight: bold;">사진정렬</h3>
			<div id="imgs" class="row">
				<c:forEach var="room" items="${roomvo.roomimgList }">
					<div class="col-md-2">
						<img class='img-thumbnail' alt="" src="resources/images/${room.roomImgList}"/><a onclick="deletePhoto('${room.roomImgList}','${roomvo.roomMainImg}');">삭제하기</a>
					</div>
				</c:forEach>
			</div>
			<div id="imgfiles"  class="filebox">  
				<label for="imgfile">사진 추가하기</label> 
				<input type="file" id="imgfile" name="imgfile" accept="image/*" multiple/>	
			</div>
			<hr align="left">
	</div>
</form>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog" align="center">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">커버 사진 변경</h4>
			</div>
			<div class="modal-body" style=" width: auto;">
				<div>
					<img class="img-thumbnail" alt="" src="${roomvo.roomMainImg }">
					<hr align="center" style="width: 100%;">
					<h3 align="left" style="font-weight: bold;">사진선택</h3>
					<div id="imgs" class="row">
						<c:forEach var="room" items="${roomvo.roomimgList }">
							<div class="col-md-3" style="margin-bottom: 1%;">
								<img class='img-thumbnail' alt="" src="resources/images/${room.roomImgList}" onclick="changeCover('${roomvo.roomimgList }');"/>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>



