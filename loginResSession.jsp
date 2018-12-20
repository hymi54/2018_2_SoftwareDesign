<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login session</title>
</head>
<body>
<h1>식당 로그인 인증</h1>
<hr>
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
	
	// 파라미터값 가져오기 "id" "passwd"
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	System.out.println(id);
	boolean key = false;
	String DBid, DBpwd;
	
	sql = "SELECT Rid, passwd, resNum from RESTAURANT";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	int resNum = -1;
	while (rs.next()) {
		if (key) break;
		DBid = rs.getString(1);
		DBpwd = rs.getString(2);
		resNum = rs.getInt(3);
		if (id.equals(DBid)) {
			key = true;
			if (passwd.equals(DBpwd)) {
				session.setAttribute("restaurant", resNum);
				out.println("로그인 인증됨<br>");
				response.sendRedirect("resMain.jsp");
				%>
				<script>
					alert('로그인 인증되었습니다.');
					location.href = 'resMain.jsp';
				</script>
				<%
			}
			else
				out.println("패스워드틀림<br>");
		}
	}
	if (!key) { // 패스워드 못찾고 나왔을 때
		out.println("아이디 없음<br>");
	}
	conn.close();
%>
</body>
</html>