<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

	<a class="menu-toggle rounded"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="index">Menu</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/">Home</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/join">Join</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/map">Map</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/chat">Chat</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="/returnscroll/mypage">MyPage</a></li>
		</ul>
		<c:if test="${uid != null}">
			<div style="bottom: 0;position: absolute;margin-bottom: 10px;background: darkgrey;">
				${uid} 님이 접속중입니다.<br> 
				<a href="http://localhost:8080/returnscroll/logout">로그아웃</a>
			</div>
		</c:if>
		
	</nav>
