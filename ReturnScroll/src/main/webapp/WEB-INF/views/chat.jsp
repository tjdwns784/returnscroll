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
  <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.less" />
	<script src="less.min.js" ></script>
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
  width:300px;
  margin:100px auto;
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
    <div class="container text-center my-auto">
      <h1 class="mb-1">Return Scroll 채팅방</h1>
      
      	<!-- 모달창 -->
	<div id="modal">
   
    <div class="modal_content">
        <h2>친구초대</h2><br>
        <p>초대할 친구를 검색하세요</p>
        <form method="GET" id="find">
	        ID : <input type="text" name="uid" id="uid">
        </form>
	    <button id="findId">검색</button>
        
         <br>
        
        <div id="uidList" ></div>

        <button type="button" id="modal_close_btn">창 닫기</button>
      
    </div>
   
    <div class="modal_layer"></div>
    
	</div>
      
	<section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- DIRECT CHAT -->
                <div class="box box-warning direct-chat direct-chat-warning">
                    <!-- 채팅 방 표시, 방 바꾸기 -->
                    <div class="box-header with-border">
                        <h3 class="box-title">수빈이의 채팅방</h3>
                        <br>
					<div id="members">
						<h6>현재 대화 참여자 :</h6> 
					</div>
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
                            <input type="text" name="message" placeholder="메세지를 입력하세요" class="form-control">
                            <span class="input-group-btn">
                                <button id='sendBtn' type="button" class="btn btn-warning btn-flat">보내기</button>
                                <button id='addFriend' type="button" class="btn btn-warning btn-flat">친구추가</button>
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

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
  
  <script src="http://192.168.0.95:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="resources/chat.js?ver=1"/></script>
    
    <!-- 모달 띄우고 내리는거 -->
    <script type="text/javascript">
    $("#addFriend").click(function(){
        $("#modal").fadeIn();
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").fadeOut();
    });    
    </script>
    
    <!-- 아이디로 친구 찾기 -->
	<script>
		$(document).on('click','#findId',function(){
			// 입력한 아이디값 받기
 			var uid = $('#uid').val();
 			var postData = {"uid" : uid};
			console.log(postData);

			$.ajax({
				url:"http://localhost:8080/returnscroll/chat/findId",
				type:'GET',
				data: postData,
				success:function(data){
					console.log('결과데이터는'+data);
					$("#uidList").append(data+"<a href='/returnscroll/chat/addUser/"+data+"'>추가하기</a>");
				},
				error:function(request, status, errorThrown){
					alert('아이디를 다시 입력하세여');
				}
			})
		});
	</script>
</body>

</html>
