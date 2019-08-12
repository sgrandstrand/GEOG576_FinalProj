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
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsknU0BjvUqyd4Y78SK7WWrtKlJICo268&libraries=places"></script>

		<!-- Google Map js libraries -->
<!--        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=YOURKEYHERE&libraries=places"></script>  -->

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
								<!--Want to add autocomplete on state, county and trail based on input, should be able to do this by corresponding with HTTPServlet -->
								<!-- Do we want to make it so users can select multiple ones? -->
								<div><label>State:&nbsp</label>
									<select name="stateID" >
										<option>Choose State</option>
										<option value="11">District of Columbia</option>
										<option value="51">Virginia</option>
										<option value="24">Maryland</option>
									</select>
								</div>
								<div><label>County:&nbsp</label>
									<select name="countyID">
										<option>Choose County</option>
										<option value="11001">District of Columbia</option>
										<option value="51029">Fairfax</option>
										<option value="51076">Prince William</option>
										<option value="51053">Loudoun</option>
										<option value="51085">Shenandoah</option>
										<option value="24003">Anne Arundel</option>
										<option value="24005">Baltimore</option>
										<option value="24027">Howard</option>
										<option value="24031">Montgomery</option>
										<option value="24033">Prince George's</option>
										<option value="24021">Frederick</option>
										<option value="24013">Carroll</option>
										<option value="24043">Washington</option>
										<option value="24510">Baltimore City</option>
										<option value="24035">Queen Anne's</option>
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
										<option value="">Less than 5</option>
										<option value="">5 - 10</option>
										<option value="">10 - 20</option>
										<option value="">Greater than 20</option>
									</select>
								</div>
								<div><label>Condition:&nbsp</label>
									<select name="condition_type">
										<option>Choose County</option>
										<option value="dry">Dry</option>
										<option value="damp">Damp</option>
										<option value="wet">Wet</option>
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
								<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-star"></span> Submit the query
								</button>
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