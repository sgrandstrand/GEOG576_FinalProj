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
    var gray = 'img/unknown.png;
    var green = 'img/green.png';
    var greentoblue = 'img/greentoblue.png';
    var greentoblack = 'img/greentoblack.png';
    var blue = 'img/blue.png';
    var bluetoblack = 'img/bluetoblack.png';
    var black = 'img/black.png';

  //   var gray = 'img\\unknown.png'
  //  var green = 'img\\green.png';
  //  var greentoblue = 'img\\greentoblue.png';
  //  var greentoblack = 'img\\greentoblack.png';
  //  var blue = 'img\\blue.png';
  //  var bluetoblack = 'img\\bluetoblack.png';
  //  var black = 'img\\black.png';

    $.each(trails, function(i, e) {
        var long = Number(e['trail_long']);
        var lat = Number(e['trail_lat']);
        var latlng = new google.maps.LatLng(lat, long);

        bounds.extend(latlng);

        // Create the infoWindow content here
        var contentStr = '<h4>Trail Details</h4><hr>';
            contentStr += '<p><b>' + 'Name' + ':</b>&nbsp' + e['trail_name'] + '</p>';
            contentStr += '<p><b>' + 'County' + ':</b>&nbsp' + e['trail_county'] + '</p>';
            contentStr += '<p><b>' + 'State' + ':</b>&nbsp' + e['trail_state'] + '</p>';
            contentStr += '<p><b>' + 'Total Mileage' + ':</b>&nbsp' + e['trail_mileage'] + '</p>';
            contentStr += '<p><b>' + 'Last Reported Condition' + ':</b>&nbsp' + e['trail_condition'] + '</p>';
            contentStr += '<p><b>' + 'Difficulty Level' + ':</b>&nbsp' + e['trail_difficulty'] + '</p>';
            contentStr += '<p><b>' + 'MORE Liason Contact Info' + ':</b>&nbsp' + e['trail_email'] + '</p>';
            contentStr += '<p><b>' + 'MORE Information Page' + ':</b>&nbsp' + e['trail_website'] + '</p>';
            contentStr += '<p><b>' + 'Coordinates' + ':</b>&nbsp' + e['trail_lat'] + ', ' + e['trail_long'] + '</p>';

        // Create the markers here
        if (e['trail_difficulty'] == null) {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: gray,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'green') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: green,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'green to blue') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: greentoblue,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'green to black') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: greentoblack,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'blue') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: blue,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'blue to black') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: bluetoblack,
                customInfo: contentStr,
            });
        }
        else if (e['trail_difficulty'] == 'black') {
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: black,
                customInfo: contentStr,
            });
        }

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