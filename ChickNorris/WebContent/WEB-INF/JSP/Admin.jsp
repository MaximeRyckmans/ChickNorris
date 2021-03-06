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
<link rel="stylesheet" type="text/css" href="resources/JquerUI/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/bbcode/minified/themes/default.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/calendar.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/media-queries.css"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Indie+Flower"/>
</head>
<body>
	<header id="nav-wrapper">
        <a href="Home.htm"><div id="logo"></div></a>  
    </header>
    <div class="content CNtext">
    	<nav class="navbar navbar-default">
    		<div class="container-fluid">
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        				<span class="sr-only">Toggle navigation</span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
      				</button>
    			</div>
    			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    				<ul id="tabs" class="nav navbar-nav">
    					<li class="active"><a href="#geolocation">Geolocatie</a></li>
        				<li><a href="#search">Zoek klant</a></li>        	
        				<li><a href="#sendMail">Verstuur Email</a></li>
        				<li><a href="#calendarTab">Kalender</a></li>
						<li><a href="#users">Users</a> </li>
    				</ul>
    				<ul class="nav navbar-nav navbar-right">
    					<li><a href="Login.htm">logout</a></li>
    				</ul>
    			</div>
    		</div>
    	</nav>
    	<div id="tabContent" class="tab-content">
        	<div id="search" class="tab-pane">
            	<h3>Zoek klant</h3>
            	<hr/>
            	<div id="form">
					<form role="form" action="SearchCustomer.htm" method="post" >
						<div class="form-group">
    						<label for="form_name">Naam:</label>
    						<input type="text" class="form-control" name="form_surName" id="form_name" placeholder="Vul de te zoeken naam in.">
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
        								<td><c:out value="${ob.customer.name}"/></td>
        								<td><c:out value="${ob.customer.surName}"/></td>
        								<td><c:out value="${ob.customer.email}"/></td>
        								<td><c:out value="${ob.customer.telNR}"/></td>
        								<td><c:out value="${ob.customer.address}"/></td>
        								<td><c:out value="${ob.occasion}"/></td> 						
    								</tr>
             					</c:forEach>
            				</c:if>
    					</tbody>
  					</table>
  				</div>
        	</div>
        	<div id="geolocation" class="tab-pane active">
        		<h3>Geolocatie</h3>
        		<hr/>
        		<div id="panel" class="container">
        			<form role="form" action="geoLocatie.htm" method="post" >
        				<div class="form-group">
        					<label for="address">Plaatsnaam</label>
        					<input id="address" name="address" type="textbox" value="Brussel">
        					<label for="region">Regio</label>
        					<input id="region" name="region" type="textbox" placeholder="Brussel">
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
        						<th>Adres</th>
        						<th>Regio</th>
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
        									<td><c:out value="${ob.locAddress}"/></td>
        									<td><c:out value="${ob.region}"/></td>
        									<td><button type="submit" onclick="deleteLocation(${ob.ID})"><img id="img-trashbin" src="./resources/images/trashbin.png"></button></td>
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
        	<div id="sendMail" class="tab-pane">
            	<h3>Verstuur mail</h3>
            	<hr/>
            	<div id="mailPanel">
            		<form role="form" id="form-validate" action="Mail.htm" method="post" >
            			<div id="emailBodyWrapper">
            				<div class="form-group">
            					<label for="senderAddress">Van:</label>
            					<input id="senderAddress" name="senderAddress" type="email" placeholder="Geef een @chicknorris.be email in.">            					
            				</div>
            				<div clas="form-group">
            					<label for="passwordSender">Paswoord:</label>
            					<input id="passwordSender" name="passwordSender" type="password" placeholder="******">
            				</div>
            				<div class="form-group">
            					<label for="emailAddress">Naar:</label>
            					<input id="emailAddress" name="emailAddress" type="textbox" placeholder="Emailadressen waar u de mail naartoe wilt versturen. Ex: ChickNorris@ChickNorris.be"><br/>         				
            					<input type="checkbox" id="mailAllUsers" name="mailAllUsers">
            					<label for="mailAllUsers"><small>Verstuur email naar geabonneerden.</small></label>            				
            				</div>
            				<div class="form-group">
            					<label for="emailTitle">Titel Email:</label>
            					<input id="emailTitle" name="emailTitle" type="textbox" placeholder="Vul hier de gekozen emailtitel in.">
            				</div>            			
            				<textarea id="emailBody" name="emailBody" class="form-control" rows="20"></textarea>            			           			
            				<div id="mailBtns" class="form-group">
            					<button type="reset" class="btn btn-danger">Annuleren</button>
            					<button type="submit" class="btn btn-default">Verstuur</button>            				
            				</div>
            			</div>
            		</form>
            	</div>
        	</div>
        	<div id="calendarTab" class="tab-pane">
            	<h3>Kalender</h3>
            	<hr/>
            	<div id="calendarPanel" class="container">
            		<div id="cal" class="col-md-6">
            			<%@include file="calendar.jsp" %>
            		</div>
            		<div id="calendarForm" class="col-md-6">
            			<form role="form" action="Calendar.htm" method="post">
            				<div class="form-group">
            					<label for="calendarStartDate">Startdatum:</label>
            					<input class="calendarDate" type="text" id="calendarStartDate" name="calendarStartDate"><br/>
            					<label for="calendarEndDate">Einddatum:</label>
            					<input class="calendarDate" type="text" id="calendarEndDate" name="calendarEndDate">
            				</div>
            				<div class="form-group">
            					<button type="submit" name="removeDate" class="btn btn-danger">Verwijder</button>
            					<button type="submit" name="addDate" class="btn btn-default">Toevoegen</button>  
            				</div>
            			</form>
            		</div>            		
            	</div>
        	</div>
			<div id="users" class="tab-pane">
				<h3>Users</h3>
				<hr/>
				<div id="usersPanel" class="container">
					<form role="form" action="SaveUser.htm" method="post" >
						<div class="form-group">
							<label for="username">Gebruikersnaam</label>
							<input id="username" name="username" type="textbox" placeholder="Gebruikersnaam">
							<label for="password">Paswoord</label>
							<input id="password" name="password" type="password" placeholder="Paswoord">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-default">Opslaan</button>
						</div>
					</form>
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
	<script type="text/javascript" src="resources/JqueryUI/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/bbcode/minified/jquery.sceditor.bbcode.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/scripts/localization/messages_nl.js"></script>
	<script type="text/javascript" src="resources/scripts/admin.js"></script>
	<script type="text/javascript" src="resources/scripts/calendar.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
