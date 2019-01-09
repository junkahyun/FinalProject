<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<style>

.fa-angle-left:focus{text-decoration: underline;
}

h3{font-weight: bold; margin-top: 5%; margin-bottom: 3%;
}
.btn{background-color: #008489; color: white; 
}

</style>

<script>

	$(document).ready(function(){
		
		
		$(".btn").click(function(){
			
			alert("베타 테스트 중입니다!");
			
		});
		
	});
	

</script>


<div class="col-md-12" style="margin-top: 5%; width: 75%; margin-left: 22%;">
   <i class="fas fa-angle-left"></i>&nbsp;<a style="font-size: 13pt; color: #008489; cursor: pointer; font-weight: bold; ">뒤로</a>

	<h3 >기본 요금</h3>
	<span style="font-size: 12pt; font-weight: bold;">스마트 요금&nbsp;&nbsp;</span><button type="button" class="btn">베타테스트중</button><br><br>
	<span style="font-size: 12pt;">수요에 따라 요금이 자동으로 조정됩니다. 요금은 회원님이 설정하신 범위 안에서 책정되며, 언제든 변경하실 수 있습니다.</span>
	<hr width="75%;" align="left" style="margin-top: 2%;">	
	
	<span style="font-size: 12pt; font-weight: bold; margin-top: 2%;">기본 요금&nbsp;&nbsp;</span>
	<div align="left" style="border: 1px solid gray;">
	  <div class="panel panel-default">
	    <div class="panel-body">A Basic Panel</div>
	  </div>
	</div>
	
	<div class="drag-and-drop__container list-unstyled photo-list__container">
	<div class="col-sm-12 space-top-5 col-lg-4 col-md-6 photos-item__preview-card " draggable="true">
	<div class="photos-list__item" role="tabpanel" tabindex="0" style="">
	<div class="panel-image" data-confirm="false">
	<img class="hide" alt="" src="https://a0.muscache.com/im/pictures/05378a91-32a8-4d45-8b01-a6957973e658.jpg?aki_policy=xx_large"><div class="photo-preview__btns" role="button" tabindex="0"></div>
	<div class="media-photo media-photo-block photos-list__canvas" style="height: 212.667px;">
	<div class="media-cover text-center img-with-border">
	<img alt="" class="img-responsive-height img-preview-31077617_653361103" data-index="1" src="https://a0.muscache.com/im/pictures/05378a91-32a8-4d45-8b01-a6957973e658.jpg?aki_policy=x_medium"></div></div></div>
	<div style="margin-top: 8px;"><div class="_12kw8n71">
	<button type="button" class="_1k01n3v1" aria-busy="false">캡션 추가하기</button></div></div></div></div>
	<div class="col-sm-12 space-top-5 col-lg-4 col-md-6 photos-item__preview-card " draggable="true">
	<div class="photos-list__item" style="" role="tabpanel" tabindex="0">
	<div class="panel-image" data-confirm="false">
	<img class="hide" alt="" src="https://a0.muscache.com/im/pictures/b9246f22-18a1-4d33-8918-d7a034aa6609.jpg?aki_policy=xx_large"><div class="photo-preview__btns" role="button" tabindex="0"></div>
	<div class="media-photo media-photo-block photos-list__canvas" style="height: 212.667px;">
	<div class="media-cover text-center img-with-border">
	<img alt="" class="img-responsive-height img-preview-31077617_653361137" data-index="2" src="https://a0.muscache.com/im/pictures/b9246f22-18a1-4d33-8918-d7a034aa6609.jpg?aki_policy=x_medium"></div></div></div>
	<div style="margin-top: 8px;">
	<div class="_12kw8n71">
	<button type="button" class="_1k01n3v1" aria-busy="false">캡션 추가하기</button></div></div></div></div>
	<div class="col-lg-4 col-md-6 col-sm-12 space-top-5"><form>
	<input type="file" class="input-file" id="photo-image" name="image" accept="image/jpg, image/jpeg, image/png, image/gif" multiple="" velouteid="lys_photo_uploader" tabindex="-1">
	<label class="col label--no-margin-padding" for="photo-image" tabindex="0" role="group">
	<div aria-label="추가하기" class="panel photos-list__add-photo photos__empty-drag-highlight" style="height: 212.667px;">
	<div class="va-container va-container-v va-container-h">
	<div class="va-middle text-center">
	<div class="img__icon-plus-grey img-center"></div>
	<div class="text-gray space-top-2">추가하기</div></div></div></div></label>
	</form></div></div>

<hr style="border: 0.5px solid gray; width: 75%;" align="left">
<div class="row">
	<div class="col-md-1" style="width: 5%;"><img src="<%=request.getContextPath() %>/resources/images/에어비앤비 푸터아이콘.JPG" /></div>
<div class="col-md-2" style="margin-top:0.5%; "><span >© Airbnb, Inc.</span></div>
</div>

</div>