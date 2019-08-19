// Javascript file for loading the map content

var map;
var place;
var autocomplete;
var infowindow = new google.maps.InfoWindow();

var trail_markers = [];
var damage_markers = [];

// Function to initialize the page
function initialization() {
    showAllTrails();
    initAutocomplete();
}

// Function to show all trails
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

// Function to initialize the map
function mapInitialization(trails) {
    var mapOptions = {
        mapTypeId : google.maps.MapTypeId.TERRAIN // Set the type of Map
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
        var contentStr = '<h4>'+ e['trail_name']+'</h4><hr>';
            contentStr += '<p><b>' + 'County' + ':</b>&nbsp' + e['trail_county'] + '</p>';
            contentStr += '<p><b>' + 'State' + ':</b>&nbsp' + e['trail_state'] + '</p>';
            contentStr += '<p><b>' + 'Total Mileage' + ':</b>&nbsp' + e['trail_mileage'] + '</p>';
            contentStr += '<p><b>' + 'Last Reported Condition' + ':</b>&nbsp' + e['trail_condition'] + '</p>';
            contentStr += '<p><b>' + 'Last Condition Update' + ':</b>&nbsp' + e['trail_last_condition_update'] + '</p>';
            contentStr += '<p><b>' + 'Difficulty Level' + ':</b>&nbsp' + e['trail_difficulty'] + '</p>';
            contentStr += '<p><b>' + 'MORE Liason Contact Info' + ':</b>&nbsp' + '<a href=e["trail_website"] target="blank">' + e['trail_website'] + '</a></p>';
            contentStr += '<p><b>' + 'MORE Information Page' + ':</b>&nbsp' + '<a href=e["trail_email"] target="blank">' + e['trail_email'] + '</a></p>';
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

        trail_markers.push(marker);

        // Add a Click Listener to the marker
        google.maps.event.addListener(marker, 'click', function() {
        // use 'customInfo' to customize infoWindow
        infowindow.setContent(marker['customInfo']);
        infowindow.open(map, marker); // Open InfoWindow
        });
    });
    map.fitBounds (bounds);
}

// Function to show damage reports
function showDamageReports() {
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: { "tab_id": "3"},
        success: function(damageReports) {
            onDamageReports(damageReports);
        },
        error: function(xhr, status, error) {
            alert("An AJAX error occured: " + status + "\nError: " + error);
        }
    });
}

// Function to create visualization of damage reports
function onDamageReports(damageReports) {
    $.each(damageReports, function(i, e) {
        var long = Number(e['damage_long']);
        var lat = Number(e['damage_lat']);
        var latlng = new google.maps.LatLng(lat, long);

        // Create the infoWindow content here
        var contentStr = '<h4>Trail Damage Details</h4><hr>';
            contentStr += '<p><b>' + 'Trail' + ':</b>&nbsp' + e['damage_trail'] + '</p>';
            contentStr += '<p><b>' + 'Date' + ':</b>&nbsp' + e['damage_date'] + '</p>';
            contentStr += '<p><b>' + 'Damage' + ':</b>&nbsp' + e['damage_type'] + '</p>';
            contentStr += '<p><b>' + 'Message' + ':</b>&nbsp' + e['damage_message'] + '</p>';

        // Add the marker image variables here
        var icons = {
            url: 'img/damage.png',
            scaledSize: new google.maps.Size(20,20)
        };

        var marker = new google.maps.Marker({
            position: latlng,
            icon: icons,
            map: map,
            customInfo: contentStr
        });

        damage_markers.push(marker);

        // Add a Click Listener to the marker
        google.maps.event.addListener(marker, 'click', function() {
            // use 'customInfo' to customize infoWindow
            infowindow.setContent(marker['customInfo']);
            infowindow.open(map, marker); // Open InfoWindow
        });
    });
}

// // Function to remove the trail markers
// function removeTrailMarkers(trail_markers) {
//     for (i=0; i<trail_markers.length; i++) {
//         trail_markers[i].setMap(null);
//     }
// }
//
// // Calls the toggle switch to add or remove trails layer if checked or not
// $(document).ready(function () {
//     $('input[type="checkbox"]').click(function () {
//         if ($(this).is(":checked")) {
//             showAllTrails();
//         } else if ($(this).is(":not(:checked)")) {
//             removeTrailMarkers(trail_markers);
//         }
//     });
// });

// Function to remove the damage markers
function removeDamageMarkers(damage_markers) {
    for (i=0; i<damage_markers.length; i++) {
        damage_markers[i].setMap(null);
    }
}

// Calls the toggle switch to add or remove damages layer if checked or not
$(document).ready(function () {
    $('input[type="checkbox"]').click(function () {
        if ($(this).is(":checked")) {
            showDamageReports();
        } else if ($(this).is(":not(:checked)")) {
            removeDamageMarkers(damage_markers);
        }
    });
});

// Function to create autocomplete
function initAutocomplete() {
    // Create the autocomplete object
    autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));

    // When the user selects an address from the dropdown, show the place selected
    autocomplete.addListener('place_changed', onPlaceChanged)
}

// Function to change the location/view of the map
function onPlaceChanged() {
    var address = new google.maps.Marker({
        map: map
    });
    address.setVisible(false);
    place = autocomplete.getPlace();
    map.fitBounds(place.geometry.viewport);
    address.setPosition(place.geometry.location);
    address.setVisible(true);
}

// Execute our 'initialization' function once the page has loaded.
google.maps.event.addDomListener(window, 'load', initialization);
