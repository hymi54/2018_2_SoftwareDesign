<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout 페이지</title>
</head>
<body>
<h1>로그아웃 페이지</h1>
<%
int restaurant = -1;
try {
	try {
		restaurant = (int)session.getAttribute("restaurant");	
	}
	catch (Exception e1) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	session.invalidate();
}
catch (Exception e) {
	int customer = -1;
	try {
		customer = (int)session.getAttribute("customer");
	}
	catch (Exception e2) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	session.invalidate();
}
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'login.jsp'
</script>
</body>
</html>