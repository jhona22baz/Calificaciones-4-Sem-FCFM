var map, gentetype;

function initializeMap() {
	
	var latlng = new google.maps.LatLng(25.724940, -100.394975);
	var myOptions = {
		zoom: 14,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		streetViewControl: true,
		mapTypeControlOptions: {
      		mapTypeIds: ['gentetypeid', google.maps.MapTypeId.SATELLITE, google.maps.MapTypeId.HYBRID]
    	}
	};
	map = new google.maps.Map(document.getElementById("map"), myOptions);
	var marker = new google.maps.Marker({
		position: latlng, 
		map: map
	});
	/*
	var infowindow = new google.maps.InfoWindow({ 
		content: "<div id='burbuja'><div id='mapaheader'><div id='mapaimg'><img src='imagenes/genteoficina.png' /></div><div><img src='imagenes/logogentemap.png' /></div></div>Av. Rómulo Garza # 113 esquina con Conductores, Col. Tacuba. San Nicolás de los Garza, Nuevo León. C.P. 66470. Frente al hospital Zanitas<br /><br />Teléfonos: 81-41-05-91 y 83-94-18-07</div>",
		maxWidth: 300
	});
	*/
	//infowindow.open(map,marker);
	var markerOpen = false;
	panorama = map.getStreetView();	
	panorama.setOptions({
		addressControl: false
	});
	/*
	panorama.setOptions({
		addressControlOptions: {
		style: {
			"fontWeight" : "bold",
			"backgroundColor" : "#74BF43",
			"fontSize" : "14px"
			}
		}
	});*/
	
	var stylez = [
		{
		  featureType: "road",
		  elementType: "geometry",
		  stylers: [
			{hue: "#2655A6"},
			{saturation:0}
			]
		},
    	{
      		featureType: "landscape",
		  	elementType: "geometry",
		  	stylers: [
				{hue: "#74BF43"},
				{saturation: 100},
				{lightness: -10}
				]
		},
		{
      		featureType: "transit",
		  	elementType: "geometry",
		  	stylers: [
				{hue: "#2655A6"},
				{saturation: 100},
				{lightness: 0}
				]
		},
		{
      		featureType: "all",
		  	elementType: "labels",
		  	stylers: [
				{hue: "#74BF43"},
				{saturation: 100},
				{lightness: 0}
				]
		}
	];
	var styledMapOptions = {
		map: map,
		name: "Mapa"
	};
	gentetype =  new google.maps.StyledMapType(stylez,styledMapOptions);
    
	map.mapTypes.set('gentetypeid', gentetype);
	map.setMapTypeId('gentetypeid');
  
  
	google.maps.event.addListener(marker, 'click', function() {
		if (markerOpen) infowindow.close(map,marker);
		else infowindow.open(map,marker);
		markerOpen = !markerOpen;
  	});


 }
 