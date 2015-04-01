/**
 * 
 */

var myList;

$(function(){
	startTemplate();
	$.ajax({
		  dataType: "json",
		  url: "Party-Form.htm",
		  data: dateList,
		  success: function(dateList){
			  myList = dateList;
		  }
		});
	activateCalendar();
});