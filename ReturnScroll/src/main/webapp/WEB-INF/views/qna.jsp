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
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
<body>

	<jsp:include page="side.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Plugin JavaScript -->
		  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Custom scripts for this template -->
		  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
<hr>
<hr>
<h1>Q&A</h1>
<hr>
<div class="search">
	<div class="container-1" style="float:right; margin-right: 2.5%; margin-bottom: 1%">
		<input type="text" placeholder="search" id="searchText" name="searchText">
		<a href="" id="searchBtn"><i class="fa fa-search"></i></a>
	</div>
</div>



<table class="table" style="width:95%; margin: 0 auto;">
<thead class="thead-dark" style="text-align:center;">
<th style="width:10%;"> 번호 </th>
<th style="width:55%;"> 제목 </th>
<th style="width:10%;"> 작성자 </th>
<th style="width:15%;"> 작성일 </th>
<th style="width:10%;"> 조회수</th>
</thead>
<tbody>


	<c:forEach items="${list}" var="item">

		<tr onClick ="location.href='show/${item.NO}'" style="text-align:center;">
		<td >${item.NO}</td>
		<td style="text-align:left;">${item.TITLE}</td>
		<td >${item.WRITER}</td>
		<td >${item.WRITE_DATE}</td>
		<td >${item.HIT}</td>
		</tr>
		
	</c:forEach>
	
	</tbody>
</table>
<hr>
<div>

<input type ="button" value="글쓰기" onclick="location.href='write'" class="btn btn-info" style="float:right; margin-right:2.5%; margin-bottom: 0.5%;">
</div>
<div class="container" style="width:90%;" >
  <ul class="pagination" style="justify-content: center;">
    <% int t = (Integer)request.getAttribute("total"); 
    	int showNum = t / 10;
    	if(t % 10 != 0) {
    		showNum++;
    	}
    	
    	int nowPage = (Integer)request.getAttribute("page");
    	int startPage = nowPage / 10 * 10;
    	if(nowPage % 10 != 0) {
    		startPage++;
    	} else {
    		startPage -= 9;
    	}
    	
    	int endPage = startPage + 9;
    	if(endPage > showNum) {
    		endPage = showNum;
    	}
    	
    	request.setAttribute("showNum", showNum);
    	request.setAttribute("startPage", startPage);
    	request.setAttribute("endPage", endPage);
    	request.setAttribute("nowPage", nowPage);

    	
    %>
    <c:if test='${page > 10}'>
    	<li class="page-item"><a class="page-link" href="qna?page=${startPage - 10}">Previous</a></li>
    </c:if>
    <c:if test='${page <= 10}'>
    	<li class="page-item disabled"><a class="page-link" href="qna?page=${startPage - 10}">Previous</a></li>
    </c:if>

    <c:forEach begin="<%=startPage %>" end="<%=endPage%>" var="pnum" step="1">
    	<c:if test='${nowPage == pnum}'> 
    		<li class="page-item active">
    	</c:if>
    	<c:if test='${nowPage != pnum}'> 
    		<li class="page-item">
    	</c:if>
    	<a class="page-link" href="qna?page=${pnum}&searchText=${searchText}">${pnum}</a></li>
    </c:forEach>
    
    <c:if test='${endPage < showNum}'>
    	<li class="page-item"><a class="page-link" href="qna?page=${startPage + 10}">Next</a></li>
    </c:if>
     <c:if test='${endPage >= showNum}'>
    	<li class="page-item disabled"><a class="page-link" href="qna?page=${startPage + 10}">Next</a></li>
    </c:if>
  </ul>
</div>
<script>
	$("#searchBtn").click(function() {
		var searchText = $('#searchText').val();
		location = 'qna?searchText=' + searchText;
		
		return false;
	})
</script>

<hr>
</body>
