<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ĵ� ���� ������</title>
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
	alert('�α��� ���ּ���.')
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
	sql = String.format("SELECT resName FROM CUSTOMER WHERE resNum = %d ", restaurant);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		name = rs.getString(1);
	}
	
%>
<hr>
<%=name %>���� �α����ϼ̽��ϴ�.<br>
<input type = "button" value = "�α׾ƿ�" onclick = "location.href = 'logout.jsp'">
<input type = "button" value = "���� ���ų��� Ȯ��" onclick = "location.href = 'previousPurchase.jsp'"><br>
</body>
</html>