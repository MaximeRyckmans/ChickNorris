<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript">
	var myList = [
  		<c:forEach var="item" items="${dateList}" varStatus="loop">
    		"${item}"
    		<c:if test="${!loop.last}">,</c:if>
  		</c:forEach>
	]
</script>
</body>
</html>