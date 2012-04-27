getMap = ->
  position = new google.maps.LatLng 51.766074,19.454556
  mapSettings = {
    zoom: 15,
    center: position,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false,
    mapTypeControl: false
  }
  map = new google.maps.Map ($ ".map")[0], mapSettings

  markerSettings = {
    position: position,
    map: map,
    flat: true
  }
  new google.maps.Marker markerSettings

$ -> getMap()
