/**
 * 
 */

var myList;

$(function(){
	$.get('Part-Form.htm', function(dateList) {
		myList = dateList;
	});
	activateCalendar();
});