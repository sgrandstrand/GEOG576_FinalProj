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
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=YOURKEYHERE&libraries=places"></script>

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
									<select name="state" >
										<option>Choose State</option>
										<option value="District of Columbia">District of Columbia</option>
										<option value="Virginia">Virginia</option>
										<option value="Maryland">Maryland</option>
									</select>
								</div>
								<div><label>County:&nbsp</label>
									<select name="county">
										<option>Choose County</option>
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
									<select name="trail_condition">
										<option>Choose County</option>
										<option value="dry">Dry</option>
										<option value="damp">Damp</option>
										<option value="wet">Wet</option>
									</select>
								</div>
								<div><label>Difficulty:&nbsp</label>
									<select name="trail_difficulty">
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