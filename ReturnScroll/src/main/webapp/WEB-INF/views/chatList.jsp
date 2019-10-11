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

  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container my-auto">
      <h1 class="mb-1">Return Scroll 채팅방</h1>
      
      	<!-- 모달창 -->
	<div id="modal">
   
	    <div class="modal_content">
        	<button type="button" id="modal_close_btn" style='border: none;background: none;float: right;padding-right: 50px;'>
        	<img src="resources/img/error.png" style='width: 20px;'></button>
	        <h4 style='display: inline-block;'>${uid} 님의 친구 목록</h4><br>
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
	   
	    <div class="modal_layer"></div>
    
	</div>
      
	<section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- DIRECT CHAT -->
                <div class="box box-warning direct-chat direct-chat-warning" style="padding:50px;">
                    <!-- 채팅 방 표시, 방 바꾸기 -->
                    <div id="putUser" style='float: right;'>${uid}님 반갑습니다</div>
                    <div class="box-header with-border">
                        <h1 class="box-title">채팅방 리스트</h1><br>
                        <c:if test="${not empty addFriend}">
                           <div id="addFriend"></div>
                           <div class='dropdown' style='float: right;'>
                              <button class='btn btn-default' type='button' data-toggle='dropdown' style='border: none;background: none; display: inline-block;'>
                            <span class='caret'><img src="resources/img/alarm.png" style='width: 20px;'></span>
                         </button>
                          <c:forEach var="list" items="${addFriend }" varStatus="count" >
                         <ul class='dropdown-menu' style='list-style:none;'>
                            <li><a class='dropdown-item disabled' style='padding-bottom:10px;padding-top:10px;'>${list.sender}님이 친구신청을 하였습니다</a></li>
                           <li><a class='dropdown-item' style='padding-bottom:10px;padding-top:10px;'>
                           <input type='hidden' id='senderId' value='${list.sender}'/>
                              <button type='button' id='friendYes' >수락하기</button>
                              <button type='button' id='friendNo'>거절하기</button></a></li>
                        </ul>
                        </c:forEach>
                     	</div>
                        </c:if>
                        
                    </div>
                    
                    
                    
                    <!-- 채팅 메세지 표시 -->
                    <div class="box-body">
                        <!-- Conversations are loaded here -->
                        <div class="direct-chat-messages">
	                        <table class="table">
							    <thead>
							      <tr>
							        <th>채팅방 NO</th>
							        <th>채팅방 명</th>
							        <th>현재 접속자 수</th>
							        <th> </th>
							      </tr>
							    </thead>
							    <c:forEach var="list" items="${list }" varStatus="count" >
							    <tbody>
							      <tr>
							        <td>${list.ID }</td>
							        <td>${list.NAME }</td>
							        <td>${list.people }</td>
							        <td><button onclick="location.href='/returnscroll/chat/${list.ID }'" class="btn btn-warning btn-flat">입장</button></td>
							      </tr>
							    </tbody>
							    </c:forEach>
						  </table>
                          
                        </div>
                        <div style='margin-bottom: 10px;margin-right: 10px;float: right;'>
	                        <button onclick="location.href='/returnscroll/chat/createRoom'" class="btn btn-warning btn-flat">채팅방 생성</button>
<!-- 	                        <button onclick="location.href='/returnscroll/chat/allRoom'" class="btn btn-warning btn-flat">전체 방 보기</button> -->
	                        <button onclick="location.href='/returnscroll/friend'" id='friendList' type="button" class="btn btn-warning btn-flat">친구관리</button>
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
    <div class="overlay"></div>
  </header>
  



  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul>
      <p class="text-muted small mb-0">Copyright &copy; Your Website 2019</p>
    </div>
  </footer> 

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <input type='hidden' id='nick' value='${nick}'>
  <input type='hidden' id='recipient' value='${uid}'>
  <input type='hidden' id='userID' value='${uid}'>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
  
  <script src="http://192.168.0.3:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>

<script>
       $('#friendYes').click(function(){
          var sender = $('#senderId').val();
          var recipient = $('#recipient').val();
          var data = {"sender" : sender , "recipient" : recipient};
          console.log('친구수락 버튼을 눌렀을 때 보내려는 데이터 : '+data.sender+","+data.recipient);
          
          $.ajax({
            url:"http://localhost:8080/returnscroll/chat/addfriend",
            type:'GET',
            data: data,
            success:function(data){
               //console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
                  alert(data+'님의 친구요청을 수락하였습니다.')
            },
            error:function(request, status, errorThrown){
               alert('친구요청 수락 실패');
            }
         })
       });
       $('#friendNo').click(function(){
          var sender = $('#senderId').val();
          var recipient = $('#recipient').val();
          var data = {"sender" : sender , "recipient" : recipient};
          
          $.ajax({
            url:"http://localhost:8080/returnscroll/chat/addfriendReject",
            type:'GET',
            data: data,
            success:function(data){
               //console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
                  alert(data+'님의 친구요청을 거절하였습니다.')
            },
            error:function(request, status, errorThrown){
               alert('친구요청 수락 실패');
            }
         })
       });
    </script>
    
    <script type="text/javascript">
//     $("#friendList").click(function(){
//         $("#modal").fadeIn();
//     });
   
//      $("#modal_close_btn").click(function(){
//         $("#modal").fadeOut();
//     });    

    </script>
    
    <script>
    	function deleteFriend(friendId){
    		var userId = $('#userID').val();
    		var data = {"userId" : userId , "friendId" : friendId};
    		console.log('친구 삭제 할때 보내는 데이터 값 '+data.userId +",  "+data.friendId);
    		var check = confirm(friendId+"님을 삭제하시겠습니까?");
        	  if(check) {
        		  alert("확인버튼 클릭");
        		  $.ajax({
                      url:"http://localhost:8080/returnscroll/chat/deleteFriend",
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

</body>

</html>
