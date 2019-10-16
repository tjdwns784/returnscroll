<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
      	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
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
  
  <%-- 
  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" > 
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    --%>
  <style>
 
   @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

  body, table, div, p ,h1,button, td,option{font-family:'Nanum Gothic';} 
   
   .table-hover > tbody > tr:hover {
      background-color: #CCCCCC;
    }
    
    a.page-link {
		color:#662500;
	}
	
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
 	
	
	#writeBtn {
	
		float:right; 
		margin-right:5%;
		margin-bottom: 0.5%;
			
	}
	@media (max-width : 600px){
	
		#writeBtn {
			text-align :center;
			float:none;
			margin-right:-5%
		}
		
		#h1_title{
			font-size:2rem;
		}
	}

  /* .masthead {
  	padding-top: 4rem; 
  } */
  </style>
    </head>
<body id="page-top">
	<jsp:include page="side.jsp" ></jsp:include>

	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
	<!-- Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
	<!-- Custom scripts for this template -->
	<script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

 <!--  <header class="masthead d-flex"> -->

   <!--  <div class="container my-auto"> -->
 
<div id="body">
<h1 id="h1_title" style="margin-left:5%;margin-top:2%;">Q&A 게시판</h1>
<!-- <h1 class="mb-1">Q&A 게시판</h1> -->
<hr style="width:95%; background:#FFCC33; height:2px" >



	<div class="order d-none d-lg-block" style="float:left; margin-left: 5%;">
		<select id="orderItem" name="orderItem" style="height: 40px;width: 70px">
			<option value="o_no" selected>번호순</option>
			<option value="o_date" <c:if test='${param.searchOrd == "o_date"}'>selected</c:if>>최신순</option>
			<option value="o_hit" <c:if test='${param.searchOrd == "o_hit"}'>selected</c:if>>조회순</option>
		</select>
		<button onclick="location.href='qna?searchText= ' +'&searchItem= ' + '&searchOrd= ';"> 목록고침 </button>
	</div>
	<div class="search" style="float:right; margin-right: 5%; margin-bottom: 1%">
		<select id="searchItem" name="searchItem" style="height: 40px;width:100px">
			<option value="a_no">번호</option>
			<option value="a_title"  selected="selected">제목</option>
			<option value="a_content">내용</option>
			<option value="a_writer">작성자</option>
			<option value="a_tnc">제목+내용</option>
		</select>
		<input type="text" placeholder="search" id="searchText" name="searchText"  onkeydown="enterkey();" style="height: 40px;width:250px">
		<a href="" id="searchBtn"><i class="fa fa-search"></i></a>
	</div>



<table class="table table-hover" style="width:90%; margin: 0 auto; text-align:center;">
<thead class="thead-dark" style="text-align:center;" >
<tr >
<th  class="d-none d-lg-table-cell" style="width:10%;" >번호</th>
<th  class="d-none d-lg-table-cell" style="width:55%;" >제목</th>
<th  class="d-none d-lg-table-cell" style="width:10%;" >작성자</th>
<th  class="d-none d-lg-table-cell" style="width:15%;" >작성일</th>
<th  class="d-none d-lg-table-cell" style="width:10%;" >조회수</th>
</tr>
</thead>
<tbody>
	<c:forEach items="${list}" var="item">

	<%-- 	<tr  onClick ="location.href='show/${item.NO}'" style="cursor:pointer;" > --%>
	<tr>
		<td  >${item.NO}</td>
		<td style="text-align:left; cursor:pointer;" ><a href="show/${item.NO}" >${item.TITLE}</a>
			<c:if test='${item.CMT_CNT > 0}'>
			[${item.CMT_CNT}]
			</c:if>
		</td>
		<td class="d-none d-lg-table-cell">${item.WRITER}</td>
		<td class="d-none d-lg-table-cell">${item.WRITE_DATE}</td>
		<td class="d-none d-lg-table-cell">${item.HIT}</td>
		</tr>
		
	</c:forEach>
	
	</tbody>
</table>
<hr style="width:90%;" >
<div class="d-none d-lg-block">
<button onclick="location.href='qna?searchText=${unick}' +'&searchItem=a_writer' + '&searchOrd= ';" style="float: left;  margin-right: 1%; margin-left:5%"> 내게시글 </button>
<button onclick="location.href='qna?searchText=${unick}' +'&searchItem=c_writer' + '&searchOrd= ';" style="float: left;"> 내댓글 </button>
</div>
<div id="writeBtn">
<button  onclick="location.href='write'" > 글쓰기 </button>
</div>
<%-- 
<input type ="button" value="글쓰기" onclick="location.href='write'" class="btn btn-info" style="float:right; margin-right:2.5%; margin-bottom: 0.5%;">
<input type ="button" value="내댓글" onclick="location.href='qna?searchText=${unick}' +'&searchItem=c_writer' + '&searchOrd= ';" class="btn btn-info" 
				style="float: right; margin-right: 1%;">
<input type ="button" value="내게시글" onclick="location.href='qna?searchText=${unick}' +'&searchItem=a_writer' + '&searchOrd= ';" class="btn btn-info" 
				style="float: right; margin-right: 1%;"> --%>
<br>
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
    	<li class="page-item"><a class="page-link" href="qna?page=${startPage - 10}">◀</a></li>
    </c:if>
    <c:if test='${page <= 10}'>
    	<li class="page-item disabled"><a class="page-link" href="qna?page=${startPage - 10}">◀</a></li>
    </c:if>

    <c:forEach begin="<%=startPage %>" end="<%=endPage%>" var="pnum" step="1">
    	<c:if test='${nowPage == pnum}'> 
    		<li class="page-item active">
    		<a class="page-link" style="background-color:#FFCC33; border-color: #FFCC33;" href="qna?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    	<c:if test='${nowPage != pnum}'> 
    		<li class="page-item">
    		<a class="page-link" href="qna?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    </c:forEach>
    
    <c:if test='${endPage < showNum}'>
    	<li class="page-item"><a class="page-link" href="qna?page=${startPage + 10}">▶</a></li>
    </c:if>
     <c:if test='${endPage >= showNum}'>
    	<li class="page-item disabled"><a class="page-link" href="qna?page=${startPage + 10}">▶</a></li>
    </c:if>
  </ul>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>

<script>
	function enterkey() {
	    if (window.event.keyCode == 13) {
	    	var searchText = $('#searchText').val();
			var searchItem = $('#searchItem').val();
			var searchOrd = $('#orderItem').val();
			location = 'qna?searchText=' + searchText +'&searchItem=' + searchItem +'&searchOrd=' +searchOrd;
			
			return false;
		};
	}
	$("#searchBtn").click(function() {
		var searchText = $('#searchText').val();
		var searchItem = $('#searchItem').val();
		var searchOrd = $('#orderItem').val();
		location = 'qna?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
		
		return false;
	})
	$("#orderItem").change(function(){
		var searchText = $('#searchText').val();
		var searchItem = $('#searchItem').val();
		var searchOrd = $('#orderItem').val();
		location = 'qna?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
	
	})
	
</script>
</body>
