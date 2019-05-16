<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header card-header-primary">
							<h4 class="card-title ">게시판</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
									<tr>
										<th>게시글ID</th>
										<th>작성자ID</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성시간</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${boardList}" var="board">
										<tr>
											<td>${board.boardId}</td>
											<td>${board.empNo}</td>
											<td>${board.title}</td>
											<td>${board.boardContents}</td>
											<td>${board.time}</td>
										</tr>
									</c:forEach>	
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>