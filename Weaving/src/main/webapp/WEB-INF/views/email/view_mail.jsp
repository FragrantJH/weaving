<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<body>

<div>

</div>
<div>
<table class="table">
								<thead class=" text-primary">
									<tr>
										
										<th>제목</th>
										<th>작성자</th>
										<th>내용</th>
										
									</tr>
								</thead>
								<tbody>
<c:forEach var="Email" items="${EmailList}" >

<tr>

											<td>${Email.subject}</td>
											<td>${Email.from}</td>
											<td>
												<div class="collreadmail"  >
													<span >${Email.content}</span>
												</div>
											</td>
											
											
										</tr>

								
									
										
</c:forEach>
</tbody>
</table>

</div>







</body>
</html>