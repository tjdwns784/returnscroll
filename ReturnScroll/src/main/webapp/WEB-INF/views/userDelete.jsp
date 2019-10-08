<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	<h1>회원탈퇴</h1>
	
	<form action="userDeleteAction" method="post">

		<div id="uid">
			ID :  <input name="uid" value="${uid}" readonly="readonly" required="required">
		</div>
		<div id="upw">
			Password : <input type="password" name="upw" maxlength="15" required="required">
		</div>

		<input type="submit" id="bye" name="bye" url="/returnscroll/userDeleteAction"  value="회원탈퇴">

	</form>
	
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
