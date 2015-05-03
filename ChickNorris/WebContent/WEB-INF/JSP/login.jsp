<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/login.css"/>
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
<form role="form" action="Login.htm" method="post" >
	<div id="loginPanel" class="panel panel-default col-xs-12 col-md-3">
		<div class="panel-heading">
			<p id="title">Log In</p>
    	</div>
    	<div class="panel">
			<div class="panel-body">
				<div class="form-group">
    				<label for="form_name">Naam (*) :</label>
    				<input type="text" class="form-control" name="username" id="form_name" placeholder="Vul je naam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firstname">Paswoord:</label>
    				<input type="text" class="form-control" name="password"  id="form_firstname" placeholder="Vul je paswoord in.">
  				</div>
  				<div id="btns">
  					<a href="Home.htm" class="btn btn-danger">Cancel</a>
  					<button type="submit" class="btn btn-default">Submit</button>
  				</div>				
  				<h1>${error}</h1>							
			</div>
		</div>
	</div>
</form>
<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="resources/scripts/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>