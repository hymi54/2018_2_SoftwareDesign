<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�մ� ���� ������</title>
</head>
<body>
<%
int customer = -1;
try {
	customer = (int)session.getAttribute("customer");
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
	sql = String.format("SELECT nick FROM CUSTOMER WHERE Cnumber = %d ", customer);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		name = rs.getString(1);
	}
%>
<hr>
<%=name %>���� �α����ϼ̽��ϴ�.<br>
<input type = "button" value = "ȸ������ ����" onclick = "location.href = 'changeInfo.jsp'">
<input type = "button" value = "�α׾ƿ�" onclick = "location.href = 'logout.jsp'">
<input type = "button" value = "���� ���ų��� Ȯ��" onclick = "location.href = 'previousPurchase.jsp'"><br>
</body>
</html>