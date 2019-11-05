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
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:500px;
  margin-left: 200px;
  padding:70px 30px;
  background:#fff;
  border:2px solid #666;
  text-align: center;
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


      <div id='body'>

	<section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- DIRECT CHAT -->
                <div class="box box-warning direct-chat direct-chat-warning" '>
                    <h5 style='display: inline-block; padding-top:10px;'>${uid.uid} 님의 친구 목록</h5><br>
			        <div id="searchResult" style="padding-bottom: 10px;"></div>
			          <table class="table">
					    <tbody>
					      <tr>
					      	<td>아이디&nbsp;</td>
					        <td>${friendInfo.uid}</td>
					      </tr>
					      <tr>
					        <td>이름 &nbsp;</td>
					        <td>${friendInfo.uname }</td>
					      </tr>
					      <tr>
					        <td>핸드폰 &nbsp;</td>
					        <td>${friendInfo.phone }</td>
					      </tr>
					      <tr>
					        <td>이메일 &nbsp;</td>
					        <td>${friendInfo.email }</td>
					      </tr>
					      <tr>
					        <td>생일 &nbsp;</td>
					        <td>${friendInfo.birth }</td>
					      </tr>
					    </tbody>
					  </table>
					  <div style="display: grid;">		        	
					  <button type='button' onclick='deleteFriend("${lists.friendId}");' >친구삭제 </button>
					  <br>
		        	<button type='button' onclick='newChat("${uid.uid}","${friendInfo.uid}");'>채팅하기</button>
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

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

	<jsp:include page="footer.jsp"></jsp:include>
	</div>

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

  
    
    <script>
    
	    $(window).load(function(){
			$("#sticker").sticky({topSpacing:0});
		});
	    
    	function deleteFriend(friendId){
    		var userId = $('#userID').val();
    		var data = {"userId" : userId , "friendId" : friendId};
    		console.log('친구 삭제 할때 보내는 데이터 값 '+data.userId +",  "+data.friendId);
    		var check = confirm(friendId+"님을 삭제하시겠습니까?");
        	  if(check) {
        		  $.ajax({
                      url:"/returnscroll/chat/deleteFriend",
                      type:'GET',
                      data: data,
                      success:function(data){
                         //console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
                            alert(data+'님을 삭제하였습니다.')
                      },
                      error:function(request, status, errorThrown){
                         alert('친구 삭제 실패');
                      }
                   })
        	  }
        	  else {
        		  alert(friendId+"님을 친구목록에 유지하겠습니다");
        	  }
   		
    		
    	}
    </script>
    
    <script>
  		// 새로운 채팅하기
    	function newChat(uid, friendId){
    		var newChatName = prompt('새로운 채팅방의 이름을 작성해주세요!');
    		var createData = {"roomName": newChatName ,"createUser": uid, "friendId" : friendId};
    		console.log("방생성할 때 보내는 데이터 : "+createData.roomName+", "+createData.createUser+", "+createData.friendId);
    		$.ajax({
                url:"/returnscroll/friend/friendChatRoom",
                type:'GET',
                data: createData,
                success:function(data){
                	console.log('방금 생성한 방의 번호: '+data+", data의 타입 : "+typeof data);
//                 	var url = "/returnscroll/chat/"+data+"";
//                 	console.log('접속할 url은 '+url);
                	window.location.href="/returnscroll/chat/"+data;
//                 	window.open(url); // 접속 성공했고, 
                	// friendId에게 채팅방에 초대됬다는 알람을 보내줌
                	inviteFriend(data, uid, friendId); 
                	
                },
                error:function(request, status, errorThrown){
                   alert('방 생성 실패ㄴ');
                }
             })
    	}
  		// 방번호, 보내는 사람 아이디, 받는사람 아이디를 보내줌,
  		function inviteFriend(roomNumber, sender, recipient){
  			var chatInvite = {"roomNumber":roomNumber,"sender":sender,"recipient":recipient};
  			// 데이터베이스에 집어 넣기
  			$.ajax({
                url:"/returnscroll/friend/friendInviteRoom",
                type:'GET',
                data: chatInvite,
                success:function(data){
                	
                },
                error:function(request, status, errorThrown){
                   alert('방 생성 실패');
                }
             })
  		}
    </script>

</body>

</html>
