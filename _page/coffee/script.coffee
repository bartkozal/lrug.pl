position = new google.maps.LatLng 51.766067, 19.454545

mapSettings = {
  zoom: 15,
  center: position,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  streetViewControl: false,
  mapTypeControl: false
}

map = new google.maps.Map document.querySelector('#map'), mapSettings

markerSettings = {
  position: position,
  map: map,
  flat: true
}
new google.maps.Marker markerSettings
