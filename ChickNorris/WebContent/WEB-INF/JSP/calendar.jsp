<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calendar</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/party-form.css"/>
</head>
<body>
	<div id="calendarWrap">
		<div id="calendarTop">
			<div id="calendarTitle">
				<a id="Previous" href="#"><span class="glyphicon glyphicon-chevron-left"></span></a>
				<div id="titleCalendar">
					<span id="currentMonth"></span>
					<span id="minus" class="glyphicon glyphicon-minus"></span>
					<span id="currentYear"></span>
				</div>
				<a id="Next" href="#"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		<div id="calendarBody">
			<div id="calendarDaysName">
				<ul>
					<li>ma.</li>
					<li>di.</li>
					<li>wo.</li>
					<li>do.</li>
					<li>vr.</li>
					<li>za.</li>
					<li id="sunday">zo.</li>
				</ul>
			</div>
			<div id="calendarDays">				
			</div>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/scripts/jquery.js"></script>	
	<script type="text/javascript" src="resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/scripts/calendar.js"></script>	
	<script type="text/javascript" src="resources/scripts/bootstrap/docs.min.js"></script>
	<script type="text/javascript" src="resources/scripts/bootstrap/ie10-viewport-bug-workaround.js"></script>
</body>
</html>