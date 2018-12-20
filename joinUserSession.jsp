<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user join session</title>
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
	
	sql = "SELECT MAX(Cnumber) FROM CUSTOMER";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) number = rs.getInt(1) + 1;
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String nick = new String(request.getParameter("nick").getBytes("8859_1"), "UTF-8");
	String dup_nick;
	String dup_id;
	boolean key = true;
	if (id.isEmpty() || 5 > id.length() || id.length() > 15) {
		%>
		<script>
		alert('아이디를 입력하십시오.')
		location.href = 'joinUser.jsp'
		</script>
		<%
	}
	
	sql = "SELECT NICK FROM CUSTOMER";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) { // 아이디, 닉네임 중복체크
		dup_id = rs.getString(1);
		dup_nick = rs.getString(3);
		if(id.equals(dup_id)){
			%>
			<script>
			alert('중복된 아이디 입니다.')
			location.href = 'joinUser.jsp'
			</script>
			<%
			key = false;
			break;
		}
		else if (nick.equals(dup_nick)) {
			%>
			<script>
			alert('중복된 닉네임 입니다.')
			location.href = 'joinUser.jsp'
			</script>
			<%
			key = false;
			break;
		}
	}
	if (passwd.isEmpty() || 5 > passwd.length() || passwd.length() > 20) {
		%>
		<script>
		alert('비밀번호 형식이 틀렸습니다.')
		location.href = 'joinUser.jsp'
		</script>
		<%
		key = false;
	}
	if (nick.isEmpty() || 5 > nick.length() || nick.length() > 20) {
		%>
		<script>
		alert('닉네임 형식이 틀렸습니다.')
		location.href = 'joinUser.jsp'
		</script>
		<%
		key = false;
	}
	if (key) {
		sql = String.format("INSERT INTO CUSTOMER VALUES('%s', '%s', '%s')", id, passwd, nick);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	
	conn.close();
	%>
	<script>
	alert('★★회원가입을 완료했습니다★★')
	location.href = ''
	</script>
</body>
</html>