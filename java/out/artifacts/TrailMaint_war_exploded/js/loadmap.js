// Javascript file for loading the map content

var map;
var place;
var autocomplete;
var infowindow = new google.maps.InfoWindow();

//
function initialization() {
    showAllTrails();
    initAutocomplete();
}

//
function showAllTrails() {
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: { "tab_id": "0"},
        success: function(trails) {
            mapInitialization(trails);
        },
        error: function(xhr, status, error) {
            alert("An AJAX error occured: " + status + "\nError: " + error);
        }
    });
}

//
function mapInitialization(trails) {
    var mapOptions = {
        mapTypeId : google.maps.MapTypeId.ROADMAP // Set the type of Map
    };

    // Render the map within the empty div
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var bounds = new google.maps.LatLngBounds ();

    // Add the marker image variables here --> NEED IMAGES
<<<<<<< Updated upstream
    var green = '';
    var greentoblue = '';
    var greentoblack = '';
    var blue = '';
    var bluetoblack = '';
    var black = '';

    $.each(reports, function(i, e) {
=======
    var green = 'img/green.png';
    var greentoblue = 'img/greentoblue.png';
    var greentoblack = 'img/greentoblack.png';
    var blue = 'img/blue.png';
    var bluetoblack = 'img/bluetoblack.png';
    var black = 'img/black.png';

    $.each(trails, function(i, e) {
>>>>>>> Stashed changes
        var long = Number(e['longitude']);
        var lat = Number(e['latitude']);
        var latlng = new google.maps.LatLng(lat, long);

        bounds.extend(latlng);

        // Create the infoWindow content here


        // Create the markers here


        // Add a Click Listener to the marker
        google.maps.event.addListener(marker, 'click', function() {
        // use 'customInfo' to customize infoWindow
        infowindow.setContent(marker['customInfo']);
        infowindow.open(map, marker); // Open InfoWindow
        });

    });

    map.fitBounds (bounds);

}

//
function initAutocomplete() {
    // Create the autocomplete object
    autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));

    // When the user selects an address from the dropdown, show the place selected
    autocomplete.addListener('place_changed', onPlaceChanged)
}

//
function onPlaceChanged() {
    var address = new google.maps.Marker({
        map: map,
    });
    address.setVisible(false);
    place = autocomplete.getPlace();
    map.fitBounds(place.geometry.viewport);
    address.setPosition(place.geometry.location);
    address.setVisible(true);
}

//Execute our 'initialization' function once the page has loaded.
google.maps.event.addDomListener(window, 'load', initialization);