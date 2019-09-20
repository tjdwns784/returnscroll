<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Tmap</title>
        <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2"></script>
    	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    	 <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" >
    </head>
	
    <body>
    <!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	
	<p id="result" name="result" value=" " ></p>
	<hr>
	<form method='post' enctype='multipart/form-data'>
	
		출발 : <input type='text' name='start' readonly style="width : 50%;"><br>
		도착 : <input type='text' name='arrive' readonly style="width : 50%;"><br>
		<input type='button' value='경로찾기' onclick = "findRoot()"><br>
		<hr>
		현재위도 : <input type='text' name='lat' readonly style="width : 50%;"><br>
		 현재경도 : <input type='text' name='lon' readonly style="width : 50%;"><br>
		 현재주소 : <input type='text' name='address' style="width : 50%;"><br> 
		 <input type='button' value='내위치찾기' onclick = "findMyLocation()"><br>
		  <input type='button' value='내위치찾기 중지' onclick = "stopMyLocation()"><br>
		
	</form>
    <hr>
    	<div id="map_div"></div> 
    	  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Plugin JavaScript -->
		  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Custom scripts for this template -->
		  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
         <script>
         	var map;
         	var latitude, longitude;
			var lonlate, lonlate2, lonlat3;
			
			var gAppKey = '8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2';
			var markers, markers2;
			var centerLL, targetLL;
			var marker1, marker2;
		
			var flocation;
			
			var size = new Tmap.Size(24, 38);
     		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
     		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_s.png',size, offset);
         	
         	$(document).ready(function() {
        		initTmap();
        	});
         	
         	function setVariables(){    
         	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
         	}
         	
         	function initTmap(){
         		setVariables();
         		map = new Tmap.Map({
         			div:'map_div',
         			width : "100%",
         			height : "600px",
         		});
         		
         		navigator.geolocation.getCurrentPosition(function(pos) {
    				latitude = pos.coords.latitude;
    				longitude = pos.coords.longitude;
    	
             		map.setCenter(new Tmap.LonLat(longitude,latitude).transform("EPSG:4326", "EPSG:3857"), 15);
             		
  
             		lonlat = new Tmap.LonLat(longitude,latitude).transform("EPSG:4326", "EPSG:3857");
             		
             		//////////////리버스지오코딩///////////////////
             		var url = "https://apis.openapi.sk.com/tmap/geo/reversegeocoding"; //Reverse Geocoding api 요청 url입니다.
            		var params = {
            			"version" : "1"//버전 정보입니다.
            			,"coordType" : "EPSG3857"
            			,"lat" : lonlat.lat //위도 좌표입니다.
            			,"lon" : lonlat.lon //경도 좌표입니다.
            			,"appKey" : gAppKey//앱 키(appKey) 입니다.
            		}
            		$.get(url, params, function(data){
            			if(data){ 
	
            				var address1 = data.addressInfo;//Reverse Geocoding api 요청하여 받은 결과에서 주소정보를 추출합니다.
          					var addr = address1.fullAddress;
            				
                    		document.querySelector("[name=start]").value = addr;
                    		document.querySelector("[name=address]").value = addr;
                    		
                     		// 팝업 생성
                    		var popup;
                    		popup = new Tmap.Popup( );
                    		popup.autoSize=true;//popup 사이즈 자동 조절		                         
                    		popup.show(); // 팝업 보이기
                    	
                    		centerLL = lonlat;
                    		targetLL = lonlat;
                    		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정
                    		markers = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성
                    		map.addLayer(markers); // 지도에 Markers 객체 추가
                    		
                    		drawMarker(3,addr,1); // 마커 그리기
                    		////////////////////////////////
            			}else{
            				alert("검색결과가 없습니다.");
            			}
            		}); 
             	
            		lonlat2 = new Tmap.LonLat(longitude + 0.005,latitude + 0.005).transform("EPSG:4326", "EPSG:3857");
            	
            		var params2 = {
                			"version" : "1"//버전 정보입니다.
                			,"coordType" : "EPSG3857"
                			,"lat" : lonlat2.lat //위도 좌표입니다.
                			,"lon" : lonlat2.lon //경도 좌표입니다.
                			,"appKey" : gAppKey//앱 키(appKey) 입니다.
                		}
                		$.get(url, params2, function(data){
                			if(data){ 
                				
                				var address = data.addressInfo;//Reverse Geocoding api 요청하여 받은 결과에서 주소정보를 추출합니다.
                				var addr2 = address.fullAddress;
              
                         		document.querySelector("[name=arrive]").value = addr2;	

                         		// 팝업 생성
                        		var popup2;
                        		popup2 = new Tmap.Popup( );
                        		popup2.autoSize=true;//popup 사이즈 자동 조절		                         
                        		popup2.show(); // 팝업 보이기
                        	
                        		// 이미지 마커 커스텀 오버레이
                        	
                        		centerLL = lonlat2;
                        		targetLL = lonlat2;
                        		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정
                        		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성
                        		map.addLayer(markers2); // 지도에 Markers 객체 추가
                        		drawMarker(3,addr2,2); // 마커 그리기
                        		
                			}else{
                				alert("검색결과가 없습니다.");
                			}
                		}); 
             		
            		document.querySelector("[name=lat]").value = lonlat.lat;
             		document.querySelector("[name=lon]").value = lonlat.lon;
             		
             		map.events.register("click", map, onClick);
      

         		});
         	
         	} 
			function findMyLocation(){
     					
        		flocation = setInterval(function() {
        			
        			markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
        			map.addLayer(markerLayer);//map에 마커 레이어 추가
        			
        			longitude += 0.001;
        			latitude += 0.001;
        			   
        			lonlat3 = new Tmap.LonLat(longitude ,latitude ).transform("EPSG:4326", "EPSG:3857");//좌표 설정
        			/* var size = new Tmap.Size(24, 38);//아이콘 크기 설정
        			var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정 */
        			var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_g_m_m.png',size, offset);//마커 아이콘 설정
        			
        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
        			markerLayer.addMarker(marker);//레이어에 마커 추가
        			
        			console.log('내위치 확인')
        			console.log('지도에 마커 표시')
        			console.log('lonlat : ' + lonlat); 
        			
        		}, 3000);
         	}
			
			function stopMyLocation(){
					
        		clearInterval(flocation);
        		console.log("위치찾기 중지");
         	}
         	
         	function findRoot(){
     			
				var tData = new Tmap.TData();//REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
				
        		var s_lonLat =  new Tmap.LonLat(lonlat.lon , lonlat.lat).transform("EPSG:3857", "EPSG:4326");; //시작 좌표입니다.   
        		var e_lonLat = new Tmap.LonLat(lonlat2.lon , lonlat2.lat).transform("EPSG:3857", "EPSG:4326"); //도착 좌표입니다.
  
        		var optionObj = {
        				reqCoordType:"WGS84GEO", //요청 좌표계 옵셥 설정입니다.
        				resCoordType:"EPSG3857"  //응답 좌표계 옵셥 설정입니다.
                     }
        		

        		tData.getRoutePlan(s_lonLat, e_lonLat, optionObj);//경로 탐색 데이터를 콜백 함수를 통해 XML로 리턴합니다.
        		
        		tData.events.register("onComplete", tData, onComplete);//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트를 등록합니다.
        		tData.events.register("onProgress", tData, onProgress);//데이터 로드중에 발생하는 이벤트를 등록합니다.
        		tData.events.register("onError", tData, onError);//데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.
        		  	
         	}
         	
         
         	

         	//map을 클릭하는 경우 발생하는 함수입니다.
        	function onClick(e){
        		lonlat2 = map.getLonLatFromViewPortPx(e.xy); 
        		var url = "https://apis.openapi.sk.com/tmap/geo/reversegeocoding"; //Reverse Geocoding api 요청 url입니다.
        		var params = {
        			"version" : "1"//버전 정보입니다.
        			,"coordType" : "EPSG3857"
        			,"lat" : lonlat2.lat //위도 좌표입니다.
        			,"lon" : lonlat2.lon //경도 좌표입니다.
        			,"appKey" : gAppKey//앱 키(appKey) 입니다.
        		}
        		$.get(url, params, function(data){
        			if(data){ 
        				
        				markers2.removeMarker(marker2); //기존 마커를 삭제합니다.
        				
        				var address = data.addressInfo;//Reverse Geocoding api 요청하여 받은 결과에서 주소정보를 추출합니다.
        				var addr2 = address.fullAddress;
      
                 		document.querySelector("[name=arrive]").value = addr2;	

                 		// 팝업 생성
                		var popup2;
                		popup2 = new Tmap.Popup( );
                		popup2.autoSize=true;//popup 사이즈 자동 조절		                         
                		popup2.show(); // 팝업 보이기
                	
                		// 이미지 마커 커스텀 오버레이
                	
                		centerLL = lonlat2;
                		targetLL = lonlat2;
                		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정
                		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성
                		map.addLayer(markers2); // 지도에 Markers 객체 추가
                		drawMarker(3,addr2,2); // 마커 그리기

        			}else{
        				alert("검색결과가 없습니다.");
        			}
        			
        			
        		});
        	}
       
         	
         	
         	///////////////////////
         	
         	//map을 이동하는 경우 발생하는 함수입니다.
        	function onMoveEnd(){
        		var c_ll = map.getCenter(); //현재 지도의 center 좌표를 가져옵니다.
        		c_ll = new Tmap.LonLat(c_ll.lon, c_ll.lat).transform("EPSG:3857","EPSG:4326");//WGS84 좌표계로 변환
        		loadGetAddressFromLonLat(c_ll);//중심좌표를 주소로 변환하는 함수입니다.
        		 
        		//중심좌표를 주소로 변환하는 함수입니다. 
        		function loadGetAddressFromLonLat(ll) {
        			var tdata = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
        			tdata.events.register("onComplete", tdata,onCompleteLoadGetAddressFromLonLat);//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트입니다.
        			var optionObj = {
        				version : 1
        			};
        			tdata.getAddressFromLonLat(ll, optionObj);//좌표를 통한 주소 정보 데이터를 콜백 함수를 통해 XML로 리턴합니다.
        		}
        		//데이터 로드가 성공적으로 완료되면, 줌심 좌표를 주소로 변환한 결과를 출력하는 함수입니다.
        		function onCompleteLoadGetAddressFromLonLat() {
        			var result ='현재 지도의 중심 좌표주소 : '+jQuery(this.responseXML).find("fullAddress").text()+'';//출력될 결과 입니다.
        			var resultDiv = document.getElementById("result");//id가 결과를 출력할 result인 element를 찾습니다.
        			resultDiv.innerHTML = result;//결과를 htmㅣ에 출력
        		}
        	}
        	
         	
        	function onComplete(){
        		console.log(this.responseXML); //xml로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.
        			      
        		var kmlForm = new Tmap.Format.KML({extractStyles:true}).read(this.responseXML);
        		var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
        		vectorLayer.addFeatures(kmlForm);
        		map.addLayer(vectorLayer);
        		//경로 그리기 후 해당영역으로 줌  
        		map.zoomToExtent(vectorLayer.getDataExtent());
        	   }
        	//데이터 로드중 발생하는 이벤트 함수입니다.
        	function onProgress(){
        		//alert("onComplete");
        	}
        	//데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
        	function onError(){
        		alert("onError");
        	}
        	
        	
        	//////////////////////////////////
        	
			// 마커 그리기
			function drawMarker(type, addr,ca){
				
				var labelHtml = getMarkupData(addr); // 라벨 내용 지정
				var label = new Tmap.Label(labelHtml); // 라벨 생성
				label.popupStyle = type;
					if(ca == 1){
						marker1 = new Tmap.Markers(targetLL,icon, label); // 마커 생성
						markers.addMarker(marker1); // markers 에 마커 추가
						marker1.popup.show(); // 팝업 보이기
					}else if(ca == 2){
						icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_a.png",size,offset); // 마커 아이콘 지정
						marker2 = new Tmap.Markers(targetLL,icon, label); // 마커 생성
						markers2.addMarker(marker2); // markers 에 마커 추가
						marker2.popup.show(); // 팝업 보이기
					}	
				}
				
		
			// 라벨 컨텐츠 지정 함수
			function getMarkupData(addr){
				
				var txt = "<div style='font-size:.8em'>";
				txt += "<span class='whiteText'>"+ addr + "</span>";
				return txt;
			}
			////////////////////////////////////
         	
         	
         </script>
          <!-- Bootstrap core JavaScript -->

    <hr>   
    </body>
    
    <style>
	    	
	/* 거리표시 팝업*/
	.mPop{
	    border: 1px;
	    background-color: #FFF;
	    font-size: 12px;
	    border-color: #FF0000;
	    border-style: solid;
	    text-align: center;
	}
	/*공통사용 클래스*/
	.mPopStyle {
	    border: 1px;
	    background-color: #FFF;
	    font-size: 12px;
	    border-color: #FF0000;
	    border-style: solid;
	    text-align:left;
	}
		.blackText{
		color:black;
	}
    </style>
</html>	
