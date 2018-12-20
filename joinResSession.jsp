<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update information</title>
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
	boolean key = true;
	boolean key2 = true;
	String id = request.getParameter("id");
	String pwd = request.getParameter("passwd");
	String resName = new String(request.getParameter("resName").getBytes("8859_1"), "UTF-8");
	String temp = request.getParameter("resNum");
	int resNum = -1;
	if(!temp.isEmpty() || temp.length() == 10) {
		resNum = Integer.parseInt(temp);
	}
	else{
		%>
		<script>
		alert('잘못된 사업자등록번호 형식 입니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	
	String dup_id = null;
	if (id.isEmpty()) {
		%>
		<script>
		alert('아이디를 입력하십시오.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
	}
	sql = "SELECT ID FROM CUSTOMER";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		dup_id = rs.getString(1);
		if (id.equals(dup_id)) {
			%>
			<script>
			alert('중복된 아이디 입니다.')
			location.href = 'joinRestaurant.jsp'
			</script>
			<%
			key = false;
			break;
		}
	}
	if (pwd.isEmpty() || 5 > pwd.length() || pwd.length() > 20) {
		%>
		<script>
		alert('비밀번호 형식이 틀렸습니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	if (resName.isEmpty()) {
		%>
		<script>
		alert('상호명을 쓰지 않았습니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	if (resNum < 0) {
		%>
		<script>
		alert('사업자등록번호를 쓰지 않았습니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	if (key) {
		sql = String.format("INSERT INTO CUSTOMER VALUES('%s', '%s', '%s', '%d')", id, pwd, resName, resNum);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	conn.close();
	%>
	<script>
	alert('★★회원가입을 완료했습니다★★')
	location.href = 'login.jsp'
	</script>
</body>
</html>