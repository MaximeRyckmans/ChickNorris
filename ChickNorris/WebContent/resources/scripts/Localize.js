/**
 * 
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
     codeAddresses(map);
}

function codeAddresses(map) {
	var count = 0;
	var longitude;
	var latitude;
	myList.forEach(function(entry){		
		if(count === 1) {
			count = 0;
			latitude = entry;
			
			var myLatlng = new google.maps.LatLng(latitude,longitude);
			var marker = new google.maps.Marker({
				position: myLatlng,
				map: map
			});
		}
		if(count === 0) {
			count = 1;
			longitude = entry;
		}			
	});
}

google.maps.event.addDomListener(window, 'load', initialize);