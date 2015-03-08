/**
 * 
 */
var d = new Date();
var currentMonth = d.getMonth();
var currentYear = d.getFullYear();
var monthNames = ["Jan.", "Feb.", "Mrt.", "Apr.", "Mei", "Jun.","Jul.", "Aug.", "Sept.", "Okt.", "Nov.", "Dec."];
var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];

$(function(){
	
	Date.prototype.getMonthName = function() {
        return months[ this.getMonth() ];
    };
    Date.prototype.getDayName = function() {
        return days[ this.getDay() ];
    };
	
	$("#currentMonth").text(monthNames[currentMonth]);
	$("#currentYear").text(currentYear);
	$("#Next").click(function() {
		if (currentMonth < 11) {
			currentMonth++;
		} else if (currentMonth === 11){
			currentMonth = 0;
			currentYear++;
		}
		$("#currentMonth").text(monthNames[currentMonth]);
		$("#currentYear").text(currentYear);
		fillDays();
	});

	$("#Previous").click(function() {
		if (currentMonth > 0) {
			var month = currentMonth - 1;
			var year = currentYear;
			d.setFullYear(year, month, 1)
			currentMonth = d.getMonth();
		} else if (currentMonth === 0) {
			var month = 11;
			var year = currentYear - 1;
			d.setFullYear(year, month, 1)
			currentMonth = d.getMonth();
			currentYear = d.getFullYear();
		}
		$("#currentMonth").text(monthNames[currentMonth]);
		$("#currentYear").text(currentYear);
		fillDays();
	});
	
	fillDays();
});

function fillDays() {
	var date = new Date();
	var month = currentMonth + 1;
	date.setFullYear(currentYear, month, 0);
	
	var daysInMonth = date.getDate();
	
	date.setFullYear(currentYear, currentMonth, 1);
	
	var day = date.getDayName();
	
	var html;
	var weekStart = '<div id="week"><ul>';
	var weekEnd = '</ul></div>';
	var grayedOut = '<li></li>';
	
	for (var i = 1; i <= daysInMonth; i++) {
		if(i === 1 && day === days[1]){
			html = weekStart + '<li><span>1</span></li>'
		} else if(i === 1 && day === days[2]){
			html = weekStart + grayedOut + '<li><span>1</span></li>';
		}else if(i === 1 && day === days[3]){
			html = weekStart + grayedOut + grayedOut + '<li><span>1</span></li>';
		} else if(i === 1 && day === days[4]){
			html = weekStart + grayedOut + grayedOut + grayedOut +'<li><span>1</span></li>';
		} else if(i === 1 && day === days[5]){
			html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + '<li><span>1</span></li>';
		} else if(i === 1 && day === days[6]){
			html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + '<li><span>1</span></li>';
		} else if(i === 1 && day === days[0]){
			html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut +'<li><span>1</span></li>' + weekEnd;
		} else if (day === days[1]){
			html += weekStart + '<li><span>' + i + '</span></li>';
		} else if (day === days[0]){
			html += '<li><span>' + i + '</span></li>' + weekEnd;
		} else {
			html += '<li><span>' + i + '</span></li>';
		}	
		
		date.setFullYear(currentYear, currentMonth, i + 1);
		day = date.getDayName();
	}
	
	html += weekEnd;
	
	document.getElementById("calendarDays").innerHTML = html;
}