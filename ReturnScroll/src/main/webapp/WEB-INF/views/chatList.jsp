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
    width: 700px;
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
  display:initial;
  width:0px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:800px;
  height: 500px;
  margin:0px 50px; 
  padding:20px 10px;
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
</style>
</head>

<body id="page-top">

  <!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>

 
  
  <!-- 모달창 -->
  <div id="modal">
   
	    <div class="modal_content">
        	<button type="button" id="modal_close_btn" style='border: none;background: none;float: right;padding-right: 50px;'>
        	<img src="resources/img/error.png" style='width: 20px;'></button>
	        <h4 style='display: inline-block;'>${uid.uid} 님의 친구 목록</h4><br>
	        <div id="searchResult" style="padding-bottom: 10px;"></div>
	          <table class="table">
			    <thead>
			      <tr>
			        <th>No</th>
			        <th>친구 ID</th>
			        <th>닉네임</th>
			        <th> - </th>
			      </tr>
			    </thead>
			    <c:if test="${not empty friendList}">
			    <c:forEach var="lists" items="${friendList }" varStatus="status" >
			    <tbody>
			      <tr>
			        <td>${status.count }</td>
			        <td>${lists.friendId }</td>
			        <td>${lists.nick }</td>
			        <td>
			        	<input type='button' onclick='deleteFriend("${lists.friendId}");' value='친구삭제' style='border:none; background:none; display:inline-block;' />
			        </td>
			      </tr>
			    </tbody>
			    </c:forEach>
			  </c:if>
			  <c:if test="${empty friendList}">
			    <h5>친구목록이 비어있습니다</h5>
			  </c:if>
			  </table>
			  </div>
			  </div>


    <div id='body'>
	<section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- DIRECT CHAT -->
                <div class="box box-warning direct-chat direct-chat-warning">
                    <!-- 채팅 방 표시, 방 바꾸기 -->
                    <div id="putUser" style='float: right;'>${uid.uid}님 반갑습니다</div>
                    <div class="box-header with-border">
                        <h1 class="box-title">채팅방 리스트</h1><br>
                        
                           <c:if test="${not empty inviteList }">
							<div class='dropdown-menu-left' style='z-index:1;float: right;'>
								<button data-toggle='dropdown' id='alarms' style='border: none; background: none; display: inline-block;width: fit-content; height: auto;'>
									<span class='caret'>
									<img src="resources/img/alarm.png" style='width: 25px; '></span>
								</button>
								<c:forEach var="list" items="${inviteList }" varStatus="count">
									<ul class='dropdown-menu' style='list-style: none;'>
										<li><a class='dropdown-item disabled'
											style='padding-bottom: 10px; padding-top: 10px;'>${list.s}님이 회원님을<br> ${list.num }번 방으로 초대하였습니다</a></li>
										<li><a class='dropdown-item'style='padding-bottom: 10px; padding-top: 10px;'>
										 	<input type='hidden' id='senderId' value='${list.num}' />
											<button type='button' id='inviteYes' onclick='enterInvite("${list.num}","${list.s }","${list.r }");'> 입장하기</button>
											<button type='button' id='inviteNo' onclick='rejectInvite("${list.num}","${list.s }","${list.r }");'>거절하기</button></a>
										</li>
									</ul>
								</c:forEach>
							</div>
						</c:if>
						
						<c:if test="${empty inviteList }">
							<div></div>
						</c:if>
						
                    </div>
                    
                    
                    <!-- 채팅 메세지 표시 -->
                    <div class="box-body">
                        <!-- Conversations are loaded here -->
                        <div class="direct-chat-messages">
	                        <table class="table">
							    <thead>
							      <tr>
							        <th>채팅방 명</th>
							      </tr>
							    </thead>
							    
<%-- 							    <c:forEach var="list" items="${list }" varStatus="count" > --%>
<!-- 							    <tbody> -->
<!-- 							      <tr> -->
<%-- 							        <td><a href="/returnscroll/chat/${list.ID }">${list.NAME }</a></td> --%>
<!-- 							      </tr> -->
<!-- 							    </tbody> -->
<%-- 							    </c:forEach> --%>
							    
							    <tbody id="chatLists">
<!-- 							      <tr > -->
							        
<!-- 							      </tr> -->
							    </tbody>
							    
						  </table>
                          
                        </div>

                        <!-- /.direct-chat-pane -->
                    </div>
                    

                    <!-- /.box-footer-->
                </div>
                <!--/.direct-chat -->
            </div>
        </div>
    </section>
    </div>

  



  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <div class="btn-group btn-group-lg" id="sticker" style='width: inherit;'>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/friend'"><img alt="user" src="/returnscroll/resources/img/user.png" style='width:50px;'></button>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/chat'"><img alt="user" src="/returnscroll/resources/img/speech-bubble.png" style='width:50px;'></button>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

  <input type='hidden' id='nick' value='${uid.nick}'>
  <input type='hidden' id='recipient' value='${uid.uid}'>
  <input type='hidden' id='userID' value='${uid.uid}'>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
  
  <script src="http://192.168.0.28:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<%--     <script src="${pageContext.request.contextPath}/resources/chat.js?ver=1"/></script> --%>
<!-- 	<script src="jquery.sticky.js"></script> -->
	<script>
		// 현재 접속중인 채팅방 리스트를 보여주기 위함.
		$(document).ready(function(){
			var socket = io("http://192.168.0.28:82");
			console.log('채팅 서버 접속');
			var user = $('#userID').val();
			
			// 이 페이지랑 소켓 서버 연결
			socket.on('connect',function(){
				// 현재 접속자가 어디 방에 접속중인지 알려줌.
				socket.emit('s_chating_room', user);
			})
			
			// 접속한 채팅방이 없을 때 호출.
			socket.on('c_chating_room_none',function(){
				alert('접속한 채팅방 없음.');
			})
			
			socket.on('c_chating_room_list', function(list){
				// list(접속중인 방의 번호 리스트)로 방의 정보를 얻어옴
				for(var i=0;i<list.length;i++){
					console.log(list[i].roomId);
					var html  = "";
					html += "<tr><td><a href='/returnscroll/chat/"+list[i].roomId+"'>"+list[i].roomName+"</a></td></tr>";
// 					html += "<tr><td><a onclick='insertChat("+list[i].roomId+");'>"+list[i].roomName+"</a></td></tr>";
					$('#chatLists').append(html);
				}
			})
			
// 			function insertChat(roomId){
// 				socket.emit('s_show_chatMsg',roomId);
// 			}
			

		})

    </script>
    
    <script>
    	
    	// 초대수락
		function enterInvite(roomNumber, sender, recipient){
			var inviteData = {"roomNumber": roomNumber,"sender": sender,"recipient": recipient}
			console.log('초대수락 버튼 ');
			console.log("데이터 : "+inviteData.roomNumber+", "+inviteData.sender+", "+inviteData.recipient);
			$.ajax({
                url:"/returnscroll/friend/friendInviteCheck",
                type:'GET',
                data: inviteData,
                success:function(data){
                	console.log('결과 데이터는 '+data);
                	window.location.href="/returnscroll/chat/"+data;
                },
                error:function(request, status, errorThrown){
                   alert('방 입장 실패'+errorThrown);
                }
             })
		}
		// 초대거절하기
		function rejectInvite(roomNumber, sender, recipient){
			var inviteData = {"roomNumber": roomNumber,"sender": sender,"recipient": recipient}
			console.log('거절수락 버튼 ');
			console.log("데이터 : "+inviteData.roomNumber+", "+inviteData.sender+", "+inviteData.recipient);
			$.ajax({
                url:"/returnscroll/friend/friendInviteCheck",
                type:'GET',
                data: inviteData,
                success:function(data){
                	alert(sender+"님의 채팅창 초대를 거절하였습니다.");
                },
                error:function(request, status, errorThrown){
                   alert('초대 거절 실패');
                }
             })
		}
		
		
		
    </script>

</body>

</html>
