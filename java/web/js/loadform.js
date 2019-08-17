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
        success: function(reports) {
            mapInitialization(reports);
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

// Form function for updating conditions --> IN WORK
function updateConditions(event) {
    event.preventDefault(); // stop form from submitting normally

<<<<<<< Updated upstream
    var a = $("#update_conditions_form").serializeArray();
    a.push({ name: "tab_id", value: "1" });
    a = a.filter(function(item){return item.value != '';});
    console.log(a);
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(reports) {
            //Alert the user that everything worked
            alert("The report is successfully submitted!");

            // Reset the form
            $("#create_report_form")[0].reset();

            mapInitialization(reports);
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

// Form function for submitting damage report --> IN WORK
function submitDamageReport(event) {
    event.preventDefault(); // stop from from submitting normally

    var a = $("#submit_damage_report_form").serializeArray();

    // Set the lat/long to the place selected --> use place.geometry.location.lng() and place.geometry.location.lat()
    lat = place.geometry.location.lat();
    long = place.geometry.location.lng();
=======
// Form function for submitting damage report --> IN WORK
function submitDamageReport(event) {
    event.preventDefault(); // stop from from submitting normally

    var a = $('#submit_damage_report_form').serializeArray();

    // Set the lat/long to the place selected --> use place.geometry.location.lng() and place.geometry.location.lat()
    lat = place.geometry.location.lat();
    long = place.geometry.location.lng();

    a.push({ name: "latitude", value: lat});
    a.push({ name: "longitude", value: long});

    a.push({ name: "tab_id", value: "2" });
    a = a.filter(function(item){return item.value != '';});
    console.log(a);
>>>>>>> Stashed changes

    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function() {
            //Alert the user that everything worked
            alert("The report is successfully submitted!");

            // Reset the form
            $("#submit_damage_report_form")[0].reset();

            // Reload the map with all markers including the new one
            showDamageReports();
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}


<<<<<<< Updated upstream
//
// // Form function for querying the trails --> IN WORK
// function queryTrails(event) {
//     event.preventDefault(); // stop form from submitting normally
//
//     var a = $("#query_trails_form").serializeArray();
//     a.push({ name: "tab_id", value: "0" });
//     a = a.filter(function(item){return item.value != '';});
//     console.log(a);
//     $.ajax({
//         url: 'HttpServlet',
//         type: 'POST',
//         data: a,
//         success: function(trails) {
//             mapInitialization(trails);
//         },
//         error: function(xhr, status, error) {
//             alert("Status: " + status + "\nError: " + error);
//         }
//     });
// }
//
// // Form function for updating conditions --> IN WORK
// function updateConditions(event) {
//     event.preventDefault(); // stop form from submitting normally
//
//     var a = $("#update_conditions_form").serializeArray();
//     a.push({ name: "tab_id", value: "1" });
//     a = a.filter(function(item){return item.value != '';});
//     console.log(a);
//     $.ajax({
//         url: 'HttpServlet',
//         type: 'POST',
//         data: a,
//         success: function(reports) {
//             //Alert the user that everything worked
//             alert("The report is successfully submitted!");
//
//             // Reset the form
//             $("#create_report_form")[0].reset();
//
//             mapInitialization(reports);
//         },
//         error: function(xhr, status, error) {
//             alert("Status: " + status + "\nError: " + error);
//         }
//     });
// }
//
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
//
// //
// $("#query_trails_form").on("submit",queryTrails());
// $("#update_conditions_form").on("submit",updateConditions());
// $("#submit_damage_report_form").on("submit",submitDamageReport());
=======
$("#query_trails_form").on("submit",queryTrails);
// $("#update_conditions_form").on("submit",updateConditions);
$("#submit_damage_report_form").on("submit",submitDamageReport);
>>>>>>> Stashed changes
