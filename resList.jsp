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
<h1>식당 리스트</h1>
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
	
	sql = "select r.resNum, r.resName, listagg(m.menuName, ',') within group (order by m.menuName) from restaurant r, resMenu m where r.resNum = m.resNum group by r.resNum,r.resName";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<table border ="1">
		<tr>
			<th>식당 이름</th>
			<th>대표 메뉴</th>
		</tr>
	<%
	String name = null, menu = null;
	int rnum;
	while (rs.next()) {
		rnum = rs.getInt(1);
		name = rs.getString(2);
		menu = rs.getString(3);
	%>
		<tr>
	        <td id="title"><%=name%></td>
	        <td id="title"><%=menu%></td>
	        <td> <form action = "resPage.jsp" method="post">
				<input type = "hidden" name = "rnum" value =<%=rnum%>>
				<input type = "submit" value = "상세 정보">
				</form> 
			</td>
	    </tr>
	<%
	}
	conn.close();
	%>
	</table>
	
</body>
</html>