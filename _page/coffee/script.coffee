position = new google.maps.LatLng 51.7773853, 19.4633086

mapSettings =
  zoom: 16
  center: position
  mapTypeId: google.maps.MapTypeId.ROADMAP
  streetViewControl: false
  mapTypeControl: false

map = new google.maps.Map document.querySelector('[data-map]'), mapSettings

markerSettings =
  position: position
  map: map
  flat: true

new google.maps.Marker markerSettings
