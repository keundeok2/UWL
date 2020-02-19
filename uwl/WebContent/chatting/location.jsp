<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button id="getLocation" type="button">위치 정보 수집</button>
	<div id="map" style="width: 500px; height: 500px; display: block;"></div>
	<script>
		(function() {
			let map, infoWindow;
			window.initMap = function() {
				map = new google.maps.Map(document.getElementById('map'), {
					center : {
						lat : 37.4866821,
						lng : 127.0301894
					},
					zoom : 15
				});
				infoWindow = new google.maps.InfoWindow({
					map : map
				});
				infoWindow.setContent('Your location');
			};
			function successCallback(position) {
				let pos = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				infoWindow.setPosition(pos);
				map.setCenter(pos);
				alert("Your current position is: latitude(" + pos.lat
						+ "), longitude(" + pos.lng + ")");
			}
			function errorCallback(error) {
				alert("Error: " + error.message);
			}
			document.getElementById("getLocation").onclick = function() {
				navigator.geolocation.getCurrentPosition(successCallback,
						errorCallback);
			};
		}());
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap"
		async="" defer=""></script>

</body>
</html>