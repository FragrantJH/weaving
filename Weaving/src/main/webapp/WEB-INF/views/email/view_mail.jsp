<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
</style>

<body>
	

	<div>
	
	<div>
	<a class="fromEmail" ></a>
	<a class="toEmail"></a>
	<a class="checkTime"></a>
	</div>
	
	
	</div>
	<div>
		<table class="table">
			<thead class=" text-primary">
				<tr>
					<th style="height: 10px; width: 3px">제목</th>
					<th>작성자</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Email" items="${EmailList}">
					<tr>
						<td>${Email.subject}</td>
						<td>${Email.fromEmail}</td>
						<td>
							<div class="collreadmail">
								<span>${fn:substring(Email.content, 0, 80) }</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>







</body>
</html>