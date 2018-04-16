function myMap() {
	var mapOptions = {
	    center: new google.maps.LatLng(9.94, -84.08),
	    zoom: 11,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById("map"), mapOptions);

	var coord = [{lat: 9.99, lng: -84.22},{lat: 9.88, lng: -84.15},{lat: 9.93, lng: -84.03}];

	coord.forEach(function(value) 
	{
		var marker = new google.maps.Marker(
		{
			position: value,
			map: map
		});
	}
)}