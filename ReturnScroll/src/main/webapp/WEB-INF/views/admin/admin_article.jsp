<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
      	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
        <title>관리자 게시물 목록</title>
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
	
	#searchItem {
		height: 40px;
		width:100px;
	}
	
	#searchText {
		height: 40px;
		width:247px;
	}
	
	#pagination {
		justify-content: center; 
		margin-top: 2%; 
		margin-bottom: -3%;
	}
	
	@media (max-width : 600px){
	
		#writeBtn {
			text-align :center;
			float:none;
		}
		
		#h1_title{
			font-size:2rem;
		}
			
		#searchItem {
			width:70px;
			margin-bottom: 3%;
		}
		
		#pagination {
			margin-top: 10%; 
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

<% 
	String userAgent = request.getHeader("user-agent");
	boolean isMobile = false;
	if(userAgent.toLowerCase().indexOf("android") > -1) { // 안드로이드 폰에서 접속
		isMobile = true;
	}
	request.setAttribute("isMobile", isMobile);
%>

<div id="body">
<h1 id="h1_title" style="margin-left:5%;margin-top:2%;">관리자 게시물 목록</h1>
<hr style="width:95%; background:#FFCC33; height:2px" >

		<div class="order d-none d-lg-block" style="float:left; margin-left: 5%;">
				<select id="orderItem" name="orderItem" style="height: 40px;width: 70px">
					<option value="o_no" selected>번호순</option>
					<option value="o_date" <c:if test='${param.searchOrd == "o_date"}'>selected</c:if>>최신순</option>
					<option value="o_hit" <c:if test='${param.searchOrd == "o_hit"}'>selected</c:if>>조회순</option>
				</select>
				<button onclick="location.href='admin_article?searchText= ' +'&searchItem= ' + '&searchOrd= ';"> 목록고침 </button>
			</div>
			<div class="search" style="float:right; margin-right: 5%; margin-bottom: 1%">
				<select id="searchItem" name="searchItem">
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
					<th  class="d-none d-lg-table-cell" style="width:45%;" >제목</th>
					<th  class="d-none d-lg-table-cell" style="width:10%;" >작성자</th>
					<th  class="d-none d-lg-table-cell" style="width:15%;" >작성일</th>
					<th  class="d-none d-lg-table-cell" style="width:10%;" >조회수</th>
					<th  class="d-none d-lg-table-cell" style="width:10%;" >비고</th>
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
				<td>
				<a href="#" style="cursor: pointer" class="delete" no="${item.NO}">삭제</a>
				</td>
				</tr>
				
			</c:forEach>
			
			</tbody>
		</table>
		
		<div class="container" style="width:90%;" >
  <ul id="pagination" class="pagination">
     <% 
	 	int showPageCount = 10;
	 	if(isMobile) {
	 		showPageCount = 5;
	 	}
    
     
     	int t = (Integer)request.getAttribute("total"); 
    	int showNum = t / 10;
    	if(t % 10 != 0) {
    		showNum++;
    	}
    	
    	int nowPage = (Integer)request.getAttribute("page");
    	int startPage = nowPage / showPageCount * showPageCount;
    	if(nowPage % showPageCount != 0) {
    		startPage++;
    	} else {
    		startPage -= (showPageCount - 1);
    	}
    	
    	int endPage = startPage + (showPageCount - 1);
    	if(endPage > showNum) {
    		endPage = showNum;
    	}
    	
    	request.setAttribute("showNum", showNum);
    	request.setAttribute("startPage", startPage);
    	request.setAttribute("endPage", endPage);
    	request.setAttribute("nowPage", nowPage);
    	request.setAttribute("showPageCount", showPageCount);

    	
    %>
    <c:if test='${page > showPageCount}'>
    	<li class="page-item"><a class="page-link" href="admin_article?page=${startPage - showPageCount}">◀</a></li>
    </c:if>
    <c:if test='${page <= showPageCount}'>
    	<li class="page-item disabled"><a class="page-link" href="admin_article?page=${startPage - showPageCount}">◀</a></li>
    </c:if>

    <c:forEach begin="<%=startPage %>" end="<%=endPage%>" var="pnum" step="1">
    	<c:if test='${nowPage == pnum}'> 
    		<li class="page-item active">
    		<a class="page-link" style="background-color:#FFCC33; border-color: #FFCC33;" href="admin_article?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    	<c:if test='${nowPage != pnum}'> 
    		<li class="page-item">
    		<a class="page-link" href="admin_article?page=${pnum}&searchText=${searchText}&searchItem=${searchItem}&searchOrd=${searchOrd}">${pnum}</a></li>
    	</c:if>
    </c:forEach>
    
    <c:if test='${endPage < showNum}'>
    	<li class="page-item"><a class="page-link" href="admin_article?page=${startPage + showPageCount}">▶</a></li>
    </c:if>
     <c:if test='${endPage >= showNum}'>
    	<li class="page-item disabled"><a class="page-link" href="admin_article?page=${startPage + showPageCount}">▶</a></li>
    </c:if>
  </ul>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
<hr style="width:90%;" >
<script>
		function enterkey() {
		    if (window.event.keyCode == 13) {
		    	var searchText = $('#searchText').val();
				var searchItem = $('#searchItem').val();
				var searchOrd = $('#orderItem').val();
				location = 'admin_article?searchText=' + searchText +'&searchItem=' + searchItem +'&searchOrd=' +searchOrd;
				
				return false;
			};
		}
		$("#searchBtn").click(function() {
			var searchText = $('#searchText').val();
			var searchItem = $('#searchItem').val();
			var searchOrd = $('#orderItem').val();
			location = 'admin_article?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
			
			return false;
		})
		$("#orderItem").change(function(){
			var searchText = $('#searchText').val();
			var searchItem = $('#searchItem').val();
			var searchOrd = $('#orderItem').val();
			location = 'admin_article?searchText=' + searchText +'&searchItem=' + searchItem + '&searchOrd=' +searchOrd;
		
		})
</script>
<script>
	$('.delete').click(function(){
	// 	console.log($(this).parent().prev().prev().prev().prev().prev().prev().text())
	
		var action = confirm('삭제하시겠습니까?')
		if(action) {
			$.ajax({
				url: 'admin_articleDelete/' + $(this).attr('no'),
				data: {},
				success: function(res) {
				    if (res == "success") {
		                alert("게시물 삭제를 완료하였습니다.");
		                location.reload();
		            } else {
		                alert("게시물 삭제를 실패하였습니다.");
		            }
				}
			})
		}
	})
</script>
</body>
