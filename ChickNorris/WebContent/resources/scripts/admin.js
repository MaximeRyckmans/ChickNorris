$(function(){
	activateCalendar();
	calendar();
	tab();
});

/**
 * ****************************************************
 * 						tabs
 * ****************************************************
 */
function tab() { 
  //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    //save the latest tab; use cookies if you like 'em better:
    localStorage.setItem('lastTab', $(e.target).attr('id'));
  });

  //go to the latest tab, if it exists:
  var lastTab = localStorage.getItem('lastTab');
  if (lastTab) {
      $('#'+lastTab).tab('show');
  }
}

/**
 * ****************************************************
 * 						GEOLOCATION
 * ****************************************************
 */
var geocoder;
var map;

function initialize() {
	geocoder = new google.maps.Geocoder();
    var centerLatLng = new google.maps.LatLng(51.06471, 4.42586);

    var mapOptions = {
        center: centerLatLng,
        zoom: 8
    };
     map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
	var address = document.getElementById('address').value;
	geocoder.geocode({ 'address':address }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
        	var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            var latlng = new google.maps.LatLng(latitude, longitude);
            map.setCenter(latlng);
            var marker = new google.maps.Marker({
                map: map,
                position: latlng,
                draggable: true
            });
            
            document.getElementById("lat").value=latitude;
            document.getElementById("long").value=longitude;
            
            google.maps.event.addListener(marker, "drag", function(){
                document.getElementById("lat").value=marker.position.lat();
                document.getElementById("long").value=marker.position.lng();
            });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);

function deleteLocation(id) {

	var locationId = id;

	input_box = confirm("Ben je zeker dat je deze locatie wilt verwijderen?");
	if (input_box == true) {

		
	/*
	 * Remove comments from ajax below and fix url of the ajax call if needed.  
	 */	
	/*$.ajax({
	    url : 'Admin.htm?locationId='+locationId,
	    type : "POST",
	    async : false,
	    success : function() {
	        $("#" + locationId).remove();
	        alert('Record(s) Deleted');
	    }
	});*/

	    $('#' + rowid).remove();
	    alert('Record Deleted');
	} else {
	// Output when Cancel is clicked
	return false;
	}
}

function deleteAllLocations() {
	input_box = confirm("Ben je zeker dat je alle locaties wilt verwijderen?");
	if (input_box == true) {
		/*
		 * Remove comments from ajax below and fix url of the ajax call if needed.  
		 */	
		/*$.ajax({
	    url : 'Admin.htm,
	    type : "POST",
	    async : false,
	    success : function() {
	        $("#locationTable").empty();
	        alert('Record(s) Deleted');
	    }
	});*/
	} else {
		return false;
	}
}

/**
 * ****************************************************
 * 						Calendar
 * ****************************************************
 */

function calendar() {
    $("#calendarDate").datepicker();
};