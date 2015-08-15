<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chick Norris - About Us</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/general.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/about.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/media-queries.css"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Indie+Flower"/>
<link rel="shortcut icon" href="resources/images/logo.ico">
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
</head>
<body>
	<div id="header"><%@include file='header.jsp'%></div>
	<div id="content">
		<div class="title-page">
			<h2>Welkom bij Chick Norris “Kip Aan ’t Spit”</h2>
		</div>
		<div class="col-xs-0 col-md-3"></div>
		<div class="text-center col-xs-12 col-md-6 CNtext">
			<p id="first-paragraph"> 
				Chick Norris “Kip Aan ’t Spit”, actief sinds 2014, bestaat uit een jong en dynamisch team, met foodtrucks verspreid over het ganse land.
				Hierdoor is onze Chick Norris Foodtruck steeds bij u in de buurt.
			</p>

			<p>
				Naast onze vaste standplaatsen verzorgen wij tevens de catering van uw evenement, prive- en bedrijfsfeest aan zeer democratische prijzen.
			</p>

			<p>
				Heeft U na het doornemen van onze website nog vragen, aarzel dan niet ons te contacteren.
			</p>
			<p>
				Wenst u kans te maken op een GRATIS tuinfeest, klik dan <a href="Promotion.htm">HIER</a>.
			</p>
			<p>
				Tot binnenkort!
			</p>
		</div>
		<div id="media-bar" class="col-xs-12">
			<div id="media-bar-left" class="col-xs-5">
				<p>Mis nooit een lekkere deal!</p>
				<a class="btn btn-default btn-media" href="#" data-toggle="modal" data-target="#subscribeModal">Email Updates</a>
			</div>
			<div class="col-xs-2">
				<div id="media-bar-seperator"></div>
			</div>
			<div id="media-bar-right" class="col-xs-5">
				<p>Volg je smaakpapillen!</p>
				<div id="social-links">
					<a href="https://www.facebook.com/heerlijkekip?pnref=lhc" target="_blank"><div id="facebook"></div></a>
					<!-- <a href="#"><div id="twitter"></div></a> -->
				</div>
			</div>
		</div>
	</div>
	<div id="footer"><%@include file='footer.jsp'%></div>
	<!-- JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/scripts/template.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>