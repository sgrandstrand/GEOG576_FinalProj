<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>MORE Trails Portal</title>

		<!-- Custom styles -->
		<link rel="stylesheet" href="css/style.css">
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
          integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
          crossorigin="anonymous">
    </script>
    <!-- jQuery Migrate -->
    <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"
         integrity="sha256-ycJeXbll9m7dHKeaPbXBkZH8BuP99SmPm/8q5O+SbBc="
         crossorigin="anonymous">
     </script>
   <!-- Popper -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>    
		
    <!-- Bootstrap -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

		<!-- Google Map js libraries -->
<<<<<<< Updated upstream
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=YOURKEYHERE8&libraries=places"></script>

		<!-- Google Map js libraries -->
<!--        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=YOURKEYHERE&libraries=places"></script>  -->
=======
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsknU0BjvUqyd4Y78SK7WWrtKlJICo268&libraries=places"></script>
>>>>>>> Stashed changes

	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<a class="navbar-brand">MORE Trails Portal</a>
		</nav>

		<div class="container-fluid">
			<div class="row">

				<div class="sidebar col-xs-3">
					<!-- Tab Nav -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#query_trails" data-toggle="tab">Find Trails to Ride</a></li>
						<li><a href="#update_conditions" data-toggle="tab">Update Trail Conditions</a></li>
						<li><a href="#submit_damage_report" data-toggle="tab">Submit Damage Report</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<!-- Query Trails Tab Panel -->
						<div class="tab-pane active" id="query_trails">
							<form id = "query_trails_form">
<<<<<<< Updated upstream
								<!--Want to add autocomplete on state, county and trail based on input, should be able to do this by corresponding with HTTPServlet -->
								<!-- Do we want to make it so users can select multiple ones? -->
								<div><label>State:&nbsp</label>
									<select name="stateID" >
										<option>Choose State</option>
=======
								<!--Want to add autocomplete on state, county and trail based on input, should be
								able to do this by corresponding with HTTPServlet -->
								<!-- "onselectreport" function from labs may be the way to autopopulate/dynamically choose. if have time. -->
<%--								<div><label>Trail:</label>--%>
<%--									<select name="name">--%>
<%--										<option value="">Choose Trail</option>--%>
<%--									</select>--%>
<%--								</div>--%>
								<div><label>Find Trails to Ride</label></div>
								<br>
								<div><label>State:</label>
									<select name="state">
>>>>>>> Stashed changes
										<option value="">Choose State</option>
										<option value="District of Columbia">11</option>
										<option value="Virginia">51</option>
										<option value="Maryland">24</option>
									</select>
								</div>
								<div><label>County:&nbsp</label>
									<select name="countyID">
										<option>Choose County</option>
										<option value="District of Columbia">11001</option>
										<option value="Fairfax">51029</option>
										<option value="Prince William">51076</option>
										<option value="Loudoun">51053</option>
										<option value="Shenandoah">51085</option>
										<option value="Anne Arundel">24003</option>
										<option value="Baltimore">24005</option>
										<option value="Howard">24027</option>
										<option value="Montgomery">24031</option>
										<option value="Prince George's">24033</option>
										<option value="Frederick">24021</option>
										<option value="Carroll">24013</option>
										<option value="Washington">24043</option>
										<option value="Baltimore City">24510</option>
										<option value="Queen Anne's">24035</option>
									</select>
								</div>
								<div><label>Trail:&nbsp</label>
									<select name="name" >
									<option>Choose Trail</option>
									</select>
								</div>
								<div><label>State:&nbsp</label>
									<select name="mileage" >
										<option>Choose Range</option>
										<option value="">Select</option>
										// these will have to relate to HttpServlet output
										<option value="Less than 5"></option>
										<option value="5 - 10"></option>
										<option value="10 - 20"></option>
										<option value="Greater than 20"></option>
									</select>
								</div>
								<div><label>Condition:&nbsp</label>
									<select name="condition_type">
										<option>Choose County</option>
										<option value="Dry">dry</option>
										<option value="Damp">damp</option>
										<option value="Wet">wet</option>
									</select>
								</div>
								<div><label>Difficulty:&nbsp</label>
									<select name="difficulty_level">
										<option>Choose Difficulty</option>
										<option value="Green">green</option>
										<option value="Green to Blue">green to blue</option>
										<option value="Green to Black">green to black</option>
										<option value="Blue">blue</option>
										<option value="Blue to Black">blue to black</option>
										<option value="Black">black</option>
									</select>
								</div>
								<div><label>Address:</label>
									<input id="autocomplete" placeholder="Address" >
								</div>
							</form>
						</div>

						<!-- Update Conditions Tab Panel -->
						<div class="tab-pane" id="update_conditions">
							<form id = "update_conditions_form">

							</form>
						</div>

						<!-- Submit Damage Report Tab Panel -->
						<div class="tab-pane" id="submit_damage_report">
							<form id = "submit_damage_report_form">
<<<<<<< Updated upstream


=======
								<div><label>Submit A Damage Report</label></div>
								<br>
								</div>
                                <div><label>First Name:&nbsp</label><input placeholder="Your first name" name="fN"></div>
                                <div><label>Last Name:&nbsp</label><input placeholder="Your last name" name="lN"></div>
                                <div><label>Date:&nbsp</label><input placeholder="Date" name="damage_date"></div>
                                <div><label>Email:&nbsp</label><input placeholder="Your email" name="user_email"></div>
								<div><label>Trail Name:&nbsp</label>
									<select name="trail">
										<option value="">Choose Trail</option>
										<option value=3>495 Jumps</option>
										<option value=23>Annapolis Waterworks</option>
										<option value=24>Bacon Ridge</option>
										<option value=25>Banneker Park</option>
										<option value=26>Belmont</option>
										<option value=27>Black Hill Regional Park</option>
										<option value=4>Brookfield Park</option>
										<option value=5>Bull Run Occoquan Trail (BROT)</option>
										<option value=28>Cabin John Park</option>
										<option value=29>Cedarville State Forest</option>
										<option value=2>Chesapeake Church</option>
										<option value=30>Clopper Lake</option>
										<option value=6>Colts Neck</option>
										<option value=7>Conway Robinson State Forest</option>
										<option value=31>Cosca Regional Park</option>
										<option value=8>Cross County Trail (CCT)</option>
										<option value=32>Emmitsburg</option>
										<option value=33>Fairland Regional Park</option>
										<option value=1>Fort Dupont</option>
										<option value=9>Fountainhead Regional Park</option>
										<option value=10>Fred Crabtree</option>
										<option value=62>Frederick Watershed</option>
										<option value=11>Freedom Center</option>
										<option value=34>Gambrill State Park</option>
										<option value=12>George Washington National Forest</option>
										<option value=36>Gillis Falls</option>
										<option value=37>Greenbrier State Park</option>
										<option value=38>Gwynns Falls-Leakin Park</option>
										<option value=39>Hashawa Environmental Center</option>
										<option value=40>Hoyles Mill/Diabase Trails</option>
										<option value=13>James Long Park</option>
										<option value=41>Kent Island Trail</option>
										<option value=14>Lake Accotink Park</option>
										<option value=15>Lake Fairfax Park</option>
										<option value=16>Laurel Hill</option>
										<option value=42>Little Bennett Regional Park</option>
										<option value=43>Little Gunpowder Falls State Park</option>
										<option value=44>Loch Raven</option>
										<option value=17>Locust Shade Park</option>
										<option value=18>Meadowood Recreation Area</option>
										<option value=45>Monocacy Natural Resources Area</option>
										<option value=19>Mount Vernon Park</option>
										<option value=46>Muddy Branch Trail</option>
										<option value=47>Northwest Branch Park</option>
										<option value=48>Patapsco Valley State Park - Avalon</option>
										<option value=49>Patapsco Valley State Park - Daniels</option>
										<option value=50>Patapsco Valley State Park - McKeldin</option>
										<option value=51>Patapsco Valley State Park - Woodstock</option>
										<option value=52>Patuxent River Park</option>
										<option value=53>Pepco Trail</option>
										<option value=20>Prince William Forest Park</option>
										<option value=21>Riverbend Park</option>
										<option value=54>River's Edge, Brunswick</option>
										<option value=55>Rockburn Branch Park</option>
										<option value=56>Rosaryville State Park</option>
										<option value=57>Schaffer Farms</option>
										<option value=58>Seneca Bluffs Trail</option>
										<option value=59>Seneca Greenway Trail</option>
										<option value=60>Seneca Ridge Trail (SRT)</option>
										<option value=61>Severn Run</option>
										<option value=35>South Germantown Bike Park</option>
										<option value=22>Wakefield Park</option>
									</select>
								</div>
								<div><label>Damage Type:</label>
									<select name="damage_type">
										<option value="">Choose Damage</option>
										<option value="down tree/brush">Down tree or brush</option>
										<option value="bridge">Bridge</option>
										<option value="standing water">Standing water</option>
										<option value="erosion/holes/ruts">Erosion/holes/ruts</option>
										<option value="trash">Trash</option>
										<option value="other">Other</option>
									</select>
								</div>
                                <div><label>Message:&nbsp</label><input placeholder="Add a message" name="message"></div>
                                <div><label>Location:&nbsp</label><input id="autocomplete" name="location"></div>
								<br>
								<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-star"></span> Submit the report
								</button>
>>>>>>> Stashed changes
							</form>
						</div>

<%--							</form>--%>
<%--						</div>--%>

					</div>
				</div>

				<div id="map-canvas" class="col-xs-9"></div>

			</div>
		</div>

        <script src="js/loadform.js"></script>
        <script src="js/loadmap.js"></script>

	</body>
</html>