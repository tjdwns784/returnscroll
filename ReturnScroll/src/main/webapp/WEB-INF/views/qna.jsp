<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
      	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Q&A</title>
    	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    	 <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" >
    </head>
<body>

	<jsp:include page="side.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Plugin JavaScript -->
		  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Custom scripts for this template -->
		  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
<input type ="button" value="글쓰기" onclick="location.href='write'">
<hr>
<table border="1" >
<th> 번호 </th>
<th> 제목 </th>
<th> 작성자 </th>
<th> 작성일 </th>
<th> 조회수</th>
	<c:forEach items="${list}" var="item">

		<tr onClick ="location.href='show/${item.NO}'">
		<td>${item.NO}</td>
		<td>${item.TITLE}</td>
		<td>${item.WRITER}</td>
		<td>${item.WRITE_DATE}</td>
		<td>${item.HIT}</td>
		</tr>
		
	</c:forEach>
</table>

<hr>
</body>
