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
<c:forEach var="rEmail" items="${readingMail}" >
								<thead class=" text-primary">
									<tr>
									<td><div class="subject">${rEmail.subject}</div></td>
									</tr>
									
										<tr>
										<td><div class="fromEmail">${rEmail.fromEmail}</div></td>
										</tr>
										
										<tr>
											<td>
												<div class="collreadmail"  >
													<span class="inboxContents">${rEmail.inboxContents}</span>
												</div>
											</td>
										</tr>

								
	
	</c:forEach>
</tbody>
</table>
		</div>
	</div>
	</form>

</body>
</html>