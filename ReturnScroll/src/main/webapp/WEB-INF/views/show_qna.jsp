<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

번호 : ${article.NO}
<br>
제목 : ${article.TITLE}
<br>
내용 : ${article.CONTENT}
<br>
조회수 : ${article.HIT}
<br>
작성자 : ${article.WRITER}
<br>
작성일자 : ${article.WRITE_DATE}

<br>
<hr>
댓글:
<input type="text" id="comment">
<button onclick="addComment()">작성완료</button>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"> </script>
<script>
function addComment(){
	var comment = $("#comment").val();
	$.ajax({
		url:"../addComment",
		data:{
			"id":"${board.ID}",
			"content" : comment
		},
		success:function(res){
			alert(res);
		}
	})
}

</script>