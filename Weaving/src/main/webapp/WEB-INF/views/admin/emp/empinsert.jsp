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
	
	<form action="insertEmp" method="post">
	
	<label for="empName"><b>이름</b></label>
	<input type="text" name="empName" id="empName"><br><br>
		
	<label for="password"><b>비밀번호</b></label>
	<input type="text" name="password" id="password"><br><br>
	<!-- 
	<label for="passwordcheck"><b>비밀번호 확인</b></label>
	<input type="text" name="passwordcheck"><br><br>
	 -->
	 <!-- 
	<label for="joindate1"><b>입사일</b></label>
	<input type="text" name="joindate1" id="joindate1"><br><br>
	 -->
	<label for="deptId"><b>소속조직</b></label>
	<input type="text" name="deptId" id="deptId"><br><br>
	
	<label for="positionTitle"><b>직위</b></label>
	<select name = "positionTitle" size ="1" id="positionTitle">
	    <option value="선택">선택</option>
		<option value="사원">사원</option>
		<option value="대리">대리</option>
		<option value="이사">이사</option>
    </select><br><br>
    
    <label for="email"><b>이메일</b></label>
	<input type="text" name="email" id="email"><br><br>
	
	<label for="phone"><b>휴대 전화</b></label>
	<input type="text" name="phone" id="phone"><br><br>

	<label for="address"><b>자택주소</b></label>
	<input type ="text" size="20" id="address" name="address">
	<br><br>
	<hr>
	
	<button type="submit">등록</button>
	</form>
	
</div>	
</body>
</html>