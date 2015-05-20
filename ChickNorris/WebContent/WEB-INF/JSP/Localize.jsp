<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chick Norris - Localize</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
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
		<div id="map-canvas" class="col-md-6" style="height: 500px;"></div>
		<div id="map-addresses" class="col-md-6">
			<c:if test="${not empty listLocations}">
     			<c:forEach var="ob" varStatus="status" items="${listLocations}">
    				<div class="panel panel-default col-md-6">
						<div class="panel-heading">
        					<a class="panel-title" data-toggle="collapse" data-target="#${ob.ID}">${ob.region}</a>
    					</div>
    					<div id="${ob.ID}" class="panel-collapse collapse">
							<div class="panel-body">
								<ul>
									<li>${ob.locAddress}</li>
								</ul>						
							</div>
						</div>
					</div>
             	</c:forEach>
            </c:if>			
		</div>
	</div>
	<div id="footer"><%@include file='footer.jsp'%></div>
	
	<!-- JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	<script type="text/javascript" src="resources/scripts/template.js"></script>
	<script type="text/javascript" src="resources/scripts/Localize.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		var myList = [
  			<c:forEach var="item" items="${listLocations}" varStatus="loop">
    			"${item.longitude}", "${item.latitude}"
    			<c:if test="${!loop.last}">,</c:if>
  			</c:forEach>
		]
	</script>
</body>
</html>