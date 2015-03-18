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
<link rel="stylesheet" type="text/css" href="resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/media-queries.css"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Indie+Flower"/>
</head>
<body>
	<header id="nav-wrapper">
        <a href="Home.htm"><div id="logo"></div></a>
    </header>
    <div class="content">    	 	
    	<ul id="tabs" class="nav nav-tabs">
        	<li><a data-toggle="tab" href="#search">Zoek klant</a></li>
        	<li><a data-toggle="tab" href="#geolocation">Geolocatie</a></li>
        	<li><a data-toggle="tab" href="#sendMail">Verstuur Email</a></li>
        	<li><a data-toggle="tab" href="#calendar">Kalender</a></li>
    	</ul>
    	<div id="tabContent" class="tab-content">
        	<div id="search" class="tab-pane fade in active">
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
        	<div id="geolocation" class="tab-pane fade">
            	<h3>Geolocatie</h3>
            	<hr/>
            	<div id="panel">
                	<label for="address">Plaatsnaam</label>
                    <input id="address" type="textbox" value="Brussel, Be"> 
                    <input id="searchAddress" type="button" value="Zoek">
                    <small>Voeg de landcode toe om een beter resultaat te verkrijgen. Ex: Brussel, BE</small>                
                	<div class="pure-g">
                		<div class="pure-u-1-2 pure-u-md-1-2 resultlatlong">
                        	<label for="lat">Latitude</label>
                        	<input type="text" name="lat" id="lat" placeholder="lat coordinate"><br>
                        </div>
                		<div class="pure-u-1-2 pure-u-md-1-2 resultlatlong">
                        	<label for="lng">Longitude</label>
                        	<input type="text" name="lng" id="lng" placeholder="long coordinate">
                		</div>
            		</div>
        		</form>
        		<div id="map-canvas"></div></div>
        	<div id="sendMail" class="tab-pane fade">
            	<h3>Verstuur mail</h3>
            	
        	</div>
        	<div id="calendar" class="tab-pane fade">
            	<h3>Kalender</h3>
            	
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
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script type="text/javascript" src="resources/scripts/template.js"></script>
	<script type="text/javascript" src="resources/scripts/admin.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>