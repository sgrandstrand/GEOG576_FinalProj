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

				<div class="sidebar col-xs-2">
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
<%--								<div><label>Trail:</label>--%>
<%--									<select name="name">--%>
<%--										<option value="">Choose Trail</option>--%>
<%--									</select>--%>
<%--								</div>--%>
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
								<div><label>Trail:</label>
									<select name="name">
										<option value="">Choose Trail</option>
									</select>
								</div>
                                <div><label>First Name:&nbsp</label><input placeholder="Your first name" name="first_name"></div>
                                <div><label>Last Name:&nbsp</label><input placeholder="Your last name" name="last_name"></div>
                                <div><label>Date:&nbsp</label><input placeholder="Date" name="date"></div>
                                <div><label>Email:&nbsp</label><input placeholder="Your email" name="email"></div>
								<div><label>Condition</label>
									<select name="condition">
										<option value="">Choose Condition</option>
										<option value="dry">Dry</option>
										<option value="damp">Damp</option>
										<option value="wet">Wet</option>
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

						<!-- Submit Damage Report Tab Panel -->
						<div class="tab-pane" id="submit_damage_report">
							<form id = "submit_damage_report_form">
								<div><label>Submit A Damage Report</label></div>
								<br>
								<div><label>Trail:</label>
									<select name="name">
										<option value="">Choose Trail</option>
									</select>
								</div>
                                <div><label>First Name:&nbsp</label><input placeholder="Your first name" name="first_name"></div>
                                <div><label>Last Name:&nbsp</label><input placeholder="Your last name" name="last_name"></div>
                                <div><label>Date:&nbsp</label><input placeholder="Date" name="date"></div>
                                <div><label>Email:&nbsp</label><input placeholder="Your email" name="email"></div>
								<div><label>Damage Type:</label>
									<select name="damage">
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

				<div id="map-canvas" class="col-xs-10"></div>

			</div>
		</div>

		<!-- Add custom javascript here-->
        <script src="js/loadform.js"></script>
        <script src="js/loadmap.js"></script>

	</body>
</html>