<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Stylish Portfolio - Start Bootstrap Template</title>

  <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <a class="menu-toggle rounded">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar-wrapper" >
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a class="js-scroll-trigger" href="#page-top">Start Bootstrap</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="/returnscroll/">Home</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="/returnscroll/map">Map</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="/returnscroll/chat">Chat</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="/returnscroll/mypage">MyPage</a>
      </li>
    </ul>
  </nav>

  <p id="location"></p>
<form method='post' enctype='multipart/form-data'>

	출발 : <input type='text' name='start' readonly><br>
	도착 : <input type='text' name='arrive' readonly><br>
	<input type='button' value='카카오맵으로길찾기' onclick="location.href='https://map.kakao.com/link/to/이마트 트레이더스 서면점,35.164146, 129.052588'"><br>
	<hr>
	친구위도 : <input type='text' name='lat' readonly><br>
	 친구경도 : <input type='text' name='lng' readonly><br>
	 친구주소 : <input type='text' name='address'><br> 
	<input type='button' value='친구위치찾기'><br>
	
</form>
<hr>
<div id="map" style="width: 100%; height: 600px;"></div>


<!-- <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> -->

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
				
				
				////////////////////////////////
				
				var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
			    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
			    startOption = { 
			        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			    };

			// 출발 마커 이미지를 생성합니다
			var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

			var startDragSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
			    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
			    startDragOption = { 
			        offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			    };

			// 출발 마커의 드래그 이미지를 생성합니다
			var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

			// 출발 마커가 표시될 위치입니다 
			var startPosition = new kakao.maps.LatLng(latitude, longitude); 

			// 출발 마커를 생성합니다
			var startMarker = new kakao.maps.Marker({
			    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
			    position: startPosition,
			    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
			    image: startImage // 출발 마커이미지를 설정합니다
			});

			// 출발 마커에 dragstart 이벤트를 등록합니다
			kakao.maps.event.addListener(startMarker, 'dragstart', function() {
			    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
			    startMarker.setImage(startDragImage);
			});

			// 출발 마커에 dragend 이벤트를 등록합니다
			kakao.maps.event.addListener(startMarker, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			    startMarker.setImage(startImage);
			     
			    var slatlng = startMarker.getPosition();
			    var slat = slatlng.getLat();
			    var slng = slatlng.getLng();
			    /* console.log("lat: " + slat);
			    console.log("lng: " + slng); */
			   
			    var geocoder = new kakao.maps.services.Geocoder();

			    var coord = new kakao.maps.LatLng(slat, slng);
			    var callback = function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            //console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
			            var startadd = result[0].address.address_name;
			            document.querySelector("[name=start]").value = startadd;
			            
			        }
			    };
			
			    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			   
			});
			
			var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
			arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
			arriveOption = { 
			    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			};

			// 도착 마커 이미지를 생성합니다
			var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

			var arriveDragSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
			    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
			    arriveDragOption = { 
			        offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			    };
			 
			// 도착 마커의 드래그 이미지를 생성합니다
			var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

			// 도착 마커가 표시될 위치입니다 
			/* var arrivePosition = new kakao.maps.LatLng(latitude+0.000001, longitude+0.000001); */ 
			var arrivePosition = new kakao.maps.LatLng(latitude+0.005, longitude+0.005); 
			 
			// 도착 마커를 생성합니다 
			var arriveMarker = new kakao.maps.Marker({  
			    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
			    position: arrivePosition,
			    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
			    image: arriveImage // 도착 마커이미지를 설정합니다
			});

			// 도착 마커에 dragstart 이벤트를 등록합니다
			kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
			    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
			    arriveMarker.setImage(arriveDragImage);
			});

			// 도착 마커에 dragend 이벤트를 등록합니다
			kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
			     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			    arriveMarker.setImage(arriveImage);  
			     
			    var alatlng = arriveMarker.getPosition();
			    var alat = alatlng.getLat();
			    var alng = alatlng.getLng();
			  /*   console.log("alat: " + alat);
			    console.log("alng: " + alng); */
			   
			    var geocoder = new kakao.maps.services.Geocoder();

			    var coord = new kakao.maps.LatLng(alat, alng);
			    var callback = function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			           // console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
			            var arriveadd = result[0].address.address_name;
			            document.querySelector("[name=arrive]").value = arriveadd;
			            
			        }
			    };
			
			    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			});
				

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
									
			
									geocoder.coord2Address(latlng.getLng(),latlng.getLat(),function(result, status) {
														if (status === kakao.maps.services.Status.OK) {
															var detailAddr = !!result[0].road_address ? result[0].road_address.address_name
																	: result[0].address.address_name;

															document.querySelector("[name=address]").value = detailAddr;
														}
													});
								});
				
			});
	
	
	

</script>
<hr>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

</body>

</html>
