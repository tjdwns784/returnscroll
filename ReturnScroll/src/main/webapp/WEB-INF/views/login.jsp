<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>귀환주문서</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="resources/style.css">
<style>
	img[id=kakao-login-btn] {
		margin-top: 10%; width:240px
	}
	nav#sidebar-wrapper {
		top: 0px !important;
	}
</style>

</head>
<body>
<body id="page-top" > 

	<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>
	
    <form>
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <div class="container text-center my-auto">
			<h1 class="mb-1">술창</h1>
			<h3 class="mb-5"></h3>
			<form class="form-inline-block">
				<div class="form-group" style="margin-top: -10%">
					<label for="uid">ID:</label> <input type="text"
						class="form-control" id="uid" placeholder="아이디 입력" style="margin-top: -1%">
				</div>
				<div class="form-group">
					<label for="upw">Password:</label> <input type="password"
						class="form-control" id="upw" placeholder="암호 입력" style="margin-top: -1%; margin-bottom: -13%;">
				</div>
				<br>
				<div class="checkbox">
					<label><input type="checkbox"> 아이디 저장</label>
				</div>
			</form>
			<a class="btn btn-primary btn-xl js-scroll-trigger"
				href="/returnscroll/login" id="btnLogin">Login</a> <a
				class="btn btn-primary btn-xl js-scroll-trigger"
				href="/returnscroll/join">join</a>
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
</a>
			<a href="http://developers.kakao.com/logout">로그아웃</a>
			
		</div>
		<div class="overlay"></div>
    </form>
   

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#"> <i
						class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#"> <i
						class="icon-social-twitter"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white" href="#"> <i
						class="icon-social-github"></i>
				</a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; Your Website
				2019</p>
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	 <script src="resources/script.js"></script>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>
		<script>
	    $('#btnLogin').click(function() {
	         var action = $('#btnLogin').attr("action");
	         var form_data = {
	            "uname" : $('#uid').val(),
	            "psw" : $('#upw').val()
	         };
	         $.ajax({
	            type : "POST",
	            url : action,
	            data : form_data,
	            success : function(res) {
	               if (res == "success") {
	                  alert("로그인 성공!");
	                  location = "main"
	               } else {
	                  alert("아이디 또는 비밀번호가 잘못되었습니다");
	               }
	            },
	            error : function() {
	               alert("Error");
	            }
	         });
	         return false;

	      });
	    </script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('4de13c38b225e4c65f11521d264e7212');
    // 카카오 로그인 버튼을 생성합니다.
    function loginWithKakao() {
	    Kakao.Auth.loginForm({
	      success: function(authObj) {
	    	  Kakao.API.request({
		    	  url: '/v2/user/me',
		    	  success: function(res) {
		    		  console.log(res);
		    		  var name = res.properties.nickname;
		    		  var image = res.properties.profile_image;
		    		  var html = '<h1>' + name + '<h1>';
		    		  html += '<img src="' + image + '">';
		    		  $('body').append(html);
		    		  
			     }
		      })
      		},
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
    	});
    }
  //]]>
</script>

</body>

</html>
