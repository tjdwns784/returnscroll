<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>returnscroll 회원수정</title>
</head>
<body>


<h1>회원정보 수정</h1>

	<form action="userUpdateAction" method="post">

		<div id="uid">
			ID : <input name="uid" value="${uid}" readonly="readonly" >
		</div>
		<div id="upw">
			Password : <input type="text" name="upw" maxlength="15">
		</div>
		<div id="nick">
			닉네임 : <input type="text" name="nick" maxlength="10">
		</div>
		<div id="phone">
			핸드폰 : <input type="text" name="phone" maxlength="13">
		</div>
		<div id="email">
			이메일 : <input type="email" name="email" maxlength="55">
		</div>

		<!-- submit 서버와 통신을 하게 되는 버튼 -->
		<input type="submit" value="정보수정">
		<input type="submit" value="로그아웃"></a>
		<a href="/userDelete"><input type="button" value="회원탈퇴"></a>

	</form>

</body>
</html>