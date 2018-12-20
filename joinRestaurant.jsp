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
<h1>회원가입 페이지 입니다!</h1>
<hr>
<form action = "joinResSession.jsp" method="post">
	<h3> 아래는 필수 입력사항 입니다.</h3> <br>
	아이디: <input type = "text" name = "id"> 5자 이상 15자 이하<br>
	패스워드: <input type = "password" name = "passwd"> 5자 이상 20자 이하<br>
	상호명: <input type = "text" name = "resName"><br>
	사업자등록번호: <input type = "text" name = "resNum"> - 없이 입력하세요<br>
	<input type = "submit" value = "회원정보 등록">
	</form>
</body>
</html>