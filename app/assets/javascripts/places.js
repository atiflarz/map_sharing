// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $("#place_is_public").change(function(e) {
    if ($(this).prop('checked')){
      $(".place_recipients").hide();
    }
    else{
      $(".place_recipients").show();
    }
  });

  $("#place_recipient_id").select2();
});

function  initMap2(places, id){

  if (places.length == 0){
    places = [{latitude: 22.578193, longitude: 88.428619}]
  }
  var map = new google.maps.Map(document.getElementById('map2'), {
    zoom: 4,
    center: new google.maps.LatLng(places[0].latitude, places[0].longitude),
  });
  var markers;
  for (i = 0; i < places.length; i++) {
    markers = new google.maps.Marker({
      position: new google.maps.LatLng(places[i].latitude, places[i].longitude),
      map: map,
      animation: google.maps.Animation.DROP,
      draggable: true
    });
    google.maps.event.addListener(markers, "dragend", function(){
      var lat = document.getElementById('place_latitude');
      var lng = document.getElementById('place_longitude');
      var coords = this.getPosition()
      lat.value = coords.lat();
      lng.value = coords.lng();
    });
  }
  
}
