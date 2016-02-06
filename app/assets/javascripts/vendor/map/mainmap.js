function initMap() {

  // ===== Variables =====
  var directionsService = new google.maps.DirectionsService; // Direction
  var directionsDisplay = new google.maps.DirectionsRenderer; // Direction
  var myLatLng = {lat: 14.6090537, lng: 121.02225650000003}; // Map LatLon

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: myLatLng,
    disableDefaultUI: true
  });

  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('right-panel'));

  // ===== Searching Route ======
  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };

  // ===== Calculation of Start and End point =====
  function calcRoute() {
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;

    var searchBox = new google.maps.places.SearchBox(start);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(start);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
      searchBox.setBounds(map.getBounds());
    });

  }

} // End of initMap