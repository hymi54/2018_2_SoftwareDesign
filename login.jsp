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
<h1>소프트웨어 설계 1조 시작화면</h1>
<hr>
<h3>회원 구분</h3>
<button onclick="location='userLogin.jsp'">손님</button>
<button onclick="location='resLogin.jsp'">식당</button>
<br>
<h3>아직 회원가입을 하지 않으셨나요?</h3>
<input type = "button" value = "회원가입" onclick = "location.href = 'join.jsp'">
</body>
</html>