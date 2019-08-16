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

        // Add the marker image variables here
        var icons = {
            null: {
                url: 'img/unknown.png',
                scaledSize: new google.maps.Size(25,25)
            },
            green: {
                url:'img/green.png',
                scaledSize: new google.maps.Size(25,25)
             },
            greentoblue: {
                url:'img/greentoblue.png',
                scaledSize: new google.maps.Size(25,25)
            },
            greentoblack: {
                url:'img/greentoblack.png',
                scaledSize: new google.maps.Size(25,25)
            },
            blue: {
                url:'img/blue.png',
                scaledSize: new google.maps.Size(25,25)
            },
            bluetoblack: {
                url:'img/bluetoblack.png',
                scaledSize: new google.maps.Size(25,25)
            },
            black: {
                url:'img/black.png',
                scaledSize: new google.maps.Size(25,25)
            }
        };

        var str = e['trail_difficulty'];
        if (str == null) {
            str = "null";
        } else
        str = str.replace(/\s/g,'');

        var marker = new google.maps.Marker({
            position: latlng,
            icon: icons[str],
            map: map,
            customInfo: contentStr
        });

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

tener(window, 'load', initialization);  // sarah - google not defined error was happening until I did this