<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

		<title>MORE Trails Portal</title>

		<!-- Custom styles -->
		<link rel="stylesheet" href="css/style.css">

		<!-- JQuery -->
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-3.1.0.min.js"></script>

		<!-- Popper -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
				integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
				crossorigin="anonymous"></script>

		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%--		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
		<!-- Bootstrap -->
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%--		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>

		<!-- Google Map js libraries -->
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsknU0BjvUqyd4Y78SK7WWrtKlJICo268&libraries=places"></script>


	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<a class="navbar-brand">MORE Trails Portal</a>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="sidebar col-xs-4">
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
								<!--Want to add autocomplete on state, county and trail based on input, should be able to do this by corresponding with HTTPServlet -->
								<!-- Do we want to make it so users can select multiple ones? -->
								<div><label>State:&nbsp</label>
									<select name="stateID" >
										<option>Choose State</option>
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
							</form>
						</div>
=======
<%--							</form>--%>
<%--						</div>--%>
>>>>>>> Stashed changes
					</div>
				</div>

				<div id="map-canvas" class="col-xs-8"></div>

			</div>
		</div>


        <script src="js/loadform.js"></script>
        <script src="js/loadmap.js"></script>

	</body>
</html>