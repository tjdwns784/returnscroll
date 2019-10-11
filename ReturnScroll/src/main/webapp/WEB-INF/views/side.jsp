<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

 <style>
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
 
  
  body, table, div, a, li, ul{font-family:'Nanum Gothic';}

  #sidebar-wrapper { 
  	background : #FF9900;
  	font-weight : bold;
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
				href="/returnscroll/join">Join</a></li>
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
				<a href="http://localhost:8080/returnscroll/logout" style="color:red">로그아웃</a>
			</div>
		</c:if>
		
	</nav>
