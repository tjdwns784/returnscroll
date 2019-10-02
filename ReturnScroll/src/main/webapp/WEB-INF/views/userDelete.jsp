<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>returnscroll 회원탈퇴</title>
</head>
<body>
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
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
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
