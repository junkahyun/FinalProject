<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFYNXcquyqgeSQBM3mt-n33nh7QgxooR0&libraries=places&callback=initAutocomplete" async defer></script>
  
<script>

$(document).ready(function(){
	
	$("#address1").click(function() {
	    new daum.Postcode({
	         oncomplete: function(data) {
	        	 $("#address1").val(data.address);
	             $("#postnum").val(data.zonecode);
	             
	             $("#autocomplete").val(data.address);
        
	         }
	     }).open();
	   
	 });
 
}); 

/////////////////////////////////////////////////////

	var placeSearch, autocomplete;
	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}
	function fillInAddress() {
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();
	    document.getElementById("lat").value=place.geometry.location.lat();
	    document.getElementById("lng").value=place.geometry.location.lng();
	}

</script>


<input type="text" id="address1"/>
<input type="text" id="postnum"/>


<!-- ////////////////////////////////////////////////////////////////// -->

<div id="locationField">
  <input id="autocomplete" placeholder="Enter your address" type="text">
</div>
 
 
<input id="lat" />
<input class="field" id="lng" />
