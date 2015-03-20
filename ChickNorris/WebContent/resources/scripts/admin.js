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