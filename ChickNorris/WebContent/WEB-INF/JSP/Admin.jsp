<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chick Norris - Admin Page</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/jquer-ui/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/calendar.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/media-queries.css"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Indie+Flower"/>
</head>
<body>
	<header id="nav-wrapper">
        <a href="Home.htm"><div id="logo"></div></a>
    </header>
    <div class="content">    	 	
    	<ul id="tabs" class="nav nav-tabs">
    		<li><a data-toggle="tab" href="#geolocationTab">Geolocatie</a></li>
        	<li><a data-toggle="tab" href="#searchTab">Zoek klant</a></li>        	
        	<li><a data-toggle="tab" href="#sendMailTab">Verstuur Email</a></li>
        	<li><a data-toggle="tab" href="#calendarTab">Kalender</a></li>
    	</ul>
    	<div id="tabContent" class="tab-content">
        	<div id="searchTab" class="tab-pane fade">
            	<h3>Zoek klant</h3>
            	<hr/>
            	<div id="form">
					<form role="form" action="Admin.htm" method="post" >
						<div class="form-group">
    						<label for="form_name">Naam:</label>
    						<input type="text" class="form-control" name="form_name" id="form_name" placeholder="Vul de te zoeken naam in.">
  						</div>
  						<div class="form-group">
    						<label for="form_name">Voornaam:</label>
    						<input type="text" class="form-control" name="form_name" id="form_name" placeholder="Vul de te zoeken voornaam in.">
  						</div>
  						<div class="form-group">
  							<button type="submit" class="btn btn-default">Submit</button>
  							<button type="reset" class="btn btn-danger">Cancel</button>
  						</div>
					</form>
				</div>
				<div id="tableCustomers">					
  					<table class="table table-bordered">
    					<thead>
      						<tr>
        						<th>Naam</th>
        						<th>Voornaam</th>
        						<th>Email</th>
        						<th>Telefoon</th>
        						<th>Adres</th>
        						<th>Gelegenheid</th>
      						</tr>
    					</thead>
    					<tbody>
      						<c:if test="${not empty listCust}">
     							<c:forEach var="ob" varStatus="status" items="${listCust}">
    								<tr onclick="">
        								<td><c:out value="${ob.name}"/></td>
        								<td><c:out value="${ob.firstName}"/></td>
        								<td><c:out value="${ob.email}"/></td>
        								<td><c:out value="${ob.phone}"/></td>
        								<td><c:out value="${ob.address}"/></td>
        								<td><c:out value="${ob.occasion}"/></td>
    								</tr>
             					</c:forEach>
            				</c:if>
    					</tbody>
  					</table>
  				</div>
        	</div>
        	<div id="geolocationTab" class="tab-pane fade in active">
        		<h3>Geolocatie</h3>
        		<hr/>
        		<div id="panel" class="container">
        			<form role="form" action="geoLocatie.htm" method="post" >
        				<div class="form-group">
        					<label for="address">Plaatsnaam</label>
        					<input id="address" type="textbox" value="Brussel">
        					<input class="btn btn-default" id="searchAddress" type="button" value="Zoek" onclick="codeAddress()"><br/>
        					<small>Voeg de landcode toe om een beter resultaat te verkrijgen. Ex: Brussel, BE</small><br/>
        				</div>
        				<div class="form-group">
        					<label for="truckId">Identificatie Truck</label>
        					<input name="truckId" id="truckId" type="textbox" placeholder="Geef de truck nummer.">
        				</div>		
        				<div class="form-group">
        					<label for="lat">Latitude</label>
        					<input name="lat" id="lat" type="textbox" placeholder="lat coördinaten"><br/>
        					<label for="long">Longitude</label>
        					<input name="long" id="long" type="textbox" placeholder="long coördinaten">
        				</div>
        				<div class="form-group">
        					<button type="submit" class="btn btn-default">Submit</button>
        				</div>
        			</form>
        			<div id="map-canvas" class="col-md-6"></div>
        			<div id="locationList-canvas" class="col-md-6">
        				<table id="locationTable" class="table table-bordered">
    					<thead>
      						<tr>
        						<th>Trucknummer</th>
        						<th>Latitude</th>
        						<th>Longitude</th>
        						<th>Verwijder</th>
      						</tr>
    					</thead>
    					<tbody>
      						<c:if test="${not empty listTrucks}">
     							<c:forEach var="ob" varStatus="status" items="${listTrucks}">
     								<form role="form" action="Admin.htm" action="post">
    									<tr id="${ob.ID}">
        									<td><c:out value="${ob.truckNumber}"/></td>
        									<td><c:out value="${ob.latitude}"/></td>
        									<td><c:out value="${ob.longitude}"/></td>
        									<td><button type="submit" onclick="deleteLocation(${ob.ID})"><img src="./resources/images/trashbin.png"></button></td>
    									</tr>
    								</form>
             					</c:forEach>
            				</c:if>
    					</tbody>
  					</table>
  					<div class="form-group">
        					<button type="submit" onclick="deleteAllLocations()" class="btn btn-default">Verwijder alle locaties.</button>
        				</div>
        			</div>		
       			</div>
        		           	
        	</div>
        	<div id="sendMailTab" class="tab-pane fade">
            	<h3>Verstuur mail</h3>
            	<hr/>
            	<div id="mailPanel">
            		<form role="form" action="Admin.htm" method="post" >
            			<div class="form-group">
            				<label for="emailAddress">Naar:</label>
            				<input id="emailAddress" type="textbox" placeholder="Emailadressen waar u de mail naartoe wilt versturen. Ex: ChickNorris@ChickNorris.be"><br/>         				
            				<input type="checkbox" id="mailAllUsers">
            				<label for="mailAllUsers"><small>Verstuur email naar geabonneerden.</small></label>            				
            			</div>
            			<div class="form-group">
            				<label for="emailTitle">Titel Email:</label>
            				<input id="emailTitle" type="textbox" placeholder="Vul hier de gekozen emailtitel in.">
            			</div>
            			<textarea id="emailBody" class="form-control" rows="20"></textarea>
            			<div id="mailBtns" class="form-group">
            				<button type="reset" class="btn btn-danger">Annuleren</button>
            				<button type="submit" class="btn btn-default">Verstuur</button>            				
            			</div>
            		</form>
            	</div>
        	</div>
        	<div id="calendarTab" class="tab-pane fade">
            	<h3>Kalender</h3>
            	<hr/>
            	<div id="calendarPanel" class="container">
            		<div id="cal" class="col-md-6">
            			<%@include file="calendar.jsp" %>
            		</div>
            		<div id="calendarForm" class="col-md-6">
            			<form role="form" action="Admin.htm" method="post">
            				<div class="form-group">
            					<label for="calendarDate">Datum:</label>
            					<input type="text" id="calendarDate">
            				</div>
            			</form>
            		</div>            		
            	</div>
        	</div>
    	</div>
    </div>
    <footer>
    	<p>&copy; Chick Norris 2015</p>
    </footer>
    <!-- JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/scripts/jqueryui/jquery-ui.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script type="text/javascript" src="resources/scripts/admin.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
