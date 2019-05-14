<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #float1 { float: left; padding: 10px;}
</style>
</head>
<body>
	<img src="/logo.jpg" id="float1">

	<li><b>이름&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>ID&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>비밀번호&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>비밀번호 확인&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>사번&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>입사일&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>소속조직&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>직위&nbsp;<font color ="red">*</font></b>
	<select name = "position" size ="1">
    <option value="1">선택</option>
	<option value="2">대리</option>
	<option value="3">과장</option>
     	</select>
	<hr>
	</li>
	
	<li><b>이메일&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>사내전화&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>휴대전화&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<hr>
	</li>
	
	<li><b>주택주소&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="20">
	<br><br>
	<input type ="text" size="60">
	<hr>
	</li>
	
	<li><b>생년월일&nbsp;<font color ="red">*</font></b>
	<input type ="text" size="10"> 년 <input type ="text" size="10"> 월 <input type ="text" size="10"> 일 </li>
	<hr>
	
	<button>등록</button>
	
	
</body>
</html>