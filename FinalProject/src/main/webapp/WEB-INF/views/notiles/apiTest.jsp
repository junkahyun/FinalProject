<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="locationField">
  <input id="autocomplete" placeholder="Enter your address" type="text"> 
</div>
 
<input class="field" id="lat" />
<input class="field" id="lng" />
<!-- Replace the value of the key parameter with your own API key. -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFYNXcquyqgeSQBM3mt-n33nh7QgxooR0&libraries=places&callback=initAutocomplete" async defer></script>
<script>
var placeSearch, autocomplete;
function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete = new google.maps.places.Autocomplete(
                                      (document.getElementById('autocomplete')),{types: ['geocode']});
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