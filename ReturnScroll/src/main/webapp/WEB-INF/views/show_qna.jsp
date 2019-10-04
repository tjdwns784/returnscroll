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

var userid ="${unick}";
var artid = "${article.WRITER}";

 if(userid != artid ){
		$("#btnUpdate").hide();
		$("#btnDelete").hide();
 }
 
</script>


<div style="text-align :center;">
<input type="text" id="comment" style="width: 90%; height:10%;" onkeydown="enterkey();">
<button onclick="addComment()" style="height:10%;">등록</button>
</div>
<hr>

<table class="table" style="width:95%; margin: 0 auto;">
	 <tbody>
	<c:forEach items="${list2}" var="item">
		<tr style="text-align:center;">
			<td style="width:10%;">${item.WRITER}</td>
			<td style="width:70%; text-align:left;">${item.CONTENT}</td>
			<td style="width:15%;">${item.WRITE_DATE}</td>
			<td style="width:5%;">
				<c:if test='${item.WRITER == unick}'><a href="../commentDelete/${item.CNO}?no=${article.NO}"> 삭제</a></c:if>				
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="container" style="width:90%;">
  <ul class="pagination">
  <%
  	int ct = (Integer) request.getAttribute("cTotal");
  	int showNum = ct/10;
  	if(ct%10 != 0){
  		showNum++;
  	}
  	
  	int nowPage = (Integer)request.getAttribute("page");
  	int startPage = nowPage /10 * 10;
  	if(nowPage % 10 !=0){
  		startPage++;
  	}else{
  		startPage -=9;
  	}
  	
  	int endPage = startPage + 9;
  	if(endPage > showNum){
  		endPage = showNum;
  	}
  	
  	request.setAttribute("showNum", showNum);
  	request.setAttribute("startPage", startPage);
  	request.setAttribute("endPage", endPage);
  	request.setAttribute("nowPage", nowPage);
  
  %>
     <c:if test='${page > 10}'>
    	<li class="page-item"><a class="page-link" href="../show/${no}?page=${startPage - 10}">Previous</a></li>
    </c:if>
    <c:if test='${page <= 10}'>
    	<li class="page-item disabled"><a class="page-link" href="../show/${no}?page=${startPage - 10}">Previous</a></li>
    </c:if>
    
    <c:forEach begin="${startPage}" end="${endPage}" var="pnum" step="1">
	   <c:if test='${nowPage == pnum}'> 
    		<li class="page-item active">
    	</c:if>
    	<c:if test='${nowPage != pnum}'> 
    		<li class="page-item">
    	</c:if>
    	<a class="page-link" href="../show/${no}?page=${pnum}">${pnum}</a></li>    
    </c:forEach>
   
    <c:if test='${endPage < showNum}'>
    	<li class="page-item"><a class="page-link" href="../show/${no}?page=${startPage + 10}">Next</a></li>
    </c:if>
     <c:if test='${endPage >= showNum}'>
    	<li class="page-item disabled"><a class="page-link" href="../show/${no}?page=${startPage + 10}">Next</a></li>
    </c:if>
  </ul>
</div>



<script src="http://code.jquery.com/jquery-3.1.1.min.js"> </script>
<script>
function addComment(){
	var comment = $("#comment").val();
	$.ajax({
		url:"../addComment",
		data:{
			"writer":"${unick}",
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
function enterkey() {
    if (window.event.keyCode == 13) {
    	addComment();
	};
}
</script>

</body>