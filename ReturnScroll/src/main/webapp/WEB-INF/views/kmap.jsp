<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<p id="location"></p>
<form method='post' enctype='multipart/form-data'>

	위도 : <input type='text' name='lat' readonly><br> 경도 : <input
		type='text' name='lng' readonly><br> 주소 : <input
		type='text' name='address'><br> <input type='submit'
		value='등록'>
</form>
<hr>
<div id="map" style="width: 500px; height: 400px;"></div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- TODO. 카카오 지도 라이브러리 등록 -->
<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47f2e37602a10262b1d9d77666a749b6&libraries=services"></script> -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07071fe4175a85df2056b61b48dd8752&libraries=services"></script>
<script>
	// TODO 현재 위도 경도 가져오기

	// TODO 현재 위치를 기준으로 지도 표시

	// TODO 클릭된 위치의 주소와 위도/경도 확인

	navigator.geolocation
			.getCurrentPosition(function(pos) {
				var latitude = pos.coords.latitude;
				var longitude = pos.coords.longitude;

				// 		var latitude = 35.173117399999995;
				// 		var longitude = 129.060646;

				document.querySelector("#location").textContent = "현재 위치는 : 위도 - "
						+ latitude + ", 경도 - " + longitude;

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({
					// 지도 중심좌표에 마커를 생성합니다 
					position : map.getCenter(),
					draggable: true
				});
				// 지도에 마커를 표시합니다
				marker.setMap(map);

				/////////////////////////
				var imageSrc = 'resources/img/mapmarker2.png', // 마커이미지의 주소입니다    
				imageSize = new kakao.maps.Size(60,60), // 마커이미지의 크기입니다
				imageOption = {
					offset : new kakao.maps.Point(27, 69)
				}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize, imageOption), markerPosition = new kakao.maps.LatLng(
								latitude, longitude); // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				var marker2 = new kakao.maps.Marker({
					position : markerPosition,
					image : markerImage,
					draggable: true
				// 마커이미지 설정 
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker2.setMap(map);
				
				var iwContent = '<div style="padding:5px;">예디공듀!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(latitude,longitude); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker2); 

				//////////////////////////////////

				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(
								map,'click',function(mouseEvent) {

									// 클릭한 위도, 경도 정보를 가져옵니다 
									var latlng = mouseEvent.latLng;

									// 마커 위치를 클릭한 위치로 옮깁니다
									marker2.setPosition(latlng);
									
									iwPosition = kakao.maps.LatLng(latitude,longitude); //인포윈도우 표시 위치입니다

									// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
									infowindow.open(map, marker2); 

									document.querySelector("[name=lat]").value = latlng
											.getLat();
									document.querySelector("[name=lng]").value = latlng
											.getLng();

									// 위도,경도 => 주소 변환
									var geocoder = new kakao.maps.services.Geocoder();

									geocoder
											.coord2Address(
													latlng.getLng(),
													latlng.getLat(),
													function(result, status) {
														if (status === kakao.maps.services.Status.OK) {
															var detailAddr = !!result[0].road_address ? result[0].road_address.address_name
																	: result[0].address.address_name;

															document
																	.querySelector("[name=address]").value = detailAddr;
														}
													});

								});

			});
</script>











