<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
 <%--  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" > --%>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
  
  <style>
    @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css); 
  	body, table, div, p ,h1,button, td,option{font-family:'Nanum Gothic';} 

        table {
            width: 100%;
            border-spacing: 0;
            border-collapse: collapse;
        }
        
        a {
            color: inherit;
            text-decoration: none;
        }
        
        ul,
        ol {
            list-style: none;
        }
        
        .blind {
            position: absolute;
            overflow: hidden;
            clip: rect(0px, 0px, 0px, 0px);
            margin: 10px;
            width: 1px;
            height: 1px;
        }
              

        /*  button */
    input[type=button]{
	  background:#000000;
	  color:#fff;
	  border:none;
	  height:40px;
	  font-size:1em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	input[type=button]:hover{
	  background:#fff;
	  color:#000000;
	}
	input[type=button]:before,input[type=button]:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #000000;
	  transition:400ms ease all;
	}
	input[type=button]:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	input[type=button]:hover:before,input[type=button]:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
        
        /* -------TOP------- */
        
        #divtop {
            position: relative;
            background: #ff7a00;
            height: 45px;
            text-align: center;
        }
        
        #divtop h3 {
            width: 200px;
            height: 45px;
            line-height: 45px;
            margin: 0 auto;
        }
        
        #divtop .top_tit {
            font-size: 18px;
            font-weight: 400;
            position: relative;
            color: #fff;
        }
        /* -------CONTENT------- */
        
        #divSearch {
            padding: 15px 20px;
            /*background: beige;*/
        }
        
        #divSearch p {
            font-size: 14px;
            margin-top: 8px;
            margin-left: 15px;
            color: #333;
        }
        
        #divSearch p b {
            color: #ff7a00;
        }
        
        #divSearch .search_box {
            border-bottom: 2px solid #ff7a00;
            padding: 0 15px;
        }
        
        #divSearch .search_box .inputGrp {
            overflow: hidden;
        }
        
        .inputGrp .btn_sch {
            background: transparent;
            border: 0;
            float: right;
            height: 44px;
            line-height: 44px;
            outline: 0;
            position: relative;
        }
        
        .inputGrp .btn_sch .ico_sch {
            display: inline-block;
            width: 24px;
            height: 24px;
            line-height: 24px;
            position: relative;
            cursor: pointer;
            vertical-align: middle;
        }
        
        .inputGrp .btn_sch .ico_sch:before,
        .inputGrp .btn_sch .ico_sch:after {
            content: '';
            display: block;
            position: absolute;
            top: 0;
            left: 0;
        }
        
        .inputGrp .btn_sch .ico_sch:before {
            width: 13px;
            height: 13px;
            border: 2px solid #ff7a00;
            border-radius: 100%;
            -webkit-border-radius: 100%;
            -moz-border-radius: 100%;
        }
        
        .inputGrp .btn_sch .ico_sch:after {
            width: 2px;
            height: 10px;
            background: #ff7a00;
            transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            top: 12px;
            left: 16px;
        }
        
        .inputGrp .input_sch {
            height: 44px;
            background: #fff;
            padding: 5px 9px 0 0px;
            overflow: hidden;
        }
        
        .inputGrp .input_sch input {
            border: none;
            padding: 0px;
            margin: 0px;
            width: 100%;
            height: 100%;
            outline: none;
            font-size: 17px;
        }
        
        #divSearchlist {
            background: #f4f4f4;
            padding: 20px;
            clear: both;
        }
        #divSearchlist .result {
            margin-bottom: 8px;
        }
        #divSearchlist .tb_wrap {
            height: 400px;
            overflow-y: auto;
        }
        
        #divSearchlist table {
            border-top: 1px solid #dbdbdb;
            border-bottom: 1px solid #dbdbdb;
        }
        
        #divSearchlist table thead * {
            height: 0ox;
            line-height: 0px;
            text-indent: -9999px;
            font-size: 0;
            color: #fff;
        }
        
        #divSearchlist table tbody td {
            background: #fff;
            padding: 10px 15px;
            border-bottom: 1px solid #dbdbdb;
        }
        
        ul.tb1 {
            display: table;
            width: 100%;
        }
        
        ul.tb1>li.row {
            display: table-row !important;
        }
        
        ul.tb1>li.row div:nth-child(2) {
            padding-bottom: 7px;
        }
        
        ul.tb1>li.row>div.th {
            display: table-cell;
            width: 70px;
        }
        
        ul.tb1>li.row span.label {
            display: inline-block;
            width: 60px;
            text-align: center;
            color: #fff;
            padding: 2px 5px;
            font-size: 13px;
            font-weight: 600;
        }
        
        ul.tb1>li.row span.st {
            background: #8faae4;
        }
        
        ul.tb1>li.row span.num {
            background: #b5bbd1;
        }
        
        ul.tb1>li.row .post {
            color: #ff2121;
            font-size: 18px;
        }
        
        /* Page navigation */
        #pageZone {
            padding: 5px 0;
            text-align: center;
        }
        
        .btn_pageNum {
            width: 35px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            background-color: #f9f9f9;
            border: 1px solid #eeeeee;
            display: inline-block;
            color: inherit;
            font-size: 12px;
        }
        
        .btn_pageNum_active {
            background-color: #fce1d8;
        }
        
        .btn_pageNum:hover {
            background-color: #fef1ec;
        }
        
        .btn_pageNum:active {
            background-color: #fce1d8;
        }
        
            	
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
	  #selectArrive:hover {
      background-color: #FFFF99;
    }
    
    #map_div{
			width:100%;
			height:750px;
	}
	#map_btn{
		width:95%;
		margin-left:2.5%;
		
	}
	    
    @media (max-width:600px){
		#map_div{
			width:100%;
			height:550px;
		}
	
		
		input[type=button]{
		  height:30px;
		  font-size:0.9em;
		  padding:0 1em;
		  transition:800ms ease all;
		  outline:none;
		}
		
		#h1_title{
			font-size:2rem;
		}
		
		.modal-content{
			margin-top : 70px;
		}
		
		#map_btn{
			margin-left:9.5%;
		
		}
		
	}
  
       
</style>
	
 </head>
 <body id="page-top">
    <!-- Navigation -->
    <jsp:include page="side.jsp"></jsp:include>
    	  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		  <!-- Plugin JavaScript -->
		  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		  <!-- Custom scripts for this template -->
		  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
    
	<!-- <p id="result" name="result" value=" " ></p> -->
	<div id="body">
	<h1 id="h1_title" style="margin-left:2.5%;margin-top:2%;">Map</h1>
	<hr style="width:95%; background:#FFCC33; height:2px; margin-left:2.5%;" >
	
	<div style="width:100%;">
		<form method='post' enctype='multipart/form-data' style="margin-left: 2.5%;">
		<div style="width:100%; max-width:100%; height:auto; margin-bottom: 1%;">
			출발 : <input type='text' name='start' readonly style="width : 90%; margin-bottom:10px;"><br>
			도착 : <input type='text' name='arrive' readonly style="width : 90%;">
		</div>
		<div id="map_btn" >
			<input type="button"  value='주소검색' data-toggle="modal" data-target="#findAddr">
			<input type='button' id='f_btn' value='경로찾기' onclick = "findRoot()" >
			<input type='button' id='r_btn' value='경로취소' onclick = "removeRoot()" style="/* visibility:hidden; */ display:none;" >
			 <input type='button' id='fl_btn' value='친구찾기' onclick = "findMyLocation()">
			  <input type='button' id='sl_btn' value='친구찾기 중지' onclick = "stopMyLocation()" style="/* visibility:hidden; */ display:none;"><br> 
			  
			
		</div>
		</form>
	</div>
<hr style="margin-left:2.5%; width:95%; background:#FFCC33; height:2px" >

 <!-- 지도 -->
<div id="map_div"></div> 
  <br><br>


<!-- Modal -->
<div class="modal fade" id="findAddr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
       </div>
        <!--주소검색  --> 
     <div class="modal-body">
        <div class="mainDiv">
        
			<input type="hidden" id="inpPage" type="text" value="1">
			<input type="hidden" id="inpTotLimit" type="text" value="7">
		    <div id="divtop">
            <h3>
                <span class="ico_sch"></span>
                <span class="top_tit">주소 검색</span>
            </h3>
        </div>
        <div id="divcont">
            <div id="divSearch">
                    <fieldset class="search_box">
                        <legend class="blind">검색어 입력창</legend>
                        <div class="inputGrp">
                            <button class="btn_sch" name="btn_sch" id="inpSearch">
                                <span class="ico_sch"></span>
                            </button>
                            <div class="input_sch">
                                <input type="text" id="inpKeyword" title="검색" placeholder="예) 을지로 65, 을지로2가 11">
                            </div>
                        </div>
                    </fieldset>
                <p>* 검색창에 찾으시는 <b>도로명+건물번호</b> 또는 <b>지역명+지번</b>을 입력해 주세요.</p>
            </div>
            <div id="divSearchlist">
               <div class="result">
                   <p>검색결과 : 총 <strong id="spanTotCnt">0</strong>건</p>
               </div>
                <div class="tb_wrap">
                    <table>
                        <caption class="blind">검색결과 리스트</caption>
                        <thead>
                            <tr>
                                <th>도로명</th>
                            </tr>
                        </thead>
                        <tbody id="tbodyResult">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="pageZone"></div>	
</div>	

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  

      
    	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
         <script>
         
     	
	  		function setLocation(lat, lng) {
	  			latitude = lat;
	  			longitude = lng;
	  			
	  			initTmap();
	 		}
  		         
	  		function setLocation2(lat, lng) {
	  			latitude = lat;
	  			longitude = lng;
	  			
	  			//drawMarker(   );
	  			//$('#test').text(latitude+'/'+longitude);
	  			lonlat3 = new Tmap.LonLat(longitude ,latitude ).transform("EPSG:4326", "EPSG:3857");//좌표 설정
        		var size = new Tmap.Size(24, 38);//아이콘 크기 설정
        		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정 
        		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_g_m_m.png',size, offset);//마커 아이콘 설정
        		
        		markers3 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - start
        		map.addLayer(markers3); // 지도에 Markers 객체 추가
        		
        		marker3 = new Tmap.Marker(lonlat3, icon);//마커 생성
        		markers3.addMarker(marker3);//레이어에 마커 추가 
        		
	 		}
  		         
         	var map;
         	var latitude, longitude;
			var lonlate, lonlate2, lonlat3;
			var gAppKey = '8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2';
			var markers1, markers2, markers3;
			var centerLL, targetLL;
			var marker1, marker2, marker3;
			var vectorLayer;
		
			var flocation;
			
			var size = new Tmap.Size(24, 38);
     		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
     		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_s.png',size, offset);
         	
         	$(document).ready(function() {
				// 안드로이드 폰에서 접속한 경우에만 실행
				window.loc.sendLocation();
//          		initTmap();
         		
        	});
         	
         	function setVariables(){    
         	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
         	}
         	
         	function initTmap(){
         		setVariables();
         		map = new Tmap.Map({
         			div:'map_div',
         		});
         		
         		//위치 정보 받아오기
//          		navigator.geolocation.getCurrentPosition(function(pos) {
//     				latitude = pos.coords.latitude;
//     				longitude = pos.coords.longitude;
//     				alert(latitude + '/' + longitude)
    	
             		map.setCenter(new Tmap.LonLat(longitude,latitude).transform("EPSG:4326", "EPSG:3857"), 15);
             		
  					//시작마커
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
                    		//document.querySelector("[name=address]").value = addr;
                    		
                     		/* // 팝업 생성
                    		var popup;
                    		popup = new Tmap.Popup( );
                    		popup.autoSize=true;//popup 사이즈 자동 조절		                         
                    		popup.show(); // 팝업 보이기
                    	 */
                    		centerLL = lonlat;
                    		targetLL = lonlat;
                    		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정
                    		markers1 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - start
                    		map.addLayer(markers1); // 지도에 Markers 객체 추가
                    		
                    		drawMarker(3,addr,1); // 마커 그리기
                    		////////////////////////////////
            			}else{
            				alert("검색결과가 없습니다.");
            			}
            		}); 
             	
             		//도착마커
            		lonlat2 = new Tmap.LonLat(longitude + 0.001,latitude + 0.001).transform("EPSG:4326", "EPSG:3857");
            	
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
              
                         		//document.querySelector("[name=arrive]").value = addr2;	
                         		document.querySelector("[name=arrive]").value = '도착지 주소를 검색해주세요';	

//                          		// 팝업 생성
//                         		var popup2;
//                         		popup2 = new Tmap.Popup( );
//                         		popup2.autoSize=true;//popup 사이즈 자동 조절		                         
//                         		popup2.show(); // 팝업 보이기
                        	
                        		// 이미지 마커 커스텀 오버레이
                        	
                        		centerLL = lonlat2;
                        		targetLL = lonlat2;
                        		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정
                        		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - 도착
                        		map.addLayer(markers2); // 지도에 Markers 객체 추가
                        		drawMarker(3,addr2,2); // 마커 그리기
                        		
                			}else{
                				alert("검색결과가 없습니다.");
                			}
                		}); 
             		
            	/* 	document.querySelector("[name=lat]").value = lonlat.lat;
             		document.querySelector("[name=lon]").value = lonlat.lon; */
             		
             		map.events.register("click", map, onClick);
      

//          		});

         	} 

         	//위치찾기
			function findMyLocation(){
				
				markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
				map.addLayer(markerLayer);//map에 마커 레이어 추가
			
        		document.getElementById("fl_btn").style.display="none";
        		document.getElementById("sl_btn").style.display="inline";
        		
//         		setLocation2(lat, lng);
        		
//         		$('#test').text(latitude+'/'+longitude);
        		
//         		lonlat3 = new Tmap.LonLat(longitude ,latitude ).transform("EPSG:4326", "EPSG:3857");//좌표 설정
//         		var size = new Tmap.Size(24, 38);//아이콘 크기 설정
//         		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정 
//         		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_g_m_m.png',size, offset);//마커 아이콘 설정
        		
//         		markers3 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - start
//         		map.addLayer(markers3); // 지도에 Markers 객체 추가
        		
//         		marker3 = new Tmap.Marker(lonlat3, icon);//마커 생성
//         		markers3.addMarker(marker3);//레이어에 마커 추가
     					
        		flocation = setInterval(function() {
        		
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
			
         	//위치찾기 종료
			function stopMyLocation(){
					
        		clearInterval(flocation);
        		markerLayer.clearMarkers();//레이어에 마커 제거
        		console.log("친구찾기 중지");
        		
        		/* document.getElementById("fl_btn").style.visibility="visible";
        		document.getElementById("sl_btn").style.visibility="hidden"; */
        		document.getElementById("fl_btn").style.display="inline";
        		document.getElementById("sl_btn").style.display="none";
         	}
         	
         	//길찾기
         	function findRoot(){
         		try {
         			removeRoot();
         		} catch(e) {}
         		
         		//출발, 도착지 마커 제거
         		//markers1.clearMarkers();
         		//markers2.clearMarkers();
         		markers1.setVisibility(false);
         		markers2.setVisibility(false);
         		
     			
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
        		
        		document.getElementById("r_btn").style.display="inline";
        		document.getElementById("f_btn").style.display="none";
        		/* document.getElementById("r_btn").style.visibility="visible";
        		document.getElementById("f_btn").style.visibility="hidden"; */
         	}
         	
         	//길찾기 제거
			function removeRoot(){		
				map.removeLayer(vectorLayer);
				markers1.setVisibility(true);
         		markers2.setVisibility(true);
         		
         		document.getElementById("r_btn").style.display="none";
        		document.getElementById("f_btn").style.display="inline";
         		/* document.getElementById("r_btn").style.visibility="hidden";
         		document.getElementById("f_btn").style.visibility="visible"; */
         		
         		
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
                		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성- 클릭 도착마커
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
        		//var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
        		vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
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
						markers1.addMarker(marker1); // markers 에 마커 추가
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
		//주소검색    
		var newRoadAddr = '';

		function isValidate() {
			var keyword = $('#inpKeyword').val();
			var totLimit = $('#inpTotLimit').val();
			var page = $('#inpPage').val();
			
			if( $.trim( keyword ) == '' ) {
				alert('검색어를 입력해주세요.');
				return false;
			}
			
			if( $.trim( totLimit ) == '' || $.isNumeric( totLimit ) == false || totLimit <= 0 ) {
				$('#inpTotLimit').val('20');
			}
			
			if( $('#inpTotLimit').val() > 200 ) {
				$('#inpTotLimit').val('200');
				alert('200개 이상의 항목은 페이지번호를 이용해주세요.');
			}
			
			if( $.trim( page ) == '' || $.isNumeric( page ) == false || page <= 0 ) {
				$('#inpPage').val('1');
			}
			
			return true;
		}
		
		// 검색어 입력 창
		$('#inpKeyword').keydown(function(e){
			if(e.keyCode == 13) {
				$('.btn_sch').trigger('click');
			}
		});
		
		// 페이지 수 입력 창
		$('#inpPage').keydown(function(e){
			if(e.keyCode == 13) {
				$('.btn_sch').trigger('click');
			}
		});
		
		// 검색 결과 제한 수 입력 창
		$('#inpTotLimit').keydown(function(e){
			if(e.keyCode == 13) {
				$('.btn_sch').trigger('click');
			}
		});
		
		// 페이징 클릭
		function goPage(movePage){
			$('#inpPage').val(movePage);
			$('.btn_sch').trigger('click');
		}
		
		// 검색 버튼
		$('#inpSearch').click(function(){
			// 유효성 검사
			isValidate();
			
			var appKey= gAppKey;
			var url = 'https://apis.openapi.sk.com/tmap/geo/postcode';
		
			var params = {
					"coordType" : "WGS84GEO",
					"addressFlag" : "F00",
					"format" : "json",
					"page" : $('#inpPage').val(),
					"count" : $('#inpTotLimit').val(),
					"addr" : $('#inpKeyword').val(),
					"appKey" : appKey
			};
			$.get(url, params, success)
			 .fail(fail);
		});
		
		$('#inpSearch').click(function(){
			// 유효성 검사
			isValidate();
			
			var appKey= gAppKey;
			var url = 'https://apis.openapi.sk.com/tmap/geo/postcode';
		
			var params = {
					"coordType" : "WGS84GEO",
					"addressFlag" : "F00",
					"format" : "json",
					"page" : $('#inpPage').val(),
					"count" : $('#inpTotLimit').val(),
					"addr" : $('#inpKeyword').val(),
					"appKey" : appKey
			};
			$.get(url, params, success)
			 .fail(fail);
		});

		function success( data ) {
			var arrResult = data.coordinateInfo.coordinate;
			var error = data.error;
			var strHtml = '';
			
			var jibunAddr = '';
			//var newRoadAddr = '';
			
			// 전체 검색 수
			var totalCnt = data.coordinateInfo.totalCount;
			$('#spanTotCnt').html( totalCnt );
			
			//페이징 처리----------------------------------------------------------------
			var totalCnt = data.coordinateInfo.totalCount; //전체 검색 건수
			var totalPage = Math.ceil(totalCnt/$('#inpTotLimit').val());//페이지 수
			var curentPage = $('#inpPage').val();//현재 페이지
			var pageHtml; //페이지 리스트
			
			var pageGroup = Math.ceil(curentPage/10);    //페이지 그룹 넘버링

			var next = pageGroup*10;
			var prev = next-9;            
			
			var goNext = next+1;
			if(prev-1<=0){
				var goPrev = 1;
			}else{
				var goPrev = prev-1;
			}    
			
			if(next>totalPage){
				var goNext = totalPage;
				next = totalPage;
			}else{
				var goNext = next+1;
			}
			
			if(totalPage>1){
				var prevStep = " <a class='btn_pre btn_pageNum' href='javascript:goPage("+goPrev+");'>◀</a> ";
				var nextStep = " <a class='btn_nxt btn_pageNum' href='javascript:goPage("+goNext+");'>▶</a> ";
			}
			
			$("#pageZone").empty();
			$("#pageZone").append(prevStep);
			for(var i=prev; i<=next;i++){
				if(curentPage == i){
					PageHtml = "<strong><a class='btn_pageNum btn_pageNum_active' href='javascript:goPage("+i+");'>"+i+"</a></strong> ";
				}else{
					PageHtml = "<strong><a class='btn_pageNum' href='javascript:goPage("+i+");'>"+i+"</a></strong> ";
				}
				$("#pageZone").append(PageHtml);
			}    
			$("#pageZone").append(nextStep);
			//페이징 처리----------------------------------------------------------------			
			
			for( var i in arrResult ) {
				
				//법정동 마지막 문자 
				var lastLegal = arrResult[i].legalDong.charAt(arrResult[i].legalDong.length-1);
				
				// 새주소 
				newRoadAddr = arrResult[i].city_do + ' ' + arrResult[i].gu_gun + ' '; 
				
				if(arrResult[i].eup_myun == '' && (lastLegal=="읍"||lastLegal=="면")){//읍면
					newRoadAddr +=  arrResult[i].legalDong;	
				}else{
					newRoadAddr +=  arrResult[i].eup_myun;
				}
				newRoadAddr += ' ' +arrResult[i].newRoadName + ' ' + arrResult[i].newBuildingIndex;
				
				// 새주소 법정동& 건물명 체크
				if(arrResult[i].legalDong != '' && (lastLegal!="읍"&&lastLegal!="면")){//법정동과 읍면이 같은 경우
					
					if(arrResult[i].buildingName != ''){//빌딩명 존재하는 경우
						newRoadAddr +=  (' (' + arrResult[i].legalDong + ', ' +arrResult[i].buildingName +') ');
					}else{
						newRoadAddr += (' (' + arrResult[i].legalDong + ')');
					}
				}else if(arrResult[i].buildingName != ''){//빌딩명만 존재하는 경우
					newRoadAddr +=  (' (' + arrResult[i].buildingName +') ');
				}
				
				// 구주소
				jibunAddr = arrResult[i].city_do + ' ' + arrResult[i].gu_gun + ' ' + arrResult[i].legalDong + ' '+ arrResult[i].ri + ' ' + arrResult[i].bunji;
				//구주소 빌딩명 존재
				if(arrResult[i].buildingName != ''){//빌딩명만 존재하는 경우
					jibunAddr +=  (' '+arrResult[i].buildingName);
				}
		
				strHtml+='<tr>';
				strHtml+='	<td>';
				strHtml+='		<ul class="tb1">';
				strHtml+='			<li class="row">';
				strHtml+='				<div class="th"><span class="label st">도로명</span></div>';
				strHtml+='				<div id="selectArrive" onclick="arriveAddr()">' + newRoadAddr + '</div>';
				strHtml+='			</li>';
				strHtml+='		</ul>';
				strHtml+='	</td>';
				strHtml+='</tr>';
				
			}
			if( error || arrResult.length <= 0 ) {
				strHtml+='<tr>';
				strHtml+='	<td colspan="2">';
				strHtml+='		<span>검색결과가 없습니다.</span>';
				strHtml+='	</td>';
				strHtml+='</tr>';
			}
			
			$('#tbodyResult').html(strHtml);
			
		}
		
		
		//주소검색시 도착마커로 
		function arriveAddr(){
			var roadAddr = newRoadAddr;
			console.log(roadAddr);
			document.querySelector("[name=arrive]").value = roadAddr;
			
			$.ajax({
				method:"GET",
				url:"https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
				async:false,
				data:{
					"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
					"fullAddr" : document.querySelector("[name=arrive]").value, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
					"appKey" : gAppKey,//실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
				},//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 3. 마커 찍기
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("coordinate");

					//검색 결과 정보가 없을 때 처리
					if($intRate.length==0){
						//예외처리를 위한 파싱 데이터
						$intError = $xml.find("error");
								
						// 주소가 올바르지 않을 경우 예외처리
						if($intError.context.all[0].nodeName == "error"){
							$("#result").text("요청 데이터가 올바르지 않습니다.");
						}
					}	
						  		    
					var lon, lat;
					if($intRate[0].getElementsByTagName("lon").length>0){//구주소
						lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
					   	lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
					}else{//신주소
						lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
						lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
					}
					
				
					console.log("좌표 :"+lon+"/"+lat);
					lonlat2 = new Tmap.LonLat(lon,lat).transform("EPSG:4326", "EPSG:3857");
					console.log("lonlat2 : " +lonlat2);
					
					//////////////////////////////////
					markers2.removeMarker(marker2); //기존 마커를 삭제합니다.
					console.log("마커 제거됫니")
					//////
    				
    				var addr2 = document.querySelector("[name=arrive]").value;
    				console.log("addr2 : " +addr2);

             		// 팝업 생성
            		var popup2;
            		popup2 = new Tmap.Popup( );
            		popup2.autoSize=true;//popup 사이즈 자동 조절		                         
            		popup2.show(); // 팝업 보이기
            	
            		// 이미지 마커 커스텀 오버레이
            		targetLL = lonlat2;
            		map.setCenter(new Tmap.LonLat(lon,lat).transform("EPSG:4326", "EPSG:3857"), 15);
            		
            		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - 주소검색시
            		map.addLayer(markers2); // 지도에 Markers 객체 추가
            		drawMarker(3,addr2,2); // 마커 그리기
            	
					
				},
					//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
					error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
						//에러가 발생하면 맵을 초기화함
								markerStartLayer.clearMarkers();
								map.setCenter(new Tmap.LonLat(longitude,latitude).transform("EPSG:4326", "EPSG:3857"), 15);
								$("#result").html("");
					}
				});
			
			
			
		}
		
		function fail(){
			var strHtml="";
			strHtml+='<tr>';
			strHtml+='	<td>';
			strHtml+='		<span>검색결과가 없습니다.</span>';
			strHtml+='	</td>';
			strHtml+='</tr>';
			
			$('#spanTotCnt').html( '0' );
			$('#tbodyResult').html(strHtml);
		}
			
	</script>
    	
    	<div id="ft" >
    	<jsp:include page="footer.jsp"></jsp:include>
    	</div>
    </body>
</html>	
