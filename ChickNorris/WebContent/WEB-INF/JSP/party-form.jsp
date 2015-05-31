<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chick Norris - Verkoopsgegevens</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/party-form.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/calendar.css"/>
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
	<div id="header"><%@include file="header.jsp"%></div>
	<div id="content">		
		<div id="calendar" class="col-xs-12 col-md-6">
			<%@include file="calendar.jsp" %>
		</div>
		<div id="form" class="col-xs-12 col-md-6">
			<form role="form" id="form-validate" action="Party-Form.htm" method="post" >
				<div class="form-group">
    				<label for="form_name">Naam (*) :</label>
    				<input type="text" class="form-control" name="form_name" id="form_name" placeholder="Vul je naam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firstname">Voornaam (*):</label>
    				<input type="text" class="form-control" name="form_firstname"  id="form_firstname" placeholder="Vul je voornaam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firmname">Firmanaam:</label>
    				<input type="text" class="form-control" name="form_firmname" id="form_firmname" placeholder="Vul je firmanaam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_address">Adres (*):</label>
    				<input type="text" class="form-control" name="form_address" id="form_address" placeholder="Vul je adres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_zip">Postcode (*):</label>
    				<input type="text" class="form-control" name="form_zip" id="form_zip" placeholder="Vul je postcode in.">
  				</div>
  				<div class="form-group">
    				<label for="form_city">Woonplaats (*):</label>
    				<input type="text" class="form-control" name="form_city" id="form_city" placeholder="Vul je adres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_taxnbr">BTW-nr:</label>
    				<input type="text" class="form-control" name="form_taxnbr" id="form_taxnbr" placeholder="Vul je BTW-nr in.">
  				</div>
  				<div class="form-group">
    				<label for="form_phone">Tel(*):</label>
    				<input type="text" class="form-control" name="form_phone" id="form_phone" placeholder="Vul je telefoonnummer in.">
  				</div>
  				<div class="form-group">
    				<label for="form_email">Email(*):</label>
    				<input type="email" class="form-control" name="form_email" id="form_email" placeholder="Vul je emailadres in.">
  				</div>
  				<div class="form-group">
    				<label for="form_occasion">Gelegenheid (*):</label>
    				<textarea class="form-control" rows="3" name="form_occasion" id="form_occasion"></textarea>
  				</div>
  				<div class="form-group">
    				<label for="form_date">Datum event (*):</label>
    				<input type="text" class="form-control" name="form_date" id="form_date" >
  				</div>
  				<div class="form-group">
    				<label for="form_time">Aanvang event (*):</label>
    				
    				<input type="text" class="form-control" name="form_time" id="form_time">
  				</div>
  				<label for="radio-btns">Formule:</label>
  				<div id="radio-btns">
  					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula1" value="1" checked>
    						VIP
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula2" value="2">
    						Deluxe
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula3" value="3">
    						Regular
  						</label>
					</div>
					<div class="radio-inline">
  						<label>
    						<input type="radio" name="optionsRadios" id="formula4" value="4">
    						Basic
  						</label>
					</div>
				</div>
  				<div class="checkbox CNtext">
    				<label>
      					<input name="form_confirm" id="form_confirm" type="checkbox"> Hierbij bevestig ik mijn bestelling en ga ik akkoord met de <a href="Legal.htm">algemene voorwaarden.</a>
    				</label>
  				</div>
  				<div class="checkbox CNtext">
  					<label>
  						<input name="form_info" id="form_info" type="checkbox">Mijn bestelling wordt pas definitief na bevestiging van uw reservatie.
  					</label>
  				</div>
  				<div id="fine-print">
					<ul>
						<li class="CNtext">(*) - verplichte velden</li>
					</ul>
				</div>
				<div id="btns">
					<button type="reset" class="btn btn-danger">Cancel</button>
  					<button type="submit" class="btn btn-default">Submit</button>
				</div>				  				
			</form>
		</div>
	</div>
	<div id="footer"><%@include file='footer.jsp'%></div>
	<!-- JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>
	<script type="text/javascript" src="resources/JqueryUI/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/scripts/localization/messages_nl.js"></script>
	<script type="text/javascript" src="resources/scripts/template.js"></script>
	<script type="text/javascript" src="resources/scripts/party-form.js"></script>
	<script type="text/javascript" src="resources/scripts/calendar.js"></script>	
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
