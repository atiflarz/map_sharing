function initMap(places, id) {
   if (places.length == 0){
    places = [{latitude: 22.578193, longitude: 88.428619}]
    var mapCenter = new google.maps.LatLng(22.578193, 88.428619)
  }
  var mapCenter = new google.maps.LatLng(places[0].latitude, places[0].longitude)
  var map = new google.maps.Map(document.getElementById(id), {
    zoom: 4,
    center: mapCenter,
  });
  var infowindow = new google.maps.InfoWindow();
  var marker, i;
  for (i = 0; i < places.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(places[i].latitude, places[i].longitude),
      map: map
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(places[i].latitude);
        infowindow.open(map, marker);
      }
    })(marker, i));
  }
}
