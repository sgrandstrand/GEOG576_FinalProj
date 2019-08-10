<%--
  Created by IntelliJ IDEA.
  User: sarah
  Date: 2019-08-10
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Web Project</title>

  <!-- Custom styles -->
  <link rel="stylesheet" href="css/style.css">

  <!-- JQuery -->
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <!-- Google Map js libraries  CAN YOU OWN API HERE -->
  <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=YOURKEYHERE&libraries=places"
  ></script>

</head>
<body>

  <nav class="navbar navbar-inverse navbar-fixed-top">
    <a class="navbar-brand">MORE Trail Status</a>
  </nav>

  <div class="container-fluid">
    <div class="row">

      <div class="sidebar col-xs-3">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#create_report" data-toggle="tab">Create Report</a></li>
          <li><a href="#query_report" data-toggle="tab">Query</a></li>
        </ul>

        <div class="tab-content ">
          <div class="tab-pane active" id="create_report"></div>
          <div class="tab-pane" id="query_report"></div>
        </div>
      </div>

      <div id="map-canvas" class="col-xs-9"></div>

    </div>
  </div>


</body>
</html>