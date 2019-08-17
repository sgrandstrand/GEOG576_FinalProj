// Javascript file for loading the form content

// Form function for querying the trails --> IN WORK
function queryTrails(event) {
     event.preventDefault(); // stop form from submitting normally

    var a = $("#query_trails_form").serializeArray();
    a.push({ name: "tab_id", value: "0" });
    a = a.filter(function(item){return item.value != '';});
    console.log(a);
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(trails) {
            // Reload the map
            mapInitialization(trails);

            // Reset the form
           // $("#query_trails_form")[0].reset();
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}


// Form function for updating conditions
function updateConditions(event) {
    event.preventDefault(); // stop form from submitting normally

    var a = $("#update_conditions_form").serializeArray();
    a.push({ name: "tab_id", value: "1" });
    a = a.filter(function(item){return item.value != '';});
    console.log(a);
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(trails) {
            //Alert the user that everything worked
            alert("The conditions report is successfully submitted!  Thanks for your help!");

            // Reset the form
            $("#update_conditions_form")[0].reset();

            //Reset the map with the updated status
            showAllTrails();
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}


// // Form function for submitting damage report --> IN WORK
// function submitDamageReport(event) {
//     event.preventDefault(); // stop from from submitting normally
//
//     var a = $("#submit_damage_report_form").serializeArray();
//
//     // Set the lat/long to the place selected --> use place.geometry.location.lng() and place.geometry.location.lat()
//     lat = place.geometry.location.lat();
//     long = place.geometry.location.lng();
//
//     a.push({ name: "latitude", value: lat});
//     a.push({ name: "longitude", value: long});
//
//     a.push({ name: "tab_id", value: "2" });
//     a = a.filter(function(item){return item.value != '';});
//     console.log(a);
//
//     $.ajax({
//         url: 'HttpServlet',
//         type: 'POST',
//         data: a,
//         success: function() {
//             //Alert the user that everything worked
//             alert("The report is successfully submitted!");
//
//             // Reset the form
//             $("#submit_damage_report_form")[0].reset();
//
//             // Reload the map with all markers including the new one
//             showDamageReports();
//         },
//         error: function(xhr, status, error) {
//             alert("Status: " + status + "\nError: " + error);
//         }
//     });
// }
//
// // Function for showing the damage reports
// function showDamageReports(event) {
//     event.preventDefault(); // stop from from submitting normally
//
//     var a = $("#show_damage_reports").serializeArray();
//
//     // Set the lat/long to the place selected --> use place.geometry.location.lng() and place.geometry.location.lat()
//     lat = place.geometry.location.lat();
//     long = place.geometry.location.lng();
//
//     a.push({ name: "latitude", value: lat});
//     a.push({ name: "longitude", value: long});
//
//     a.push({ name: "tab_id", value: "2" });
//     a = a.filter(function(item){return item.value != '';});
//     console.log(a);
//     $.ajax({
//         url: 'HttpServlet',
//         type: 'POST',
//         data: a,
//         success: function() {
//             //Alert the user that everything worked
//             alert("The report is successfully submitted!");
//
//             // Reset the form
//             $("#submit_damage_report_form")[0].reset();
//
//             // Reload the map with all markers including the new one
//             showAllTrails();
//         },
//         error: function(xhr, status, error) {
//             alert("Status: " + status + "\nError: " + error);
//         }
//     });
// }

$("#query_trails_form").on("submit",queryTrails);
$("#update_conditions_form").on("submit",updateConditions);
// $("#submit_damage_report_form").on("submit",submitDamageReport);
// $("#show_damage_reports").on(onclick, toggle-switch)
