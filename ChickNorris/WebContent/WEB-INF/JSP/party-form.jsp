<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chick Norris - Verkoopsgegevens</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer1.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/party-form.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/media-queries.css"/>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Indie+Flower"/>
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
</head>
<body>
	<div id="header"></div>
	<div id="content">
		<div id="calendar"></div>
		<div id="form">
			<form role="form">
				<div class="form-group">
    				<label for="form_name">Naam (*) :</label>
    				<input type="text" class="form-control" id="form_name" placeholder="Vul je naam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firstname">Voornaam (*):</label>
    				<input type="text" class="form-control" id="form_firstname" placeholder="Vul je voornaam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firmname">Firmanaam:</label>
    				<input type="text" class="form-control" id="form_firmname" placeholder="Vul je firmanaam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_address">Adres (*):</label>
    				<input type="text" class="form-control" id="form_address" placeholder="Vul je adres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_zip">Postcode (*):</label>
    				<input type="text" class="form-control" id="form_zip" placeholder="Vul je postcode in.">
  				</div>
  				<div class="form-group">
    				<label for="form_city">Woonplaats (*):</label>
    				<input type="text" class="form-control" id="form_city" placeholder="Vul je adres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_taxnbr">BTW-nr:</label>
    				<input type="text" class="form-control" id="form_taxnbr" placeholder="Vul je BTW-nr in.">
  				</div>
  				<div class="form-group">
    				<label for="form_phone">Tel(*):</label>
    				<input type="text" class="form-control" id="form_phone" placeholder="Vul je telefoonnummer in.">
  				</div>
  				<div class="form-group">
    				<label for="form_email">Email(*):</label>
    				<input type="text" class="form-control" id="form_email" placeholder="Vul je emailadres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_occasion">Gelegenheid (*):</label>
    				<textarea class="form-control" rows="3" id="form_occasion"></textarea>
  				</div>
  				<div class="form-group">
    				<label for="form_date">Datum event (*):</label>
    				<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
    				<input type="text" class="form-control" id="form_date" placeholder="<%= df.format(new Date()) %>">
  				</div>
  				<div class="form-group">
    				<label for="form_time">Aanvang event (*):</label>
    				<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("HH:mm"); %>
    				<input type="text" class="form-control" id="form_time" placeholder="<%= df2.format(new Date()) %>">
  				</div>
  				<label for="radio-btns">Formule:</label>
  				<div id="radio-btns">
  					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula1" value="option1" checked>
    						VIP
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula2" value="option2">
    						Deluxe
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula3" value="option3">
    						Regular
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula4" value="option4">
    						Basic
  						</label>
					</div>
				</div>
  				<div class="checkbox">
    				<label>
      					<input type="checkbox"> Hierbij bevestig ik mijn bestelling en ga ik akkoord met de <a href="#">algemene voorwaarden.</a>
    				</label>
  				</div>
  				<div class="checkbox">
  					<label>
  						<input type="checkbox">Mijn bestelling wordt pas definitief na bevestiging van uw reservatie.
  					</label>
  				</div>
  				<div id="fine-print">
					<ul>
						<li>(*) - verplichte velden</li>
					</ul>
				</div>
  				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
	<div id="footer"></div>
	<!-- JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>	
	<script type="text/javascript" src="resources/scripts/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/scripts/template.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/party-form.js"></script>
	<script type="text/javascript" src="resources/scripts/jquery-ui/timepicker.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>