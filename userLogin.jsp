<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_page</title>
</head>
<body>
<h1>손님 로그인 화면</h1>
<hr>
<h3>로그인 하시겠습니까?</h3>
<form action = "loginUserSession.jsp" method="post">
	아이디: <input type = "text" name = "id"><br>
	패스워드: <input type = "password" name = "passwd"><br>
	<input type = "submit" value = "로그인">
</form>
<br>
</body>
</html>