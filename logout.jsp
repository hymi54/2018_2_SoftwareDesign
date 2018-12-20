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

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
PreparedStatement pstmt;
ResultSet rs;
Connection conn;
String sql;
String user = "hymi54";
String pswd = "br0409";
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pswd);

String restaurant = "";
try {
	restaurant = (String)session.getAttribute("restaurant");	
	sql = String.format("update curSeat set maxseat = 0, curseat = 0 where resnum = %s", restaurant);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
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