<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

</head>
<!-- 	메일보기  -->
	<body>

	<form action="mailSend" method="get" >

	<div class="bigpage">
		<div class="send-button">
			<input type="submit" value="답장"/>
				<input type="submit" value="삭제"/>
						
		</div>
		

		
<div>
<table class="table">

<thead class=" text-primary">

						<tr><td>emailId : ${rEmail.inboxid}</td></tr>
						<tr><td>fromEmail : ${rEmail.fromInbox}</td></tr>
						<tr><td>toEmail : ${rEmail.toInbox}</td></tr>
						<tr><td>제목 :  ${rEmail.title}</td></tr>
						<tr><td>보낸시간 : ${rEmail.checkTime}</td></tr>
						<tr><td>내용 : ${rEmail.inboxContents}</td></tr>
							

</tbody>
</table>
		</div>
	</div>
	</form>

</body>
</html>