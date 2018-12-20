<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일식</title>
</head>
<body>
<h2>일식 리스트</h2>
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
	
	sql = "select r.resNum, r.resName, listagg(m.menuName, ', ') within group (order by m.menuName) from restaurant r, resMenu m where r.resNum = m.resNum and r.resType = 3 group by r.resNum,r.resName";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<table border ="1">
		<tr>
			<th>식당 이름</th>
			<th>메뉴</th>
			<th>좌석 현황</th>
		</tr>
	<%
	String name = null, menu = null, rnum = "";
	int type;
	while (rs.next()) {
		rnum = rs.getString(1);
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