<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 현황 업데이트</title>
</head>
<body>
<%
	int restaurant = -1;
	try {
		restaurant = (int)session.getAttribute("restaurant");
	}
	catch (Exception e) {
		%>
		<script>
		alert('로그인 해주세요.')
		location.href = 'login.jsp'
		</script>
		<%
	}
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	String user = "hymi54";
	String pswd = "br0409";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pswd);
	
	String tempmax = null;
	int max;
	int cur;
	sql = String.format("SELECT resName FROM RESTAURANT WHERE resNum = %d ", restaurant);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	%>
</body>
</html>