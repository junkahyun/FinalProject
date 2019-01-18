<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

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

</style>

<form name="map">
   <div>
      <div class="row" style="border: 0px solid green;">
   
      <div class="container col-md-12" style="border: px solid red;">
        <div class="progress" style="height: 13px;"> 
          <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width:5%; background-color: #148487;">
          </div>
        </div>
      </div> 
   
         <div class="col-md-4" style="margin-left: 27%; margin-top: 3%; border: 0px solid red;">
            <div class="title">핀이 놓인 위치가 정확한가요?</div>
            <div class="row" style="padding: 0; border: 0px solid green;" >
               <div class="col-md-12" style="font-size: 16px; font-weight:bold; margin-top: 30px; border: 0px solid red;">
               숙소의 정확한 위치는 예약이 확정된 게스트만 볼 수 있습니다.
               </div>
               <div class="col-md-8" style="margin-top: 25px; margin-bottom: 10px;" >
                  ${address }
                  <INPUT type="text" id="ib" name="ib"/>
               </div>
               <div class="col-md-12" style="border: 0px solid red; ">
                  <div id="map" style="width:100%;height:400px;"></div>
               </div>
     
            </div>
         
         <div class="col-md-8" style="z-index:10; padding: 0">
            <div class="col-md-4" style="border-top: 1px solid #D8D8D8; background-color: white; position: fixed; bottom: 10px; padding-top: 20px; padding-left: 0; padding-right: 0;" >
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
   
         <div class="col-md-4" style="border: 0px solid blue;">
            <img src="<%=request.getContextPath() %>/resources/boimg/roomenrollment.PNG" />
         </div>
   
      </div>
   </div>
</form>

<script> 
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new daum.maps.LatLng(0,0), // 지도의 중심좌표33.450701, 126.570667
           level: 3 // 지도의 확대 레벨
       };  
   
   // 지도를 생성합니다    
   var map = new daum.maps.Map(mapContainer, mapOption); 
   
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new daum.maps.services.Geocoder();
   
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch('${address}', function(result, status) {
   
       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {
   
           var coords = new daum.maps.LatLng(result[0].y, result[0].x);
   
           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });
   
          /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new daum.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${address}'+'</div>'
           });
           infowindow.open(map, marker); */
   
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
           var test = map.getCenter(coords);
           var frm = document.map;
           
           console.log(test.ib);
           console.log(test.jb);
       } 
   });  
   
</script>

