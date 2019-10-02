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
    <div class="container my-auto">
      <h1 class="mb-1">Return Scroll 채팅방</h1>
      
      	<!-- 모달창 -->
	<div id="modal">
   
	    <div class="modal_content">
	        <h2>친구초대</h2><br>
	        <p>초대할 친구를 검색하세요</p>
	        <form method="GET" id="find">
		        ID : <input type="text" name="uid" id="uid" >
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
                    <div id="putUser">현재 접속자 아이디 : ${uid}</div>
                    <div class="box-header with-border">
                        <h1 class="box-title">채팅방 리스트</h1><br>
					<br>
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
							        <td><a href="/returnscroll/chat/${list.ID }">${list.NAME }</a></td>
							        <td>0</td>
							        <td><button>입장</button></td>
							      </tr>
							    </tbody>
							    </c:forEach>
						  </table>
                          
                        </div>
                        <button onclick="location.href='/returnscroll/chat/createRoom'">채팅방 생성</button>
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

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
  
  <script src="http://192.168.0.95:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>

</body>

</html>
