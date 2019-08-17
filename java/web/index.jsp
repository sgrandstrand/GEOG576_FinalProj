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
			crossorigin="anonymous">
		</script>
		
    	<!-- Bootstrap -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
    	<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

		<!-- Google Map js libraries -->
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=YOURKEYHERE&libraries=places"></script>

	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<a class="navbar-brand">MORE Trails Portal - www.more-mtb.org</a>
		</nav>

		<div class="container-fluid">
			<div class="row">

				<div class="sidebar col-xs-3">
					<!-- Tab Nav -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#query_trails" data-toggle="tab">Find Trails to Ride</a></li>
						<li><a href="#update_conditions" data-toggle="tab">Update Trail Conditions</a></li>
						<li><a href="#submit_damage_report" data-toggle="tab">Submit A Damage Report</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<!-- Query Trails Tab Panel -->
						<div class="tab-pane active" id="query_trails">
							<form id = "query_trails_form">
								<!--Want to add autocomplete on state, county and trail based on input, should be
								able to do this by corresponding with HTTPServlet -->
								<!-- Do we want to make it so users can select multiple ones? -->
								<div><label>Find Trails to Ride</label></div>
								<br>
								<div><label>State:</label>
									<select name="state">
										<option value="">Choose State</option>
										<option value="District of Columbia">District of Columbia</option>
										<option value="Virginia">Virginia</option>
										<option value="Maryland">Maryland</option>
									</select>
								</div>
								<div><label>County:</label>
									<select name="county">
										<option value="">Choose County</option>
										<option value="District of Columbia">District of Columbia</option>
										<option value="Fairfax">Fairfax</option>
										<option value="Prince William">Prince William</option>
										<option value="Loudoun">Loudoun</option>
										<option value="Shenandoah">Shenandoah</option>
										<option value="Anne Arundel">Anne Arundel</option>
										<option value="Baltimore">Baltimore</option>
										<option value="Howard">Howard</option>
										<option value="Montgomery">Montgomery</option>
										<option value="Prince George's">Prince George's</option>
										<option value="Frederick">Frederick</option>
										<option value="Carroll">Carroll</option>
										<option value="Washington">Washington</option>
										<option value="Baltimore City">Baltimore City</option>
										<option value="Queen Anne's">Queen Anne's</option>
									</select>
								</div>
								<div><label>Trail Name:</label>
									<select name="name">
										<option value="">Choose Trail</option>
										<option value="495 Jumps">495 Jumps</option>
										<option value="Annapolis Waterworks">Annapolis Waterworks</option>
										<option value="Bacon Ridge">Bacon Ridge</option>
										<option value="Banneker Park">Banneker Park</option>
										<option value="Belmont">Belmont</option>
										<option value="Black Hill Regional Park">Black Hill Regional Park</option>
										<option value="Brookfield Park">Brookfield Park</option>
										<option value="Bull Run Occoquan Trail (BROT)">Bull Run Occoquan Trail (BROT)</option>
										<option value="Cabin John Park">Cabin John Park</option>
										<option value="Cedarville State Forest">Cedarville State Forest</option>
										<option value="Chesapeake Church">Chesapeake Church</option>
										<option value="Clopper Lake">Clopper Lake</option>
										<option value="Colts Neck">Colts Neck</option>
										<option value="Conway Robinson State Forest">Conway Robinson State Forest</option>
										<option value="Cosca Regional Park">Cosca Regional Park</option>
										<option value="Cross County Trail (CCT)">Cross County Trail (CCT)</option>
										<option value="Emmitsburg">Emmitsburg</option>
										<option value="Fairland Regional Park">Fairland Regional Park</option>
										<option value="Fort Dupont">Fort Dupont</option>
										<option value="Fountainhead Regional Park">Fountainhead Regional Park</option>
										<option value="Fred Crabtree">Fred Crabtree</option>
										<option value="Frederick Watershed">Frederick Watershed</option>
										<option value="Freedom Center">Freedom Center</option>
										<option value="Gambrill State Park">Gambrill State Park</option>
										<option value="George Washington National Forest">George Washington National Forest</option>
										<option value="Gillis Falls">Gillis Falls</option>
										<option value="Greenbrier State Park">Greenbrier State Park</option>
										<option value="Gwynns Falls-Leakin Park">Gwynns Falls-Leakin Park</option>
										<option value="Hashawa Environmental Center">Hashawa Environmental Center</option>
										<option value="Hoyles Mill/Diabase Trails">Hoyles Mill/Diabase Trails</option>
										<option value="James Long Park">James Long Park</option>
										<option value="Kent Island Trail">Kent Island Trail</option>
										<option value="Lake Accotink Park">Lake Accotink Park</option>
										<option value="Lake Fairfax Park">Lake Fairfax Park</option>
										<option value="Laurel Hill">Laurel Hill</option>
										<option value="Little Bennett Regional Park">Little Bennett Regional Park</option>
										<option value="Little Gunpowder Falls State Park">Little Gunpowder Falls State Park</option>
										<option value="Loch Raven">Loch Raven</option>
										<option value="Locust Shade Park">Locust Shade Park</option>
										<option value="Meadowood Recreation Area">Meadowood Recreation Area</option>
										<option value="Monocacy Natural Resources Area">Monocacy Natural Resources Area</option>
										<option value="Mount Vernon Park">Mount Vernon Park</option>
										<option value="Muddy Branch Trail">Muddy Branch Trail</option>
										<option value="Northwest Branch Park">Northwest Branch Park</option>
										<option value="Patapsco Valley State Park - Avalon">Patapsco Valley State Park - Avalon</option>
										<option value="Patapsco Valley State Park - Daniels">Patapsco Valley State Park - Daniels</option>
										<option value="Patapsco Valley State Park - McKeldin">Patapsco Valley State Park - McKeldin</option>
										<option value="Patapsco Valley State Park - Woodstock">Patapsco Valley State Park - Woodstock</option>
										<option value="Patuxent River Park">Patuxent River Park</option>
										<option value="Pepco Trail">Pepco Trail</option>
										<option value="Prince William Forest Park">Prince William Forest Park</option>
										<option value="Riverbend Park">Riverbend Park</option>
										<option value="River's Edge, Brunswick">River's Edge, Brunswick</option>
										<option value="Rockburn Branch Park">Rockburn Branch Park</option>
										<option value="Rosaryville State Park">Rosaryville State Park</option>
										<option value="Schaffer Farms">Schaffer Farms</option>
										<option value="Seneca Bluffs Trail">Seneca Bluffs Trail</option>
										<option value="Seneca Greenway Trail">Seneca Greenway Trail</option>
										<option value="Seneca Ridge Trail (SRT)">Seneca Ridge Trail (SRT)</option>
										<option value="Severn Run">Severn Run</option>
										<option value="South Germantown Bike Park">South Germantown Bike Park</option>
										<option value="Wakefield Park">Wakefield Park</option>
									</select>
								</div>
								<div><label>Mileage:</label>
									<select name="mileage">
										<option value="">Choose Range</option>
										<option value="< 5">Less than 5</option>
										<option value="> 5 AND trail.mileage < 10">5 - 10</option>
										<option value="> 10 AND trail.mileage < 20">10 - 20</option>
										<option value="> 20">Greater than 20</option>
									</select>
								</div>
								<div><label>Difficulty:</label>
									<select name="difficulty">
										<option value="">Choose Difficulty</option>
										<option value="green">Green</option>
										<option value="green to blue">Green to Blue</option>
										<option value="green to black">Green to Black</option>
										<option value="blue">Blue</option>
										<option value="blue to black">Blue to Black</option>
										<option value="black">Black</option>
									</select>
								</div>
								<div><label>Condition</label>
									<select name="condition">
										<option value="">Choose Condition</option>
										<option value="dry">Dry</option>
										<option value="damp">Damp</option>
										<option value="wet">Wet</option>
									</select>
								</div>
								<br>
								<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-star"></span> Submit the query
								</button>
							</form>
						</div>

						<!-- Update Conditions Tab Panel -->
						<div class="tab-pane" id="update_conditions">
							<form id = "update_conditions_form">
								<div><label>Update Trail Conditions</label></div>
								<br>
								<div><label>Trail Name:</label>
									<select name="trail_id">
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
                                <div><label>First Name:&nbsp</label><input placeholder="Your first name" name="first_name"></div>
                                <div><label>Last Name:&nbsp</label><input placeholder="Your last name" name="last_name"></div>
                                <div><label>Date (YYYY-MM-DD):&nbsp</label><input placeholder="Date" name="date"></div>
                                <div><label>Email:&nbsp</label><input placeholder="Your email" name="email"></div>
								<div><label>Condition:</label>
									<select name="condition">
										<option value="">Choose Condition</option>
										<option value="dry">Dry</option>
										<option value="damp">Damp</option>
										<option value="wet">Wet</option>
									</select>
								</div>
                                <div><label>Message:&nbsp</label><input placeholder="Add a message" name="message"></div>
								<br>
								<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-star"></span> Submit the report
								</button>
							</form>
						</div>

						<!-- Submit Damage Report Tab Panel -->
						<div class="tab-pane" id="submit_damage_report">
							<form id = "submit_damage_report_form">
								<div><label>Submit A Damage Report</label></div>
								<br>
								<div><label>Trail Name:</label>
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
                                <div><label>First Name:&nbsp</label><input placeholder="Your first name" name="fN"></div>
                                <div><label>Last Name:&nbsp</label><input placeholder="Your last name" name="lN"></div>
                                <div><label>Date (YYYY-MM-DD):&nbsp</label><input placeholder="Date" name="damage_date"></div>
                                <div><label>Email:&nbsp</label><input placeholder="Your email" name="user_email"></div>
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
							</form>
						</div>
						<div id="toggle-damage"><p id="toggle-text"> Damage Report Locations <label class="switch"
							id="toggle-switch"><input type="checkbox"><span class="slider round"></span></label></p>
						</div>
					</div>
				</div>

                <!-- Map Panel -->
				<div id="map-canvas" class="col-xs-9"></div>

			</div>
		</div>

		<!-- Add custom javascript here-->
        <script src="js/loadform.js"></script>
        <script src="js/loadmap.js"></script>

	</body>
</html>