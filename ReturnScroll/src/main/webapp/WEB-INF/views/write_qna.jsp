<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Q&A 글쓰기</title>
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
	 <%--  <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css" rel="stylesheet" >
	  
	  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	 --%>
	 <!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	
	<style>
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
  
  body, table, div, p, h1 {font-family:'Nanum Gothic';}

	input[type=button]{
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
	input[type=button]:hover{
	  background:#fff;
	  color:#000000;
	}
	input[type=button]:before,input[type=button]:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #000000;
	  transition:400ms ease all;
	}
	input[type=button]:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	input[type=button]:hover:before,input[type=button]:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	a.menu-toggle > i {
		margin-top: 18px;
	}
	
	@media (max-width : 600px){
	
		#h1_title{
			font-size:2rem;
		}
	}
	
    
  </style>
	
</head>
    
 <body id="page-top">
    <!-- Navigation -->
    <jsp:include page="side.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
	<!-- Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
        
    <!-- include libraries(jQuery, bootstrap) -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/js/summernote-ko-KR.js"></script>
	
	<h1 id="h1_title" style="margin-left:5%;margin-top:2%;">Q&A 글쓰기</h1>
	<hr style="width:95%; background:#FFCC33; height:2px" >
		
	<div style="width:95%; margin:0 auto; margin-top: -2%;" >
		<form method="post" id='frm' name='frm'>
		<br><br>
		<input type="text" name="title" style="width:100%; height: 40px;" placeholder=" 제목을 입력해주세요"><br>
		<input type="hidden" name="writer" value="${unick}">
		<br><br> 
			<textarea id="summernote" name="content" ></textarea>
			<hr style="width:100%;" >
			<div style="text-align:center;">
			<input id="cancelBtn" type="button" value="이전" onclick="location.href='../returnscroll/qna'"/>
			<input type="button" value="등록" onclick="goWrite(this.form)"/>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script>
	$(document).ready(function() {
		var sendFile = function (file, el) {
			console.log('sendFile');
		      var form_data = new FormData();
		      form_data.append('file', file);
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: 'write2',
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(url) {
		        	console.log('url', url);
		        	$('#summernote').summernote('insertImage', url);
		        }
		      });
		    }
		$('#summernote').summernote({
	        height: 450,
	        minHeight: null,
	        maxHeight: null,
	        lang : 'ko-KR',
	        callbacks: {
	          onImageUpload: function(files, editor, welEditable) {
	        	  console.log('onimageupload')
	            for (var i = files.length - 1; i >= 0; i--) {
	              sendFile(files[i], this);
	            }
	          }
	        }
	      });
	})
	
	
	function goWrite(frm){
		var title = frm.title.value;
		var content = frm.content.value;
		
		console.log(title);
		console.log(content);
		if(title.trim()==''){
			alert("제목을 입력해주세요");
			return false;
		}
		if(content.trim()==''){
			alert("내용을 입력해주세요");
			return false;
		}
		if(title.trim()!='' &&  content.trim()!=''){
			frm.submit();
		}
	}
	
	</script>


	

</body>


