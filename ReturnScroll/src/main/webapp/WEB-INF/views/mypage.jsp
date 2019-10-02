<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>returnscroll 마이 페이지</title>

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

<br>						
	<ul class="list-group">					
						
						
		<li class="list-group-item">아이디 : ${map.uid}</li>				
		<li class="list-group-item">이름 : ${map.uname}</li>				
		<li class="list-group-item">별명 : ${map.nick}</li>				
		<li class="list-group-item">생년월일 : ${map.birth}</li>				
		<li class="list-group-item">휴대폰 : ${map.phone}</li>				
		<li class="list-group-item">이메일 : ${map.email}</li>			
			
	<button id="edit" class="btn btn-warning btn-sm"					
			onclick='userUpdate()'>수정</button>			
		<button id="del" class="btn btn-danger btn-sm"				
			onclick='userDelete()'>회원탈퇴</button>			


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

	<script>				
		function userUpdate() {			
			location = '/returnscroll/userUpdate';		
		}			
					
		function userDelete() {			
			location = '/returnscroll/userDelete';		
		}			
					
// 		function checkMyPost() {			
// 			location = '../checkMyPost';		
// 		};			
					
// 		function checkMyReply() {			
// 			location = '../checkMyReply';		
// 		};			
	</script>	
</body>

</html>
