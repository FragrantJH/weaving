<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<body>

	<div>
		<table class="table">
				<thead class=" text-primary">
									<tr>
										<th>번호</th>			
										<th>작성자</th>
										<th>제목</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
					<c:forEach var="List" items="${emailList}">
							<tr>
								<td>${List.inboxid}</td>
								<td>${List.fromInbox}</td>
								<td><a href="${pageContext.request.contextPath}/reading_mail/${List.inboxid}">${List.title}</a></td>
								<td>${List.checkTime}</td>
								</tr>
				</c:forEach>
							</tbody>
		</table>
	</div>


</body>
</html>