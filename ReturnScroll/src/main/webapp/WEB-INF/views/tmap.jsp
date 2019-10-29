<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Tmap</title>
<script
	src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css"
	rel="stylesheet">
<%--  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" > --%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/map.css"
	rel="stylesheet" />
</head>

<body id="page-top">
	<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for this template -->
<<<<<<< HEAD
	<script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
<!-- 	<script src="http://192.168.0.28:82/socket.io/socket.io.js"></script> -->
	<script src="http://192.168.0.15:82/socket.io/socket.io.js"></script>
=======
	<script
		src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
	<script src="http://192.168.0.28:82/socket.io/socket.io.js"></script>
>>>>>>> branch 'master' of https://github.com/tjdwns784/returnscroll.git
	<!-- 	<script src="https://code.jquery.com/jquery-1.11.1.js"></script> -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- <p id="result" name="result" value=" " ></p> -->
	<div id="body">
		<h1 id="h1_title" style="margin-left: 2.5%; margin-top: 2%;">Map</h1>
<<<<<<< HEAD
		<p style="text-align: right;">${memberNick}님의 현재 위치</p>
		<hr style="width: 95%; background: #FFCC33; height: 2px; margin-left: 2.5%;">
=======
		<hr
			style="width: 95%; background: #FFCC33; height: 2px; margin-left: 2.5%;">
>>>>>>> branch 'master' of https://github.com/tjdwns784/returnscroll.git
		<div style="width: 100%;">
			<form method='post' enctype='multipart/form-data'
				style="margin-left: 2.5%;">
				<div
					style="width: 100%; max-width: 100%; height: auto; margin-bottom: 1%;">
					출발 : <input type='text' id='start' name='start' readonly
						style="width: 90%; margin-bottom: 10px;"><br> 도착 : <input
						type='text' id='arrive' name='arrive' readonly style="width: 90%;">
				</div>
				<div id="map_btn">
					<input type="button" value='주소검색' data-toggle="modal"
						data-target="#findAddr"> <input type='button' id='f_btn'
						value='경로찾기' onclick="findRoot()"> <input type='button'
						id='r_btn' value='경로취소' onclick="removeRoot()"
						style="display: none;"> <input type='button' id='fl_btn'
						value='현재위치찾기' onclick="findLocation()"> <input
						type='button' id='sl_btn' value='현재위치찾기 중지'
						onclick="stopLocation()" style="display: none;"><br>
					<input type="hidden" id="memberNick" value="${memberNick}">
					<input type="hidden" id="unick" value="${unick}">
					<input type="hidden" id="room_num" value="${room_num}">
				</div>
			</form>
		</div>
		<hr
			style="margin-left: 2.5%; width: 95%; background: #FFCC33; height: 2px">

		<!-- 지도 -->
		<div id="map_div"></div>
		<br>
		<div id="map_btn2">
			<input type='button' id='back' value='뒤로가기'
				onclick="location.href='/returnscroll/chat/${room_num}'"> <input
				type='button' id='reflash' value='새로고침' onclick="location.reload()">
		</div>

		<!-- Modal -->
		<div class="modal fade" id="findAddr" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
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
									<span class="ico_sch"></span> <span class="top_tit">주소
										검색</span>
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
												<input type="text" id="inpKeyword" title="검색"
													placeholder="예) 을지로 65, 을지로2가 11">
											</div>
										</div>
									</fieldset>
									<p>
										* 검색창에 찾으시는 <b>도로명+건물번호</b> 또는 <b>지역명+지번</b>을 입력해 주세요.
									</p>
								</div>
								<div id="divSearchlist">
									<div class="result">

										<p style="color: darkorange">최근 검색 목록</p>
										<table>
											<c:forEach items="${user_addr}" var="item">
												<tr>
													<td><a onclick='arriveRecentAddr("${item.ADDRESS}")'  data-dismiss="modal" style="cursor:pointer;">
															${item.ADDRESS} </a></td>
												</tr>
											</c:forEach>
										</table>


										<p style="color: darkorange">
											검색결과 : 총 <strong id="spanTotCnt">0</strong>건
										</p>
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
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<script>

			var socket = io("http://192.168.0.28:82");
			var watchId;
         	var map;
         	var latitude, longitude;
			var lonlate, lonlate2, lonlat3;
			var gAppKey = '8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2';
			var markers1, markers2, markers3;
			var centerLL, targetLL;
			var marker1, marker2, marker3;
			var vectorLayer;
			var markerLayer;
			var connectValue = true;
			var size = new Tmap.Size(24, 38);
     		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
     		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_s.png',size, offset);
     		var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기	
     		var memberNick = $('#memberNick').val();
     		var unick = $('#unick').val();
     		var room_num = $('#room_num').val();
     		var start = '';
     		var arrive = '';
     		var addr2="";

     		$(document).ready(function() {
   				
     			// 안드로이드 폰에서 접속한 경우에만 실행				 
				if (varUA.match('android') != null) { //안드로이드 일때 처리				  
				    window.loc.sendLocation(unick);					    
				    initTmap();
				} else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) { //IOS 일때 처리
				} else {
					initTmap();					
				}
     			
     			socket.emit('btn_status',room_num, unick);
     			socket.on('btn_status_show',(status)=>{
     				if(status == 'end'){
     					stopLocation();
     				}else if(status == 'start'){
                		socket.emit('status_delete',room_num,unick);
                		findLocation();
     				}
     			});
     			
        	});
         	
         	function setVariables(){    
         	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
         	}
         	
         	function initTmap(){
         		setVariables();
         		map = new Tmap.Map({
         			div:'map_div',
         		});
				
				//맨처음 아이디값 보내줌 -> 서버
       		 	socket.emit('send_userid', unick);
				console.log("send_userid : " + unick)	
			
         		if (varUA.match('android') != null) { 
				    //안드로이드 일때 처리
	         			console.log("안드로이드@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	                 	console.log("#######" +unick + "#########" + memberNick);
	                
				       	//처음 위치값을 받음 :  안드로이드 -> 서버 -> sts
	 					socket.on('send_a_latlng_server', function(id,lat,lng){
	 						if(id == unick){
	 							console.log("send_a_latlng_server : "+id+"/"+lat+","+lng);	
		 						latitude = lat;
			    				longitude = lng;
			    				//룸으로 user 위치값 보냄 -> 서버
			    				socket.emit('send_room_a_latlng',id,lat,lng);
			    				console.log("%%%%%%%%%%%%%%안드 - 나 ");	
			    				console.log("#######" +unick + "#########" + memberNick);
			    				
			    				if(unick != memberNick){
			    					//상대방 위치 요청(참여자 모두에게 요청)   카카오비니
					    			socket.emit('request_room_a_latlng',unick, memberNick);	
					    			socket.emit('request_room_aw_latlng',unick, memberNick);		
			    				}else{		    					
			 						initLocation(latitude, longitude);
			    				}	
	 						}
	 					});
				       	
	 					socket.on('request_room_a_latlng_server', function(requestNick, memberNick){
	 						console.log(`${requestNick}가 ${memberNick}에게 위치 요청22222`)
	 						console.log("start: " + start);
	 						console.log("arrive: " + arrive);
	 						console.log(unick == memberNick);
	 						if(unick == memberNick){	 		
	 							socket.emit('send_member_a_latlng',requestNick, latitude, longitude,start, arrive);
	 						}
	 					});
	 					
	 					socket.on('send_member_a_latlng_server', function(uid, lat, lng, start_r,arrive_r){
	 						console.log('send_member_a_latlng_server1');
	 						console.log(uid, lat, lng, start_r,arrive_r);
	 						console.log('send_member_a_latlng_server2');
	 						if(unick == uid) {
		 						console.log( uid, '가요청한 위치', lat, lng,start,arrive);	
	 							document.querySelector("[name=start]").value = start_r;
	 							document.querySelector("[name=arrive]").value = arrive_r;
	 							console.log('상대방 위치 전송 완료')
	 							initLocation(lat,lng);
	 						}
	 					});
	 					///////////
	 					socket.emit('request_room_wa_latlng',unick, memberNick);
		    			socket.on('request_room_wa_latlng_server', function(requestNick, memberNick){
	 						console.log(`${requestNick}가 ${memberNick}에게 위치 요청22222`)
	 						console.log(unick);
	 						console.log(memberNick);
	 						
	 						console.log(unick == memberNick);
	 						if(unick == memberNick){	 							
	 							socket.emit('send_member_wa_latlng',requestNick, latitude, longitude,start, arrive);
	 						}
	 					});	 		
	 					
	 					socket.on('send_member_aw_latlng_server', function(uid, lat, lng, start_r,arrive_r){
	 						if(unick == uid) {
		 						console.log( uid, '가요청한 위치', lat, lng,start,arrive);
	 							document.querySelector("[name=start]").value = start_r;
	 							document.querySelector("[name=arrive]").value = arrive_r;
	 							console.log('상대방 위치 전송 완료')
	 							initLocation(lat,lng);
	 						}
	 					});
				} else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) { 
				    //IOS 일때 처리
				} else {
					console.log("웹@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	         		//위치 정보 받아오기
	         		navigator.geolocation.getCurrentPosition(function(pos) {
	    				latitude = pos.coords.latitude;
	    				longitude = pos.coords.longitude;	    				
						//룸으로 user 위치값 보냄 -> 서버
		    			socket.emit('send_room_w_latlng',unick,latitude,longitude);	
		    			socket.emit('send_room_wa_latlng',unick,latitude,longitude);	
					 //              상대방 위치 요청(참여자 모두에게 요청)   카카오비니
		    			socket.emit('request_room_w_latlng',unick, memberNick);		
		    			socket.on('request_room_w_latlng_server', function(requestNick, memberNick){
	 						console.log(`${requestNick}가 ${memberNick}에게 위치 요청22222`)
	 						console.log(unick);
	 						console.log(memberNick);
	 						console.log(unick == memberNick);
	 						if(unick == memberNick){	 							
	 							socket.emit('send_member_w_latlng',requestNick, latitude, longitude,start, arrive);
	 						}
	 					});	 					
	 					socket.on('send_member_w_latlng_server', function(uid, lat, lng, start_r,arrive_r){
	 						if(unick == uid) {
		 						console.log(unick, '가 요청한 위치', lat, lng,start,arrive);
	 							document.querySelector("[name=start]").value = start_r;
	 							document.querySelector("[name=arrive]").value = arrive_r;
	 							console.log('상대방 위치 전송 완료')
	 							initLocation(lat,lng);
	 						}
	 					});	 					
	 				    //              상대방 위치 요청(참여자 모두에게 요청)   카카오비니
		    			socket.emit('request_room_wa_latlng',unick, memberNick);
		    			socket.on('request_room_wa_latlng_server', function(requestNick, memberNick){
	 						console.log(`${requestNick}가 ${memberNick}에게 위치 요청22222`)
	 						console.log(unick);
	 						console.log(memberNick);
	 						
	 						console.log(unick == memberNick);
	 						if(unick == memberNick){	 							
	 							socket.emit('send_member_wa_latlng',requestNick, latitude, longitude,start, arrive);
	 						}
	 					});	 					
	 					socket.on('send_member_wa_latlng_server', function(uid, lat, lng, start_r,arrive_r){
	 						if(unick == uid) {
		 						console.log(unick, '가 요청한 위치', lat, lng,start,arrive);
	 							document.querySelector("[name=start]").value = start_r;
	 							document.querySelector("[name=arrive]").value = arrive_r;
	 							console.log('상대방 위치 전송 완료')
	 							initLocation(lat,lng);
	 						}
	 					});
	 					/////////////////////////
	 					socket.on('request_room_aw_latlng_server', function(requestNick, memberNick){
	 						console.log(`${requestNick}가 ${memberNick}에게 위치 요청22222`)
	 						console.log(unick);
	 						console.log(memberNick);
	 						console.log(unick == memberNick);
	 						if(unick == memberNick){	 							
	 							socket.emit('send_member_aw_latlng',requestNick, latitude, longitude,start, arrive);
	 						}
	 					});
	 
	    				initLocation(latitude, longitude);
         			});        		
	         		
         		} 
         	}
         
  			//위치 초기값
  			function initLocation(lat, lng){
  				console.log("***lat : " + lat + "/lng :" + lng);
         		map.setCenter(new Tmap.LonLat(lng,lat).transform("EPSG:4326", "EPSG:3857"), 15);
				//시작마커
         		lonlat = new Tmap.LonLat(lng,lat).transform("EPSG:4326", "EPSG:3857");
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
                		start = $('#start').val();
        	     		
        	     		console.log('start값 : '+start + '@');
        	     		console.log('arrive값 : '+arrive + '@');        	     	                		
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
         	
  			}

         	//친구위치찾기
			function findLocation(){
				// 내가 내 위치를 확인 했을 때
				if(unick == memberNick){
         			// unick이 접속한 사람 , memberNick이 확인하고 싳은 사람       					
		         	socket.emit('send_start_user', unick+'님이 출발을 하였습니다.', unick, memberNick, room_num,new Date());
         		}
         		
				connectValue = true;
				markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
				map.addLayer(markerLayer);//map에 마커 레이어 추가			
        		document.getElementById("fl_btn").style.display="none";
        		document.getElementById("sl_btn").style.display="inline";  
        		
        		
        		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_g_m_m.png',size, offset);//마커 아이콘 설정        		
        		if (varUA.match('android') != null) { 
				    //안드로이드 일때 처리
				    console.log("안드로이드2222222222222222222222222");
			 			//위치변경시 안드로이드 위치값 받음  
						socket.on('send_a_latlng2_server', function(id,lat,lng){
							if(connectValue == true){
								console.log("send_latlng2_server : "+id+"/"+lat+","+lng);
								//위치변경시 나
								if(id == memberNick && memberNick == unick){
									latitude = lat;
				       				longitude = lng;
									//안드로이드 위치 변경시킴
				 					console.log("lat: " + latitude + "/lng: " + longitude);
				        			//룸으로 변경된 안드로이드 위치값 보냄
									socket.emit('send_room_a_latlng2',id,latitude,longitude);				        			
									lonlat3 = new Tmap.LonLat(longitude ,latitude ).transform("EPSG:4326", "EPSG:3857");//좌표 설정				        			
				        			centerLL = lonlat3;
				            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정				            		
				        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
				        			markerLayer.addMarker(marker);//레이어에 마커 추가
								}
							}
						});
						
			 			//서버에서 변경된 안드로이드 위치값 받음  나 안드- 상대 안드로이드
						socket.on('send_room_a_latlng2_server', function(id,lat,lng){
							if(connectValue ==true){
		 						console.log("send_room_a_latlng2_server : "+id+"/"+lat+","+lng);	
		 						//변경하고 싶은 유저면 위치값 변경
		 						if(id == memberNick && memberNick != unick){	
		 							lonlat3 = new Tmap.LonLat(lng ,lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정				        			
				        			centerLL = lonlat3;
				            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정				            		
				        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
				        			markerLayer.addMarker(marker);//레이어에 마커 추가		 							
		 						}	
	 						}
	 					});
			 			
						//안드로이드에서 웹값 받기
						//변경된 웹 위치값 받음 
						socket.on('send_room_w_latlng2_server', function(id,lat,lng){
							if(connectValue == true){
								console.log("send_room_w_latlng2_server : "+id+"/"+lat+","+lng);	
								//원하는 웹 유저 위치값이면 변경
								if(id == memberNick && memberNick != unick){ 						
		 		        			lonlat3 = new Tmap.LonLat(lng ,lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		 		        			centerLL = lonlat3;
		 		            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정		 		            		
		 		        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
		 		        			markerLayer.addMarker(marker);//레이어에 마커 추가
		 						}
							}
						});
				} else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) { 
				    //IOS 일때 처리
				} else {
					  console.log("웹@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					var options = {timeout: 3000};
	        		watchId = navigator.geolocation.watchPosition(function(position) {
	        			console.log(position.coords);
						//웹에서 위치 변경되면 
	        			latitude = position.coords.latitude;
	       				longitude = position.coords.longitude;
			 			//변경된 웹 위치값 룸으로 보냄 - 나 웹
			            socket.emit("send_room_w_latlng2",unick,latitude,longitude);
			 			//내가 내 위치를 보고싶으면 
			 			if(memberNick == unick){
			            	lonlat3 = new Tmap.LonLat(longitude ,latitude ).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		        			centerLL = lonlat3;
		            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정		            		
		        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
		        			markerLayer.addMarker(marker);//레이어에 마커 추가
			 			}
			 			//변경된 웹 위치값 받음 
						socket.on('send_room_w_latlng2_server', function(id,lat,lng){
							console.log("send_room_w_latlng2_server : "+id+"/"+lat+","+lng);	
							//원하는 유저 위치값이면 변경
							if(id == memberNick && memberNick != unick){							
	 		        			lonlat3 = new Tmap.LonLat(lng ,lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정
	 		        			centerLL = lonlat3;
	 		            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정	 		            		
	 		        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
	 		        			markerLayer.addMarker(marker);//레이어에 마커 추가
	 						}
						},null,options);
			 			//변경된 안드로이드 위치값 받음
						socket.on('send_room_a_latlng2_server', function(id,lat,lng){
							console.log("send_room_a_latlng2_server : "+id+"/"+lat+","+lng);	
							//내가 웹일때 안드로이드 위치값으로 변경하고 싶으면
		 					if(id == memberNick && memberNick != unick){
				     			lonlat3 = new Tmap.LonLat(lng,lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정			        				        			
			        			centerLL = lonlat3;
			            		map.setCenter(centerLL, 14); // 지도 중심 좌표 설정			            		
			        			marker = new Tmap.Marker(lonlat3, icon);//마커 생성
			        			markerLayer.addMarker(marker);//레이어에 마커 추가
		 					}
						});						
	       			}); 
				}
         	}
			
         	//위치찾기 종료
			function stopLocation(){
				connectValue = false;
        		navigator.geolocation.clearWatch(watchId);        		
        		markerLayer.clearMarkers();//레이어에 마커 제거
        		console.log("친구찾기 중지");        		
        		document.getElementById("fl_btn").style.display="inline";
        		document.getElementById("sl_btn").style.display="none";
        		
				// 내가 내 위치를 확인 했을 때
         		if(unick == memberNick){				
   					// unick이 접속한 사람 , memberNick이 확인하고 싳은 사람
           			socket.emit('send_end_user', unick+'님이 도착을 하였습니다.', unick, memberNick,room_num, new Date());
         		}
         	}
         	
         	//길찾기
         	function findRoot(){
         		try {
         			removeRoot();
         		} catch(e) {}         	
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
         	}
         	
         	//길찾기 제거
			function removeRoot(){		
				map.removeLayer(vectorLayer);
				markers1.setVisibility(true);
         		markers2.setVisibility(true);         		
         		document.getElementById("r_btn").style.display="none";
        		document.getElementById("f_btn").style.display="inline";         	
         	}

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
			// 마커 그리기
			function drawMarker(type, addr,ca){				
				var labelHtml = getMarkupData(addr); // 라벨 내용 지정
				var label = new Tmap.Label(labelHtml); // 라벨 생성
				label.popupStyle = type;
					if(ca == 1){
						marker1 = new Tmap.Markers(targetLL,icon, label); // 마커 생성
						markers1.addMarker(marker1); // markers 에 마커 추가
						//marker1.popup.show(); // 팝업 보이기
					}else if(ca == 2){
						icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_a.png",size,offset); // 마커 아이콘 지정
						marker2 = new Tmap.Markers(targetLL,icon, label); // 마커 생성
						markers2.addMarker(marker2); // markers 에 마커 추가
						//marker2.popup.show(); // 팝업 보이기
					}	
				}				
		
			// 라벨 컨텐츠 지정 함수
			function getMarkupData(addr){				
				var txt = "<div style='font-size:.8em'>";
				txt += "<span class='whiteText'>"+ addr + "</span>";
				return txt;
			}
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
			
			var pageGroup = Math.ceil(curentPage/10);    // 페이지 그룹 넘버링

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
				strHtml+='				<div id="selectArrive" onclick="arriveAddr()" data-dismiss="modal">' + newRoadAddr + '</div>';
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
			arrive = $('#arrive').val();
      
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
					

    				console.log("addr2 : " +addr2);
    				if(addr2 != "")	markers2.removeMarker(marker2); //기존 마커를 삭제합니다.
    				 addr2 = document.querySelector("[name=arrive]").value;
    				console.log("addr2 : " +addr2);
    				
  
					console.log(unick);
					console.log("mm:" + memberNick);
					if(unick == memberNick ){
						$.ajax({
						  type : 'POST',
						  data:{
								"latitude" :  lonlat2.lon,
								"longitude" : lonlat2.lat,
								"address" : addr2
							},
						  async: false,
						  url : "/returnscroll/tmap/${memberNick}/${room_num}",
						  success : function(req) {
						
			    				console.log("주소 넣기")
						  },
						  error:function(e){
						   if(e.status==300){
						    alert("데이터를 가져오는데 실패하였습니다.");
						   }
						  }
						 });
					}

////            	
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
		
		function arriveRecentAddr(recentAddr){
			var roadAddr = recentAddr;
			console.log(roadAddr);
			console.log(recentAddr);
		
			document.querySelector("[name=arrive]").value = recentAddr;
			arrive = $('#arrive').val();
      
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
					

    				console.log("addr2 : " +addr2);
    				if(addr2 != "")	markers2.removeMarker(marker2); //기존 마커를 삭제합니다.
    				 addr2 = document.querySelector("[name=arrive]").value;
    				console.log("addr2 : " +addr2);
    				
    				// 이미지 마커 커스텀 오버레이
            		targetLL = lonlat2;
            		map.setCenter(new Tmap.LonLat(lon,lat).transform("EPSG:4326", "EPSG:3857"), 15);
            	
            		markers2 = new Tmap.Layer.Markers("MarkerLayer"); // Markers 객체 생성 - 주소검색시
            		map.addLayer(markers2); // 지도에 Markers 객체 추가
            		drawMarker(3,addr2,2); // 마커 그리기
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

		<div id="ft">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>
