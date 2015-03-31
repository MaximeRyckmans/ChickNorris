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
}

function codeAddresses() {
	
}

google.maps.event.addDomListener(window, 'load', initialize);