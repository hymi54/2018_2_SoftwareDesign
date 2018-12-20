<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 상세 페이지</title>
</head>
<body>
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
	String rnum = request.getParameter("rnum");
	
	sql = String.format("SELECT resName FROM RESTAURANT WHERE resNum = %s ", rnum);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	String name = null;
	while (rs.next())
		name = rs.getString(1);
%>
<h1><%=name %> 상세정보 페이지입니다.</h1>
<hr>
<%
	sql = String.format("select menuName, menuPrice from resMenu WHERE resNum = %s ", rnum);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<table border ="1">
			<tr>
				<th>메뉴</th>
				<th>가격</th>
			</tr>
	<%
	String mName = null;
	int mPrice = 0;
	while(rs.next()) {
		mName = rs.getString(1);
		mPrice = rs.getInt(2);
%>
		<tr>
	        <td id="title"><%=mName %></td>
	        <td id="title"><%=mPrice %></td>
	    </tr>
<%
	}
%>
	</table>
	<br>
		<table border ="1">
		<tr>
			<th>좌석 현황</th>
			<th>총 좌석 수</th>
		</tr>
<%
	sql = String.format("select maxSeat, curSeat from curSeat WHERE resNum = %s ", rnum);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	int maxSeat, curSeat;
	while(rs.next()) {
		maxSeat = rs.getInt(1);
		curSeat = rs.getInt(2);
%>
		<tr>
	        <td id="title"><%=curSeat %></td>
	        <td id="title"><%=maxSeat %></td>
	    </tr>
<%
	}
	conn.close();
%>
</table>
</body>
</html>