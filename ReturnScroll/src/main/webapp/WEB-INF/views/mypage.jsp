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
<style>
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css); 
  body, table, div, p ,h1,button, td,option{font-family:'Nanum Gothic'; font-weight:bold;} 
  
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

 <!-- Navigation -->
<jsp:include page="side.jsp"></jsp:include>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

<h1 style="margin-left:5%;margin-top:2%;">My Page</h1>
<hr style="width:90%; background:#FFCC33; height:2px" >
<br><br>
<div style="width:90%; margin: 0 auto;">
	<ul class="list-group">					
					
		<li class="list-group-item">아이디 : ${map.uid}</li>				
		<li class="list-group-item">이름 : ${map.uname}</li>				
		<li class="list-group-item">별명 : ${map.nick}</li>				
		<li class="list-group-item">생년월일 : ${map.birth}</li>				
		<li class="list-group-item">휴대폰 : ${map.phone}</li>				
		<li class="list-group-item">이메일 : ${map.email}</li>	
	</ul>		
		<br><br><br><br>
		
		<div style="text-align:center;">
		<button id="edit" 				
			onclick='userUpdate()' style="height:40px; font-size: 17px;">수정</button>
		<button id="del"			
			onclick='userDelete()' style="height:40px; font-size: 17px;">회원탈퇴</button>			
		</div>


  </div>
  
  <div>
	<br><br><br><br>
    <hr style="width:90%; background:#FFCC33; height:2px" >
      <p class="text-muted small mb-0" style="text-align:center;">Copyright &copy; ReturnScroll 2019</p>
      </div>

	<script>				
		function userUpdate() {			
			location = '/returnscroll/userUpdate';		
		}			
					
		function userDelete() {			
			location = '/returnscroll/userDelete';		
		}			
		
	</script>	
</body>

</html>
