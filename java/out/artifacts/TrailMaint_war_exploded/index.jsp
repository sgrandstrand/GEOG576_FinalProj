<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

		<title>MORE Trails Portal</title>

		<!-- Custom styles -->
		<link rel="stylesheet" href="css/style.css">

		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%--		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>

		<!-- Google Map js libraries -->
<%--		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=YOURKEYHERE&libraries=places"></script>--%>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyBsknU0BjvUqyd4Y78SK7WWrtKlJICo268&signed_in=true&libraries=places,visualization"></script>
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
					</div>
				</div>

				<div id="map-canvas" class="col-xs-8"></div>

			</div>
		</div>

		<!-- JQuery -->
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-3.1.0.min.js"></script>

		<!-- Popper -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>

<%--        <script src="js/loadform.js"></script>--%>
        <script src="js/loadmap.js"></script>

		<!-- Bootstrap -->
<%--		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>