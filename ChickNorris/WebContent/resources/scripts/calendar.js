/**
 * 
 */
var d = new Date();
var currentMonth = d.getMonth();
var currentYear = d.getFullYear();
var monthNames = ["Jan.", "Feb.", "Mrt.", "Apr.", "Mei", "Jun.","Jul.", "Aug.", "Sept.", "Okt.", "Nov.", "Dec."];
var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
var bookedDates = [];

function activateCalendar(){
	
	fillBookedDates(myList);
	
	Date.prototype.getMonthName = function() {
        return months[ this.getMonth() ];
    };
    Date.prototype.getDayName = function() {
        return days[ this.getDay() ];
    };
	
	$("#currentMonth").text(monthNames[currentMonth]);
	$("#currentYear").text(currentYear);
	$("#Next").click(function() {
		// Shows next month
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
		// Shows previous month
        var month;
        var year;
		if (currentMonth > 0) {
			month = currentMonth - 1;
			year = currentYear;
			d.setFullYear(year, month, 1);
			currentMonth = d.getMonth();
		} else if (currentMonth === 0) {
			month = 11;
			year = currentYear - 1;
			d.setFullYear(year, month, 1);
			currentMonth = d.getMonth();
			currentYear = d.getFullYear();
		}
		$("#currentMonth").text(monthNames[currentMonth]);
		$("#currentYear").text(currentYear);
		fillDays();
	});
	
	fillDays();
}

function fillDays() {
	var date = new Date();
	var month = currentMonth + 1;
	date.setFullYear(currentYear, month, 0);
	
	var daysInMonth = date.getDate();
	
	date.setFullYear(currentYear, currentMonth, 1);
	
	var day = date.getDayName();
	var comparableDay = date.getDay()+1;
	var comparableMonth = date.getMonth()+1;
	var comparableYear = date.getFullYear();
	
	var html;
	var weekStart = '<div id="week"><ul>';
	var weekEnd = '</ul></div>';
	var grayedOut = '<li></li>';
	
	var j = false;
	
	for (var i = 1; i <= daysInMonth; i++) {
		j = false;
		for (var d in bookedDates){
			if(comparableDay === d.getDay() && comparableMonth === d.getMonth() && comparableYear === d.getFullYear()) {
				j = true;
				if(i === 1 && day === days[1]){
					// booked and 1st of the month on monday.
					html = weekstart + '<li class="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[2]){
					// booked and 1st of the month on tuesday
					html = weekStart + grayedOut + '<li clas="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[3]){
					// booked and 1st of the month on wednesday
					html = weekStart + grayedOut + grayedOut + '<li clas="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[4]){
					// booked and 1st of the month on thursday
					html = weekStart + grayedOut + grayedOut + grayedOut +'<li class="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[5]){
					// booked and 1st of the month on friday
					html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + '<li class="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[6]){
					// booked and 1st of the month on saturday
					html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + '<li class="booked"><span>1</span></li>';
				} else if(i === 1 && day === days[0]){
					// booked and 1st of the month on sunday
					html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut +'<li clas="booked"><span>1</span></li>' + weekEnd;
				} else if (day === days[1]){
					// booked and day is a monday
					html += weekStart + '<li class="booked"><span>' + i + '</span></li>';
				} else if (day === days[0]){
					// booked and day is a sunday
					html += '<li class="booked"><span>' + i + '</span></li>' + weekEnd;
				} else {
					// booked and any other day
					html += '<li class="booked"><span>' + i + '</span></li>';
				}
			}
		}
		if(!j) {
			if(i === 1 && day === days[1]){
				// 1st of the month on monday
				html = weekStart + '<li><span>1</span></li>';
			}  else if(i === 1 && day === days[2]){
				// 1st of the month on tuesday
				html = weekStart + grayedOut + '<li><span>1</span></li>';
			}else if(i === 1 && day === days[3]){
				// 1st of the month on wednesday
				html = weekStart + grayedOut + grayedOut + '<li><span>1</span></li>';
			} else if(i === 1 && day === days[4]){
				// 1st of the month on thursday
				html = weekStart + grayedOut + grayedOut + grayedOut +'<li><span>1</span></li>';
			} else if(i === 1 && day === days[5]){
				// 1st of the month on friday
				html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + '<li><span>1</span></li>';
			} else if(i === 1 && day === days[6]){
				// 1st of the month on saturday
				html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + '<li><span>1</span></li>';
			} else if(i === 1 && day === days[0]){
				// 1st of the month on sunday
				html = weekStart + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut + grayedOut +'<li><span>1</span></li>' + weekEnd;
			} else if (day === days[1]){
				// day is a monday
				html += weekStart + '<li><span>' + i + '</span></li>';
			} else if (day === days[0]){
				// day is a sunday
				html += '<li><span>' + i + '</span></li>' + weekEnd;
			} else {
				// any other day
				html += '<li><span>' + i + '</span></li>';
			}
		}
		
		date.setFullYear(currentYear, currentMonth, i + 1);
		day = date.getDayName();
		comparableDay = date.getDay();
		comparableMonth = date.getMonth();
		comparableYear = date.getFullYear();
	}
	
	html += weekEnd;
	
	document.getElementById("calendarDays").innerHTML = html;
}

function fillBookedDates(myList) {
	var year;
	var month;
	var day;
	var bookedDate;
	
	if (myList !== null) {
		for (var date in myList) {
			year = date.slice(0,4);
			month = date.slice(5,7);
			day = date.slice(8,10);
			
			bookedDate = new Date(year, month, day);
			bookedDates.push(bookedDate);
		}
	}	
	
}