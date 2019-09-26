<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post">

제목 : <input type="text" name="title"><br>
내용 : <textarea name="content" cols="20" rows="20"></textarea><br>
<input type="hidden" name="writer" value="${param.writer}"><br>

<input type="submit">
</form>