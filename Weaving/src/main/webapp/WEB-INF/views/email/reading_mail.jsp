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
<c:forEach var="rEmail" items="${Emailreading}" >
								<thead class=" text-primary">
									<tr>
									<td>${rEmail.subject}</td>
									</tr>
									
										<tr>
										<td>${rEmail.from}</td>
										</tr>
										
										<tr>
											<td>
												<div class="collreadmail"  >
													<span >${rEmail.content}</span>
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