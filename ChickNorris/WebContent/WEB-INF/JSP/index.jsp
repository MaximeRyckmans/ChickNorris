<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chick Norris</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
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
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
      		<!-- Indicators -->
      		<ol class="carousel-indicators">
        		<li data-target="#myCarousel" data-slide-to="0" class=""></li>
        		<li data-target="#myCarousel" data-slide-to="1" class=""></li>
        		<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
      		</ol>
      		<div class="carousel-inner" role="listbox">
        		<div class="item">
          			<a href="Promotion.htm"><img src="resources/images/slideshow/TuinfeestPromotie.jpg" alt="First slide"></a>
          			<div class="container">
            			<div class="carousel-caption">
            			</div>
          			</div>
        		</div>
        		<div class="item">
          			<img src="resources/images/slideshow/shutterstock_13839560.jpg" alt="Second slide">
          			<div class="container">
            			<div class="carousel-caption">
            			</div>
          			</div>
        		</div>
        		<div class="item active">
          			<img src="resources/images/slideshow/shutterstock_184897821.jpg" alt="Third slide">
          			<div class="container">
            			<div class="carousel-caption">
            			</div>
          			</div>
        		</div>
      		</div>
      		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        		<span class="sr-only">Previous</span>
      		</a>
      		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        		<span class="sr-only">Next</span>
      		</a>
    	</div>
    	<div id="media-bar">
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
