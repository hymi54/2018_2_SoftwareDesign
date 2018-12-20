<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join membership</title>
</head>
<body>
<h1>손님 회원가입 페이지 입니다!</h1>
<hr>
<form action = "joinUserSession.jsp" method="post">
	아이디: <input type = "text" name = "id"> 5자 이상 15자 이하<br>
	패스워드: <input type = "password" name = "passwd"> 5자 이상 20자 이하<br>
	닉네임 : <input type = "text" name = "nick"> 5자 이상 20자 이하<br>
	<input type = "submit" value = "회원정보 등록">
	</form>
</body>
</html>