<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-primary">
					<h4 class="card-title ">결재 대기 문서</h4>
					<p class="card-category">현재 결재 해야하는 문서를 조회할 수 있습니다</p>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>문서 번호</th>
									<th>문서 제목</th>
									<th>문서 작성자</th>
									<th>보안 등급</th>
									<th>작성 날짜</th>
									<th>대기 결재자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${waitList}" var="doc">
									<tr>
										<td>${doc.docNo}</td>
										<td><a id="btnSelect" href="${pageContext.request.contextPath}/docDetailView?docId=${doc.docId}">${doc.docTitle}</a></td>
										<td>${doc.writerEmpName}</td>
										<td>${doc.secureLevel}</td>
										<td>${doc.regDate}</td>
										<td>${doc.waitEmpName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>