<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
      	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
        <title>관리자 회원 목록</title>
    	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    	 <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">
 
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
	<jsp:include page="../side.jsp" ></jsp:include>

	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
	<!-- Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		
	<!-- Custom scripts for this template -->
	<script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

<div id="body">
<h1 id="h1_title" style="margin-left:5%;margin-top:2%;">회원 목록</h1>
<!-- <h1 class="mb-1">Q&A 게시판</h1> -->
<hr style="width:95%; background:#FFCC33; height:2px" >

	<table class="table table-hover" style="width:90%; margin: 0 auto; text-align:center;">
		<thead class="thead-dark" style="text-align:center;" >
			<tr >
			<th  class="d-none d-lg-table-cell" style="width:5%;" >번호</th>
			<th  style="width:13%;" >아이디</th>
			<th  class="d-none d-lg-table-cell" style="width:10%;" >이름</th>
			<th  class="d-none d-lg-table-cell" style="width:15%;" >별명</th>
			<th  class="d-none d-lg-table-cell" style="width:10%;" >생일</th>
			<th  class="d-none d-lg-table-cell" style="width:10%;" >휴대폰</th>
			<th  class="d-none d-lg-table-cell" style="width:15%;" >이메일</th>
			<th  class="d-none d-lg-table-cell" style="width:10%;" >가입날짜</th>
			<th  style="width:12%;" >비고</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach items="${admin_member}" var="item" varStatus="status">
	
		<tr>
			<td class="d-none d-lg-table-cell">${(page-1)*10+status.count}</td>
			<td>${item.uid}</td>
			<td class="d-none d-lg-table-cell">${item.uname}</td>
			<td class="d-none d-lg-table-cell">${item.nick}</td>
			<td class="d-none d-lg-table-cell">${item.birth}</td>
			<td class="d-none d-lg-table-cell">${item.phone}</td>
			<td class="d-none d-lg-table-cell">${item.email}</td>
			<td class="d-none d-lg-table-cell">${item.date}</td>
			<td>
				<a href="#" style="cursor: pointer" class="delete" uid="${item.uid}">삭제</a>
				<a href="admin_userUpdate/${item.uid}" style="cursor: pointer" class="update">수정</a>
			</td>
			</tr>

		</c:forEach>
	
	</tbody>
</table>
	<div class="container" style="width:90%;" >
  <ul class="pagination" style="justify-content: center; margin-top: 2%; margin-bottom: -3%;">
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
    	<li class="page-item"><a class="page-link" href="admin_member?page=${startPage - 10}">◀</a></li>
    </c:if>
    <c:if test='${page <= 10}'>
    	<li class="page-item disabled"><a class="page-link" href="admin_member?page=${startPage - 10}">◀</a></li>
    </c:if>

    <c:forEach begin="<%=startPage %>" end="<%=endPage%>" var="pnum" step="1">
    	<c:if test='${nowPage == pnum}'> 
    		<li class="page-item active">
    		<a class="page-link" style="background-color:#FFCC33; border-color: #FFCC33;" href="admin_member?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    	<c:if test='${nowPage != pnum}'> 
    		<li class="page-item">
    		<a class="page-link" href="admin_member?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    </c:forEach>
    
    <c:if test='${endPage < showNum}'>
    	<li class="page-item"><a class="page-link" href="admin_member?page=${startPage + 10}">▶</a></li>
    </c:if>
     <c:if test='${endPage >= showNum}'>
    	<li class="page-item disabled"><a class="page-link" href="admin_member?page=${startPage + 10}">▶</a></li>
    </c:if>
  </ul>
</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</div>
<script>
		function enterkey() {
		    if (window.event.keyCode == 13) {
		    	var searchText = $('#searchText').val();
				var searchItem = $('#searchItem').val();
				var searchOrd = $('#orderItem').val();
				location = 'admin_member?searchText=' + searchText +'&searchItem=' + searchItem +'&searchOrd=' +searchOrd;
				
				return false;
			};
		}
		$("#searchBtn").click(function() {
			var searchText = $('#searchText').val();
			var searchItem = $('#searchItem').val();
			var searchOrd = $('#orderItem').val();
			location = 'admin_member?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
			
			return false;
		})
		$("#orderItem").change(function(){
			var searchText = $('#searchText').val();
			var searchItem = $('#searchItem').val();
			var searchOrd = $('#orderItem').val();
			location = 'admin_member?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
		
		})
</script>
<script>
$('.delete').click(function(){
// 	console.log($(this).parent().prev().prev().prev().prev().prev().prev().text())

	var action = confirm('삭제하시겠습니까?')
	if(action) {
		$.ajax({
			url: 'admin_userDelete',
			type: 'post',
			data: {uid: $(this).attr('uid')},
			success: function(res) {
				  if (res == "success") {
		                  alert("회원삭제를 완료하였습니다.");
		                  location.reload();
		               } else {
		                  alert("회원삭제를 실패하였습니다.");
		               }
			}
		})
	}
})
</script>
</body>