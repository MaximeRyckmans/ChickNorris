<%--
  Created by IntelliJ IDEA.
  User: Davy
  Date: 8/15/2015
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <link rel="stylesheet" type="text/css" href="resources/css/promotion.css"/>
  <link rel="stylesheet" type="text/css" href="resources/css/index.css"/>
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
    <h2>Win een Tuinfeestje van Chick Norris “Kip Aan ’t Spit”</h2>
  </div>
  <div id="private-wrapper" class="col-xs-12 col-md-6">
    <img class="image col-xs-12" alt="" src="./resources/images/slideshow/Partyservice.jpg">
  </div>
  <div class="col-xs-12 col-md-6 CNtext">
    <h3>
      Op deze manier kan U deelnemen aan onze wedstrijd en kans maken op een GRATIS tuinfeest (*)
    </h3>

    <ul class="list">
      <li>Like onze facebookpagina</li>
      <li>Noteer U naam en telefoonnummer op uw volle CN-spaarkaart</li>
      <li>Deponeer uw Spaarkaart in de CN-Partybox</li>
      </li>
    </ul>

    <p>
      Om het kwartaal zal een onschuldige hand een winnaar trekken en zullen wij deze telefonisch contacteren om de nodige afspraken te maken.
    </p>

    <p id="fine-print">
      (*) Indien U de gelukkige winnaar bent van onze permanente wedstrijd zal CN U contacteren om een datum te prikken. Deze zal enkel op een zondag mogelijk zijn.
      CN zal een menu voor 50 personen voorzien, zijnde het “CN-Deluxe menu” vermeld op onze website bij catering.
      Drank, meubilair en locatie wordt niet door ons voorzien.
      Tijdens het tuinfeest zal CN een fotoreportage maken dewelke nadien op de website en facebook pagina zal gepubliceerd worden.
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