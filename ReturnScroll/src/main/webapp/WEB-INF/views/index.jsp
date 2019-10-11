
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>귀환주문서 홈</title>

  <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	
	<style>
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
  
  body, table, div, a, li, ul{font-family:'Nanum Gothic';}
  
   button{
	  background:#000000;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:40px;
	  font-size:1em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	button:hover{
	  background:#fff;
	  color:#000000;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #000000;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}

  </style>
   <div style="text-align:center;">
   <c:if test="${not empty inviteList }">
		<div class='dropdown' style='z-index:1;display: flex;'>
			<button data-toggle='dropdown' id='alarms' style='border: none; background: none; display: inline-block;width: fit-content; height: auto;'>
				<span class='caret'>
				<img src="resources/img/alarm.png" style='width: 50px; margin: 5px;'></span>
			</button>
			<c:forEach var="list" items="${inviteList }" varStatus="count">
				<ul class='dropdown-menu' style='list-style: none;'>
					<li><a class='dropdown-item disabled'
						style='padding-bottom: 10px; padding-top: 10px;'>${list.s}님이 회원님을 ${list.num }번 방으로 초대하였습니다</a></li>
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
       <img src="resources/img/img_returnscroll1.png" style="max-width:100%; height:auto;"><br>
      
      <button onclick="location.href='/returnscroll/login'">Login</button>
      <br><br><br>
      <hr style="width:90%; background:#FFCC33; height:2px" >
      <p class="text-muted small mb-0">Copyright &copy; ReturnScroll 2019</p>
  </div>

  <!-- Header -->

  <header class="masthead d-flex">
  
    <div class="container text-center my-auto">
       <img src="resources/img/리턴스크롤.jpg" style="margin-top:-10%" >
       <br>
      <h1 class="mb-1" style="margin-top:-2%">Return Scroll</h1>
      <h3 class="mb-5">
        <em>집에 조심히 가자구~!</em>
        <img src="resources/img/혼신의힘을다한작품.jpg" style="max-width:100%; height:auto;">
      </h3>
      <a class="btn btn-primary btn-xl js-scroll-trigger" href="/returnscroll/login">Login</a>
    </div>
    <div class="overlay"></div>
  </header>


  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
      <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	<script>
		// 초대수락
		function enterInvite(roomNumber, sender, recipient){
			var inviteData = {"roomNumber": roomNumber,"sender": sender,"recipient": recipient}
			console.log('초대수락 버튼 ');
			console.log("데이터 : "+inviteData.roomNumber+", "+inviteData.sender+", "+inviteData.recipient);
			$.ajax({
                url:"http://localhost:8080/returnscroll/friend/friendInviteCheck",
                type:'GET',
                data: inviteData,
                success:function(data){
                	console.log('결과 데이터는 '+data);
                	window.location.href="http://localhost:8080/returnscroll/chat/"+data;
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
                url:"http://localhost:8080/returnscroll/friend/friendInviteCheck",
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
