<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>귀환주문서 채팅방</title>

  <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css?ver=1" rel="stylesheet" >
<style>
#chat_box {
    width: 800px;
    min-width: 800px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#msg {
    width: auto;
}
#msg_process {
    width: 90px;
}

#modal {
  display: none;
  position:absolute;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:500px;
  margin:100px;
  padding:70px 30px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
} 

.direct-chat-name .pull-left {
	float: left;
}

.direct-chat-name .pull-right {
	float: right;
}

.dropdown-toggle::after {
    display:none;
}
</style>
</head>

<body id="page-top">

  <!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>


  
<div id="modal">
   
	    <div class="modal_content" id='body'>
	        <h2 style="text-align: center;">친구초대</h2><br>
	        <p style="text-align: center;">초대할 친구를 검색하세요</p>
	        <form method="GET" id="find"  style="text-align: center;">
		        ID : <input type="text" name="uid" id="uid" style="width: 300px; height: 35px;" placeholder="초대할 회원의 ID를 입력해주세요">
		    	<button id="findId" class="btn btn-warning btn-flat" style="float: right; margin: unset;" >검색</button>
			</form>
	        
	         <br>
	        <div id="searchResult" style="padding-bottom: 10px;"></div>
	          <table class="table">
			    <thead>
			      <tr>
			        <th>No</th>
			        <th>회원 ID</th>
			        <th></th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td id="number"></td>
			        <td id="findUserId"></td>
			        <td id="inviteLink"></td>
			      </tr>
			    </tbody>
			  </table>
			 
	        <div id="uidList" style="margin: 20px;"></div>
	
	        <button type="button" id="modal_close_btn" class="btn btn-warning btn-flat" style="float: right;">창 닫기</button>
	      
	    </div>
   
  		  <div class="modal_layer"></div>
    
	</div>
      <div id='body'>
	<section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- DIRECT CHAT -->
                <div class="box box-warning direct-chat direct-chat-warning" style="padding-top: 10px;">
                
                    <!-- 채팅 방 표시, 방 바꾸기 -->
                    <div id="putUser" style='float: right; padding-right:10px;'>${uid.uid}(${uid.nick })님 환영합니다</div>
                    <div id="roomNum" style="padding-left: 10px;">${room.roomId}번 방</div>
                    
                    <div class="box-header with-border">
                        <h1 class="box-title" style="text-align: center; display: block; padding-top: 20px;">${room.roomName }</h1><br>
                        <!-- 채팅방 정보 보여줄 곳이였는데 없어도 댐 -->
                        <div class="box-tools pull-right">
                            <div id='chat_header'></div>
                        </div>
                        
					<div id="members">
						<p style="text-align:center;">대화 참여자 </p>
							<div id="memberList">
<%-- 								<c:forEach var="item" items="${roomUser }" varStatus="stu"> --%>
<%-- 								<div>${stu.count }</div> --%>
<!-- 									<div class='dropdown' style='float: left;'> -->
<!-- 										<button class='btn btn-default' type='button' -->
<!-- 											data-toggle='dropdown' -->
<!-- 											style='border: none; background: none; display: inline-block;'> -->
<%-- 											${item.nick }<span class='caret'></span> --%>
<!-- 										</button> -->
<!-- 										<ul class='dropdown-menu' style='list-style: none;'> -->
<!-- 											<li><a href='/returnscroll/tmap' class='dropdown-item' -->
<!-- 												style='padding-bottom: 10px; padding-top: 10px;'>현재위치확인</a></li> -->
<!-- 											<li><a href='#' class='dropdown-item disabled' -->
<!-- 												style='padding-bottom: 10px; padding-top: 10px;'>회원정보보기</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
							</div>
						</div>
					
<!-- 					<button id='sendBtn' type="button" class="btn btn-warning btn-flat" -->
<!-- 					onclick="location.href='/returnscroll/chat'" style='float: right; margin-top: 10px;'>채팅방 나가기</button> -->
					<button id='sendBtn' type="button" class="btn btn-warning btn-flat"
					onclick="exitChat('${uid.uid}','${room.roomId}');" style='float: right; margin-top: 10px;'>채팅방 나가기</button>
					<br>
                    </div>
                    <!-- /.box-header -->
                    <!-- 채팅 메세지 표시 -->
                    <div class="box-body">
                        <!-- Conversations are loaded here -->
                        <div class="direct-chat-messages">
                        
                          
                        </div>
                        <!-- /.direct-chat-pane -->
                    </div>
                    <!-- /.box-body -->
                    <!-- 채팅 메세지 입력 처리 -->
                    <div class="box-footer">
                        <div class="input-group">
                            <input type="text" name="message" id="msg" placeholder="메세지를 입력하세요" class="form-control">
                            <span class="input-group-btn">
                                <button id='sendBtn' onclick="sendMsg()" type="button"  class="btn btn-warning btn-flat">보내기</button>
<!--                                 <button id='addFriend' type="button" class="btn btn-warning btn-flat">친구추가</button> -->
                            </span>
                        </div>
                    </div>
                    <!-- /.box-footer-->
                </div>
                <!--/.direct-chat -->
            </div>
        </div>
    </section>
</div>

  <div class="btn-group btn-group-lg" id="sticker" style='width: inherit;'>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/friend'"><img alt="friendList" src="/returnscroll/resources/img/user.png" style='width:50px;'></button>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/chat'"><img alt="chat" src="/returnscroll/resources/img/speech-bubble.png" style='width:50px;'></button>
	</div>

 
	<jsp:include page="footer.jsp"></jsp:include>
	
	
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <input type='hidden' id='nick' value='${uid.nick}'>
    <input type='hidden' id='userid' value='${uid.uid}'>
   <input id='roomNumber' type='hidden' value='${room.roomId }'></input>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
  
<!--     <script src="http://192.168.0.28:82/socket.io/socket.io.js"></script> -->
    <script src="http://192.168.0.15:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/chat.js"/></script>
    
<%--    <script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script> --%>
    
    <!-- 모달 띄우고 내리는거 -->
    <script type="text/javascript">
 // sticky
//  	$(window).load(function(){
// 		$("#sticker").sticky({topSpacing:0});
// 	}); 
 
 	// 채팅방 나가기 버튼을 눌렀을 때 실행되는 함수 (퇴장하는 회원, 퇴장하려는 방)
	 function exitChat(user, roomId){
 		// 소켓 서버 아이피 넣기
 		 var socket = io("http://192.168.0.15:82");
		 socket.emit('s_chatRoom_exit',user, roomId);
		 location.href="/returnscroll/chat";
	 }
		 
		// 이 문서상에 존재하는 모든 요소들 중에 id 값이 sendBtn인 요소
	    /* $('#sendBtn').click(function(){
	    	console.log('버튼클릭 메세지 전송');
	        sendMsg();
    	}) */
	    
	    // 메시지 전송
	    function sendMsg(){
			var user_nick = $("#nick").val();
			var user_id = $('#userid').val();
			var room_id = $('#roomNumber').val();
			var socket = io("http://192.168.0.15:82");  
			console.log('버튼클릭 메세지 전송/room_id는 '+room_id);
	      	socket.emit('s_send_msg_btn',room_id,user_id, user_nick ,$('input[name=message]').val(), new Date() );
	      	// 입력창 초기화
	      	$('input[name=message]').val('');
	      	
	      	socket.on('c_send_msg', function(sender, msg, time) {
	            console.log(sender, msg, time);
	            // 메시지를 화면에 표시
	            addMsg(sender, msg, time);
          })
          
          function addMsg(sender, msg, time)
    {
    	
    	console.log(typeof time)
    	time = time.substr(time.indexOf("T")+1,5);
    	console.log(time)
    	
    	// 관리자 메세지는 따로 ~~
      var flag = sender === user_nick ? 'right' : 'left';
      // 1. 메시지UI를 붙일 요소를 찾아서, 동적으로 html을 구성하여 추가한다.
      if(sender === '관리자'){
		  var html = "<div class='direct-chat-msg' style='margin: auto; width:100%; text-align:center;'>";
		  html += "<div class='direct-chat-info clearfix'style='display: inline-block'>";
		  html += "<div class='direct-chat-text' style='position: initial; border:none;'>"+msg+"</div>"
		  html += "</div>";
		  html += "</div>";    	
      }else if(flag == 'left'){ // 왼쪽 
    	  var html = "<div class='direct-chat-msg "+flag+"'>";
    	  html += "<div class='direct-chat-info clearfix' style='display: inline'>";
    	  html += "<span class='direct-chat-name pull-"+flag+"' stlye='text-align:left!important;'>"+sender+"&nbsp;&nbsp;</span>";
    	  html += "<span class='direct-chat-timestamp pull-right' stlye='text-align:left!important;'>"+time+"</span><br>";
    	  html += "<div class='direct-chat-text' style='text-align:"+flag+"; margin-right: 110px; display: table-cell;'>"+msg+"</div>"
    	  html += "</div>";
    	  html += "</div>";
      }else{  // 오른쪽 
    	  var html = "<div class='direct-chat-msg "+flag+"' style='text-align:right;'>";
    	  html += "<div class='direct-chat-info clearfix' style='display: inline'>";
    	  html += "<span class='direct-chat-timestamp pull-right' stlye='text-align:right!important;' >"+time+"&nbsp;&nbsp;</span>";
    	  html += "<span class='direct-chat-name pull-"+flag+"' stlye='text-align:right!important;' >"+sender+"</span><br>";
    	  html += "<div class='direct-chat-text' style='text-align:"+flag+"; display: table-cell;'>"+msg+"</div>"
    	  html += "</div>";
    	  html += "</div>";
      }
      
      html+= '<div class= row></div>'
      $('.direct-chat-messages').append(html);
      // 자동스크롤
      $('.direct-chat-messages').scrollTop($('.direct-chat-messages')[0].scrollHeight+20);

    }
	      
	    }
 
    </script>
    
	<!-- 현재 대화방에 참여중인 상대를 불러옴 -->
	<script>
		// 들어오자마자 새로고침.
		/* $(document).ready(function(){
			window.location.reload();
		}); */

//  		$(document).ready(function(){
// 			// 입력한 아이디값 받기
//  			var roomId = ${room.roomId};
//  			var roomData = {"roomId" : roomId};

// 			$.ajax({
// 				url:"http://localhost:8080/returnscroll/chat/roomData",
// 				type:'GET',
// 				data: roomData,
// 				success:function(data){
// 					//console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
// 					var nick_list = "<h6>";
// 					for(var i=0;i<data.length;i++){
// 						nick_list += "<div class='dropdown' style='float: left;'><button class='btn btn-default' type='button' data-toggle='dropdown' style='border: none;background: none; display: inline-block;'>"+data[i].nick
// 						nick_list += "<span class='caret'></span></button>"
// 						nick_list += "<ul class='dropdown-menu' style='list-style:none;'>"
// 						nick_list += "<li><a href='/returnscroll/tmap' class='dropdown-item' style='padding-bottom:10px;padding-top:10px;'>현재위치확인</a></li>"
// 						nick_list += "<li><a href='#' class='dropdown-item disabled' style='padding-bottom:10px;padding-top:10px;'>회원정보보기</a></li>"
// 						nick_list += "</ul></div>";
// 					}
// 					nick_list += "</h6>";
// 					console.log("현재 참여자 리스트 : " +nick_list);
// 					$("#memberList").append(nick_list);
// 				},
// 				error:function(request, status, errorThrown){
// 					alert('현재 대화 참여자 불러오기 실패');
// 				}
// 			})
// 		});

	</script>
	<script>

// 		$('#sendBtn').on('click', function(evt) {
// 			console.log('메시지 전송'+$('#msg').val());
// 			socket.emit('s_send_msg', $('#msg').val(), new Date());
// 			// 입력창 초기화
// 			$('#msg').val('');
// 		})

		// 메시지 전송
// 		function sendMsg() {
// 			var socket = io("http://192.168.0.6:82");
// 			console.log('메시지 전송'+$('#msg').val());
// 			var user_id = $('#userid').val();
// 			console.log('메세지를 보내려고 하는 회원의 아이디 '+user_id);
// 			//socket.emit('s_send_userId',user_id);
// 			socket.emit('s_send_msg_btn', user_id, $('#msg').val(),new Date());
// 			// 입력창 초기화
// 			$('#msg').val('');
// 		}
	</script>
</body>

</html>
