<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-dark">
 <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">회원구분</div>
        <div class="card-body">
<button class="btn btn-primary btn-block" onclick="location='userLogin.jsp'">손님</button>
<button class="btn btn-primary btn-block" onclick="location='resLogin.jsp'">식당</button>
<br>
<h6>아직 회원가입을 하지 않으셨나요?</h6>
<input class="btn btn-primary btn-block" type = "button" value = "회원가입" onclick = "location.href = 'join.jsp'">
</div>
</div>
</div>
</body>
</html>