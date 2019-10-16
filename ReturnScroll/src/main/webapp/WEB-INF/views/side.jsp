<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="630134026179-rgc07okoujjobuonqp55itnh2lt42vic.apps.googleusercontent.com">
<header>
<br>
<img id=img src="/returnscroll/resources/img/리턴2.jpg">
<h1 id='header' style="text-align:center; margin-right:100px;" ><span>Return Scroll</span></h1>
<hr style="width:95%; background:#FFCC33; height:2px" >
</header>
 <style>
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
 
  
  h1,body, table, div, a, li, ul{font-family:'Nanum Gothic';}

  	#img {
  		float: left;
  		width: 65px;
  		margin-left: 100px;
  	}
    
  @media (max-width: 600px) {
  	#img {
  		width: 60px;
  	}
  }

  @media (min-width: 601px) and (max-width: 1000px) {
  	#img {
  		width: 100px;
  	}
  }

  
  @media (max-width: 600px) {
  	#header {
  		font-size: 60px;
  	}
  }

  @media (min-width: 601px) and (max-width: 1000px) {
  	#header {
  		font-size: 100px;
  	}
  }

  #sidebar-wrapper { 
  	background : #FF9900;
  	font-weight : bold;
  	top: 0;
  }
  </style>

	<a class="menu-toggle rounded" style="z-index:11000;"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper" style="z-index:10000;">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="/returnscroll/">Menu</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/">Home</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/tmap">Map</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/chat">Chat</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/qna">Q&A</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/mypage">MyPage</a></li>
		</ul>
		<c:if test="${uid != null}">
			<div style="bottom: 0;position: absolute;margin-bottom: 10px; margin-left:20px;">
				${uid} 님이 접속중입니다.<br> 
				<a id="logout" href="../returnscroll/logout" style="color:red">로그아웃</a>
			</div>
		</c:if>
		
	</nav>

	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>		
<!-- 	<script src="https://apis.google.com/js/platform.js" async defer></script> -->
<script>
		function onLoad() {
		    gapi.load('auth2', function() {
		      gapi.auth2.init();
		    });
		  }
		$('#logout').click(function(e) {
	// 		e.preventDefault();
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function () {
				console.log('user singed out');
			});
			auth2.disconnect();
		})
			$("#sidebar-wrapper").focusout(()=>{					
					$.ajax({				
						url:"nickDup",					
						data : {nick : $("#user_nick").val()},					
						success: function(res){					
						console.log(res);					
											
						if(res==0 && $("#user_nick").val() !="" ){					
							$("#msgnick").text("사용가능한 닉네임 입니다.")				
							$("#msgnick").css("color","blue")				
							isNick = 1	
						}else if(res==0 && $("#user_nick").val() =="" ){
							$("#msgnick").text("공백은 불가합니다.")	
							$("#msgnick").css("color","red")	
							isNick = 0		
						}else {					
							$("#msgnick").text("이미 존재하는 닉네임 입니다.")				
							$("#msgnick").css("color","red")				
							isNick = 0				
						}			
					}					
				});					
			})					
</script>