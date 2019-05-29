<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var pwch1 = 'N'

//비밀번호, 비밀번호확인 확인하기
function pwche(){
	var pw= document.twin.password.value;
	var pwch= document.twin.repassword.value;
	if(document.getElementById('password').value !='' && document.getElementById('repassword').value !=''){
		if(document.getElementById('password').value == document.getElementById('repassword').value){
			document.getElementById('same').innerHTML ='비밀번호 일치합니다.';
			document.getElementById('same').style.color ='blue';
			pwch1='Y'
		}else{
			document.getElementById('same').innerHTML ='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color ='red';
			pwch1='N'
		}
	}
}

//비밀번호 불일치시 알림창
function formch(){
	if(pwch1=="N"){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
		
	}
	return true;
}
</script>
</head>
<body>
<div>
<form name="twin" action="${pageContext.request.contextPath}/empselect" onsubmit="return formch()">

		<label for="password"><b>비밀번호</b></label>
		<input type="password" name="password" id="password"  readonly value="${emp.password}">
		<br><br>
		
		<label for="repassword"><b>비밀번호 확인</b></label>
		<input type="password"  name="repassword" id="repassword" onkeyup="pwche()"><br><span id="same"></span>
		<br>
		
		<button type ="submit"  class="signupbtn">수정하기</button>
</form>
</div>
</body>
</html>