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
 /*  width:500px;
  margin-left: 200px; */
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


      <div id="modal">
   
	    <div class="modal_content">
	        <h2 style="text-align: center;">친구초대</h2><br>
	        <p style="text-align: center;">초대할 친구를 검색하세요</p>
	        <form method="GET" id="find"  style="text-align: center;">
		        <input type="text" name="uid" id="uid" style="width: 250px; height: 35px;" placeholder="초대할 회원의 닉네임을 입력해주세요">
		    	<button id="findId" class="btn btn-warning btn-flat" style="float: right; margin: unset; width: 50px; text-align: center; font-size: 10px; height: 35px;" >검색</button>
			</form>
	        
	         <br>
	        <div id="searchResult" style="padding-bottom: 10px;"></div>
	          <table class="table">
			    <thead>
			      <tr>
			        <th>ID</th>
			        <th>닉네임</th>
			        <th></th>
			      </tr>
			    </thead>
			    <tbody id="tbody">
			      <tr>
<!-- 			        <td id="number"></td> -->
<!-- 			        <td id="findUserId"></td> -->
<!-- 			        <td id="findUserNick"></td> -->
<!-- 			        <td id="inviteLink"></td> -->
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
                <div class="box box-warning direct-chat direct-chat-warning" '>
                    <h5 style='display: inline-block; padding-top:10px;'>${uid.uid} 님의 친구 목록</h5><br>
                    <c:if test="${not empty addFriend}">
                           <div id="addFriend"></div>
                           <div class='dropdown-menu-left' style='float: right;'>
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
                        
                        
			        <div id="searchResult" style="padding-bottom: 10px;"></div>
			          <table class="table" >
					    
					    <c:if test="${not empty friendList}">
					    <c:forEach var="lists" items="${friendList }" varStatus="status" >
					    <tbody>
					      <tr>
					      	<td style="width: 1px;">
						        <c:forEach var="session" items="${sessionList }" >
						        	<c:if test="${not loop_flag}">
							        	<c:if test ="${session eq lists.friendId}">
							        		<c:set var="loop_flag" value="true" />
							        		<p><img src="resources/img/on.png" style="width: 25px;"></p>
							        	</c:if>
						        	</c:if>
						        </c:forEach>
						        <c:if test="${not loop_flag}">
						        	<p><img src="resources/img/off.png" style="width: 25px;"></p>
						        </c:if>
					        </td>
					        <td><a href="/returnscroll/friend/${lists.friendId }">${lists.friendId }</a></td>
					      </tr>
					    </tbody>
					    </c:forEach>
					  </c:if>
					  <c:if test="${empty friendList}">
					    <h5>친구목록이 비어있습니다</h5>
					  </c:if>
					  </table>
                    <!-- /.box-footer-->
                </div>
                <!--/.direct-chat -->
                
                <button id='addFriend' type="button" class="btn btn-warning btn-flat" style='float:right; display:grid;'>친구추가</button>

            </div>
        </div>
    </section>
    </div>


  <div class="btn-group btn-group-lg" id="sticker" style='width: inherit;'>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/friend'"><img alt="user" src="/returnscroll/resources/img/user.png" style='width:50px;'></button>
	  <button type="button" class="btn btn-warning btn-flat" onclick="location.href='/returnscroll/chat'"><img alt="user" src="/returnscroll/resources/img/speech-bubble.png" style='width:50px;'></button>
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
  
    <script src="http://192.168.0.15:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    
    <!-- 모달 띄우고 내리는거 -->
    <script type="text/javascript">
 // sticky
// 	$(window).load(function(){
// 		$("#sticker").sticky({topSpacing:0});
// 	});
    $("#addFriend").click(function(){
    	$("#uid").val('');
    	$("#searchResult").empty();
		$("#number").empty();
		$("#findUserId").empty();
		$("#inviteLink").empty();
        $("#modal").fadeIn();
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").fadeOut();
    });    
    </script>
     <!-- 아이디로 친구 찾기 -->
	<script>
		/* 친구 찾기 버튼 누르면 수행됨 */
 		$(document).on('click','#findId',function(){
			// 입력한 아이디값 받기
 			var uid = $('#uid').val();
			console.log('uid값 : '+uid);
 			var postData = {"uid" : uid};
			var dataUrl = "/returnscroll/chat/findId";
			
			$("#uid").val('');
			$("#searchResult").empty();
			$("#number").empty();
			$("#findUserId").empty();
			$("#inviteLink").empty();

			$.ajax({
				url:dataUrl,
				type:'GET',
				data: postData,
				success:function(data){
					console.log('[결과데이터] data: '+data);
					
					
					// console.log('[결과데이터] id: '+data.get('uid')+", nick: "+data.get('nick'));
					// 검색 창 비우기
					$("#uid").empty();
// 					$("#tbody").empty();
					// data
					$("#searchResult").append(uid+" 에 대한 검색결과 입니다.")
					// 검색결과 만큼 데이터가 나와야함
					// 테이블로 고치기!!
// 					<tr>
// 				        <td id="number"></td>
// 				        <td id="findUserId"></td>
// 				        <td id="findUserNick"></td>
// 				        <td id="inviteLink"></td>
// 				      </tr>
					var html = "";
					for (var i=1;i<(Object.keys(data).length);i++){
						html += "<tr><td>"+data['uid']+"</td><td>"+data['nick']+"</td>";
						html += "<td><input type='button' onclick='inviteUser(\""+data['uid']+"\");' value='추가' style='border:none; background:none; display:inline-block;' /></td></tr>"
						
// 						$("#number").append(i);
// 						$("#findUserId").append(data['uid']);
// 						$("#findUserNick").append(data['nick'])
// 						$("#inviteLink").append("<input type='button' onclick='inviteUser(\""+data['uid']+"\");' value='추가하기' style='border:none; background:none; display:inline-block;' />");
					}
					$("#tbody").append(html);
				},
				error:function(request, status, errorThrown){
					$("#searchResult").empty();
					$("#number").empty();
					$("#findUserId").empty();
					$("#inviteLink").empty();
					$("#searchResult").append("검색결과가 없습니당")
					alert('아이디가 존재하지 않습니다');
				}
			})
			
			return false;
		});

	</script>
	<script>
	 function inviteUser(user){

         $("#modal").fadeOut();
           
         alert(user+'님에게 친구추가를 신청했습니다');
         // 채팅에 접속
         var socket = io("http://192.168.0.15:82");
         
         var recipient = user; // 받는사람
         var sender = $('#userID').val();  // 보낸사람
         
         // insert문 수행
         socket.emit('s_add_friend',sender,recipient);
         
         socket.on('c_add_friend_result', function(msg){
            alert(msg);
         })
      }
	</script>

<script>
       $('#friendYes').click(function(){
          var sender = $('#senderId').val();
          var recipient = $('#recipient').val();
          var data = {"sender" : sender , "recipient" : recipient};
          console.log('친구수락 버튼을 눌렀을 때 보내려는 데이터 : '+data.sender+","+data.recipient);
          
          $.ajax({
            url:"/returnscroll/chat/addfriend",
            type:'GET',
            data: data,
            success:function(data){
               //console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
                  alert(data+'님의 친구요청을 수락하였습니다.')
                  window.location.reload();
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
            url:"/returnscroll/chat/addfriendReject",
            type:'GET',
            data: data,
            success:function(data){
               //console.log('유저 닉네임을 받는부분의 결과데이터는'+data);
                  alert(data+'님의 친구요청을 거절하였습니다.');
                  window.location.reload();
            },
            error:function(request, status, errorThrown){
               alert('친구요청 수락 실패');
            }
         })
       });
    </script>
    
    <script type="text/javascript">
    $("#friendList").click(function(){
        $("#modal").fadeIn();
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").fadeOut();
    });    

    </script>
    

</body>

</html>
