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
			ID :  <input name="uid" value="${uid}" readonly="readonly">
		</div>
		<div id="upw">
			Password : <input type="text" name="upw" maxlength="15">
		</div>

		<!-- submit 서버와 통신을 하게 되는 버튼 -->
		<input type="submit" value="회원탈퇴">

	</form>
	
	
</body>
</html>
