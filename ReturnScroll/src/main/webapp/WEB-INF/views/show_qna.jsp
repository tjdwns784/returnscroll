<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Q&A</title>
        <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=8bb7eb66-3a4e-4c6c-82b2-57eb56626ed2"></script>
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
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- Navigation -->
    <jsp:include page="side.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Plugin JavaScript -->
		  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Custom scripts for this template -->
		  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
         

번호 : ${article.NO}
<br>
제목 : ${article.TITLE}
<br>
내용 : ${article.CONTENT}
<br>
조회수 : ${article.HIT}
<br>
작성자 : ${article.WRITER}
<br>
작성일자 : ${article.WRITE_DATE}
<br>

<button id="btnUpdate"  onclick="location.href='../articleUpdate/${article.NO}'">수정</button>
<button id="btnDelete"  onclick="location.href='../articleDelete/${article.NO}'">삭제</button>
<button id="btnQna"  onclick="location.href='../qna'">목록</button>
<hr>

<script>

var userid ="${uid}";
var artid = "${article.WRITER}";

 if(userid != artid ){
		$("#btnUpdate").hide();
		$("#btnDelete").hide();
 }
 
</script>



댓글: <input type="text" id="comment">
<button onclick="addComment()">작성완료</button>
<hr>

<table class="table" style="width:95%; margin: 0 auto;">
	<thead class="thead-dark" style="text-align:center;">
	<tr>
		<th style="width:10%;"> 작성자 </th>
		<th style="width:70%;"> 내용 </th>
		<th style="width:15%;"> 작성일</th>
		<th style="width:5%;"> 비고 </th>
	</tr>
	</thead>
	 <tbody>
	<c:forEach items="${list2}" var="item">
		<tr>
			<td>${item.WRITER}</td>
			<td>${item.CONTENT}</td>
			<td>${item.WRITE_DATE}</td>
			<td>
				<c:if test='${item.WRITER == uid}'><a href="../commentDelete/${item.CNO}?no=${article.NO}"> 삭제</a></c:if>
				
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>



<script src="http://code.jquery.com/jquery-3.1.1.min.js"> </script>
<script>
function addComment(){
	var comment = $("#comment").val();
	$.ajax({
		url:"../addComment",
		data:{
			"writer":"${uid}",
			"article_no":"${article.NO}",
			"content":comment		
		},
		success:function(res){
			//alert("댓글달기완료");
			$("#comment").val("");
			location.reload();
		}
	})
}

</script>

</body>