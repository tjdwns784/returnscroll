<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>귀환주문서 홈</title>

  <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
   <jsp:include page="side.jsp"></jsp:include>
   
   <style>
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
  
  body, table, div, a, li, ul{font-family:'Nanum Gothic';}
  
   button{
     background:#000000;
     color:#fff;
     border:none;
     position:relative;
     height:40px;
     width:100px;
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
   
    @media (max-width: 600px) {
        #img_home{
           width:80%;
        }
        
        #welcome{
        	font-size: 25px;
        		
        }
     }

  </style>
   <div style="text-align:center;" id='body'>
       <img id="img_home" src="resources/img/리턴2.jpg" style=" height:564px;"><br>
      <br><br>
      <c:if test="${uid != null}">
               <script>
            	document.getElementById("loginbtn").style.visibility="hidden";
              	document.getElementById("joinbtn").style.visibility="hidden";
              </script>
      </c:if>

      <c:if test="${uid.uid == null}">
	      <button id="loginbtn" onclick="location.href='/returnscroll/login'">Login</button>
	      <button id="joinbtn" onclick="location.href='/returnscroll/join'">Join</button>
      </c:if>
      
      <c:if test="${uid.uid != null}">
    	<h1 id="welcome" style="margin-top:-1%; margin-bottom:-2%"><span id='unick' style='color:red'>${uid.nick}님</span> 환영합니다!</h1>
	</c:if>

	<jsp:include page="footer.jsp"></jsp:include>



  </div>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

</body>

</html>