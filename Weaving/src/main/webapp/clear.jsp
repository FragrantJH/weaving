<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	application.removeAttribute("LOGIN_LIST");
	Set<HttpSession> userSet = new HashSet<HttpSession>();
	application.setAttribute("LOGIN_LIST", userSet);

	out.print("clear done");
%>
</body>
</html>