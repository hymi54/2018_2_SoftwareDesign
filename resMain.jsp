<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 메인 페이지</title>
</head>
<body>
<%
String restaurant = "";
try {
	restaurant = (String)session.getAttribute("restaurant");
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
 
	String name = null;
	sql = String.format("SELECT resName FROM RESTAURANT WHERE resNum = %s ", restaurant);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		name = rs.getString(1);
	}
	conn.close();
%>
<h3><%=name %>님이 로그인하셨습니다.</h3><hr>
<input type = "button" value = "로그아웃" onclick = "location.href = 'logout.jsp'">
<input type = "button" value = "메뉴 변경" onclick = "location.href = 'changeMenu.jsp'"><br>
<input type = "button" value = "좌석 현황 업데이트" onclick = "location.href = 'updateSeat.jsp'"><br>
</body>
</html>