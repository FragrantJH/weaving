<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title ">사내게시판</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>No</th>
										<th>작성자</th>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList}" var="board">
										<tr>
											<td>${board.boardId}</td>
											<td>${board.empName}</td>
											<td><a href="${pageContext.request.contextPath}/boardOne/${board.boardId}">${board.title}</a></td>
											<td>${board.time}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='boardInsertForm'">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>