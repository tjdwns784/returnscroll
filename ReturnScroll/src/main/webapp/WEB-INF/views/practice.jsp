<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="en">
<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>

ID<br>

<button onclick="moveReply()">답변쓰기</button>
댓글 : <input type="text" id="comment">
<button onclick="addComment()">작성완료</button>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function addComment() {
		var comment = $("#comment").val();
		$.ajax({
			url: "../addComment",
			data: {
				"id":"${board.ID}",
				"content":comment
			},
			success: function(res) {
				alert(res);
			}
		})
	}
	function moveReply() {
		   location = "../reply?parent=${board.GRP}&ord=${board.ORD}&level=${board.LEVEL}"; // 상대경로
// 절대경로     location = "http://localhost:8080/board/reply";
	}
</script>
