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
	String resNum = request.getParameter("resNum");
	if(resNum.isEmpty() || resNum.length() != 10) {
		%>
		<script>
		alert('잘못된 사업자등록번호 형식 입니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	
	if (id.isEmpty()) {
		%>
		<script>
		alert('아이디를 입력하십시오.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
	}
	
	String dup_id = null;
	String dup_name = null;
	String dup_num = "";
	sql = "SELECT RID, resname, resnum FROM RESTAURANT";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		dup_id = rs.getString(1);
		dup_name = rs.getString(2);
		dup_num = rs.getString(3);
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
		if(resName.equals(dup_name)) {
			%>
			<script>
			alert('중복된 상호명 입니다.')
			location.href = 'joinRestaurant.jsp'
			</script>
			<%
			key = false;
			break;
		}
		if(resNum.equals(dup_num)) {
			%>
			<script>
			alert('중복된 사업자등록번호 입니다.')
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
	if (resNum.isEmpty()) {
		%>
		<script>
		alert('사업자등록번호를 쓰지 않았습니다.')
		location.href = 'joinRestaurant.jsp'
		</script>
		<%
		key = false;
	}
	if (key) {
		sql = String.format("INSERT INTO RESTAURANT VALUES('%s', '%s', '%s', '%s')", id, pwd, resName, resNum);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeQuery();
		sql = String.format("insert into curseat values('%s', 0, 0)", resNum);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeQuery();
	}
	conn.close();
	%>
	<script>
	alert('★★회원가입을 완료했습니다★★')
	location.href = 'login.jsp'
	</script>
</body>
</html>