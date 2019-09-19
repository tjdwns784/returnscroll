<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2"></script>
    	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    </head>
    
    <body>
    	<div id="map_div"></div> 
         <script>
         	$(document).ready(function() {
        		initTmap();
        	});
         	
         	function setVariables(){    
         	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
         	}

         	function initTmap(){
         		setVariables();
         		var map = new Tmap.Map({
         			div:'map_div',
         			width : "934px",
         			height : "452px",
         		});
         		map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
         		
         		markerLayer = new Tmap.Layer.Markers();
         		map.addLayer(markerLayer);
         		   
         		var lonlat = new Tmap.LonLat( 126.984895 , 37.566369).transform("EPSG:4326", "EPSG:3857");
         		var size = new Tmap.Size(24, 38);
         		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
         		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);
         		
         		marker = new Tmap.Marker(lonlat, icon);
         		markerLayer.addMarker(marker);
         	} 
         	
         	
         </script>
                
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
    </style>
</html>	
