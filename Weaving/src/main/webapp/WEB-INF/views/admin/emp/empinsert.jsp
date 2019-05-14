<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #float1 { float: left; padding: 10px;}
 label {
	display : inline-block;
	width : 90px;
}

</style>
</head>
<body>
<div class="cen">
	<h3>직원 등록</h3><hr>

	<label for="username"><b>이름</b></label>
	<input type="text" name="username"><br><br>
		
	<label for="userid"><b>아이디</b></label>
	<input type="text" name="userid"><br><br>
		
	<label for="password"><b>비밀번호</b></label>
	<input type="text" name="password"><br><br>
	
	<label for="passwordcheck"><b>비밀번호 확인</b></label>
	<input type="text" name="passwordcheck"><br><br>
	
	<label for="emp_no"><b>사번</b></label>
	<input type="text" name="emp_no"><br><br>
	
	<label for="joindate"><b>입사일</b></label>
	<input type="text" name="joindate"><br><br>
	
	<label for="joindate"><b>소속조직</b></label>
	<input type="text" name="joindate"><br><br>
	
	<label for="position"><b>직위</b></label>
	<select name = "position" size ="1">
	    <option value="1">선택</option>
		<option value="2">대리</option>
		<option value="3">과장</option>
    </select><br><br>
    
    <label for="joindate"><b>이메일</b></label>
	<input type="text" name="joindate"><br><br>
	
	<label for="joindate"><b>사내 전화</b></label>
	<input type="text" name="joindate"><br><br>
	
	<label for="joindate"><b>휴대 전화</b></label>
	<input type="text" name="joindate"><br><br>

	<label for="address"><b>자택주소</b></label>
	<input type ="text" size="20">
	<br><br>
	
	<label for="address"><b>생년월일</b></label>
	<input type ="text" size="10"> 년 <input type ="text" size="10"> 월 <input type ="text" size="10"> 일
	<hr>
	
	<button>등록</button>
	
</div>	
</body>
</html>