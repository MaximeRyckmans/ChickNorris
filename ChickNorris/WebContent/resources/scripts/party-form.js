/**
 * 
 */
var d = new Date();
var currentMonth = d.getMonth();
var currentYear = d.getFullYear();

$(function(){
	var monthNames = ["Jan.", "Feb.", "Mrt.", "Apr.", "Mei", "Jun.",
	                  "Jul.", "Aug.", "Sept.", "Okt.", "Nov.", "Dec."
	                ];
	
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
	});

	$("#Previous").click(function() {
		if (currentMonth > 0) {
			currentMonth - 1;
		} else if (currentMonth === 0) {
			currentMonth = 11;
			currentYear - 1;
		}
		$("#currentMonth").text(monthNames[currentMonth]);
		$("#currentYear").text(currentYear);
	});
});