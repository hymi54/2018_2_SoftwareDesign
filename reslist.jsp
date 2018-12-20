<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 리스트</title>
</head>
<body>
<%
	int number = -1;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	String user = "hymi54";
	String pswd = "br0409";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pswd);
	
	sql = "select resName from restaurant";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
%>
</body>
</html>