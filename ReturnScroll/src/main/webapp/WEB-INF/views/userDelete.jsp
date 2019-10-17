<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>returnscroll 회원탈퇴</title>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css"
	rel="stylesheet">
	
	<style>
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
  
  body, table, div, p, h1, form {font-family:'Nanum Gothic'; font-weight:bold;}

	input[type=button], input[type=submit]{
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
	input[type=button]:hover, input[type=submit]:hover{
	  background:#fff;
	  color:#000000;
	}
	input[type=button]:before,input[type=button]:after, input[type=submit]:before,input[type=submit]:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #000000;
	  transition:400ms ease all;
	}
	input[type=button]:after, input[type=submit]:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	input[type=button]:hover:before,input[type=button]:hover:after, input[type=submit]:hover:before,input[type=submit]:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	a.menu-toggle > i {
		margin-top: 18px;
	}

	 @media (max-width: 600px) {
  		#btn {
  			margin-left:60px;
  		}
  		
		#h1_title{
			font-size:2rem;
		}
  }
    
  </style>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	<div id="body">
	<h1 id="h1_title" style="margin-left:5%;margin-top:2%;">회원탈퇴</h1>
	<hr style="width:95%; background:#FFCC33; height:2px" >
	<div style="width:90%; margin:0 auto">
	
	<form action="userDeleteAction" method="post">
		<div id="uid">
			아이디&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp; <input name="uid" value="${uid.uid}" readonly="readonly" required="required">
		</div>
		<br>
		<div id="upw">
			비밀번호 : &nbsp; <input type="password" name="upw" maxlength="15" required="required">
		</div>
	<br>
	<div id="btn">
		<a href="/returnscroll/mypage"><input type="button" value="이전" style="margin-left: 4.5%;"></a>
		<input type="submit" id="bye" name="bye" url="/returnscroll/userDeleteAction"  value="탈퇴" style="margin-bottom:1%">
	</div>
	<img id=bye src="/returnscroll/resources/img/또르르.jpg" style="width:40%">
	</form>
	</div>
      <jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
	<script>
		function enterkey() {
	        if (window.event.keyCode == 13) {
	             // 엔터키가 눌렸을 때 실행할 내용
	        	  var action = $('#bye').attr("url");
	 	          var form_data = {
	 	              "uid" : $('[name=uid]').val(),
	 	              "upw" : $('[name=upw]').val()
	 	         };
	 	         $.ajax({
	 	            type : "POST",
	 	            url : action,
	 	            data : form_data,
	 	            success : function(res) {
	 	            	
	 	               if (res == "success") {
	 	                  alert("회원탈퇴가 완료되었습니다. 그 동안 이용해주셔서 감사합니다!");
	 	                  location = "/returnscroll/index"
	 	               } else {
	 	                  alert("비밀번호가 잘못되었습니다");
	 	               }
	 	            },
	 	            error : function() {
	 	               alert("Error");
	 	            }
	 	            
	 	         });
	 	         return false;
	           
	        }
		}
	    $('#bye').click(function() {
	    	  var action = $('#bye').attr("url");
	          var form_data = {
		 	      "uid" : $('[name=uid]').val(),
		 	      "upw" : $('[name=upw]').val()
	         };
	         $.ajax({
	            type : "POST",
	            url : action,
	            data : form_data,
	            success : function(res) {
	            	
	               if (res == "success") {
	                  alert("회원탈퇴가 완료되었습니다. 그 동안 이용해주셔서 감사합니다!");
	                  location = "/returnscroll/index"
	               } else {
	                  alert("비밀번호가 잘못되었습니다");
	               }
	            },
	            error : function() {
	               alert("Error");
	            }
	         });
	         return false;

	      });
	    </script>
</html>
