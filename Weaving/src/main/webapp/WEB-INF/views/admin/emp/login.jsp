<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post">
	ID:<input name="empNo" value="${EmpVO.empNo}"><br>
	PW:<input name="password" value="${EmpVO.password}"><br>
	<button>로그인</button>
</form>
</body>
</html>