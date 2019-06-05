<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/checkPw">

		<label for="email"><b>이메일</b></label>
		<input type="text" name="email" id="email">
		<br><br>
		<label for="password"><b>비밀번호</b></label>
		<input type="password" name="password" id="password">
		<br><br>
		
		<button type ="submit"  class="signupbtn">수정하기</button>
		<button type ="button"onclick="location='${pageContext.request.contextPath}/home'" class="cancelbtn">돌아가기</button>
</form>
</div>
</body>
</html>