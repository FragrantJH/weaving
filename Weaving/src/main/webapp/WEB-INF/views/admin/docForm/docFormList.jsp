<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
					<h4 class="card-title ">결재폼 목록</h4>
					<p class="card-category">관리자가 등록한 결재폼 목록입니다</p>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th>폼 이름</th>
									<th class="text-right">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${docFormList}" var="docForm">
									<tr>
										<td class="text-center">${docForm.rowNum}</td>
										<td>${docForm.formName}</td>
										<td class="td-actions text-right">
											<button type="button" rel="tooltip" class="btn btn-success">
												<i class="material-icons">edit</i>
											</button>
											<button type="button" rel="tooltip" class="btn btn-danger">
												<i class="material-icons">close</i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<my:paging paging="${paging}" jsFunc="docFormList" />
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>