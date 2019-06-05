<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<script>

//페이징 기능(처음/끝 값을 보내준다.)
function goList(p){
	form2.page.value = p;
	form2.submit();
}

</script>

<body>
<!-- 페이징 값 보내는 폼(form2) -->
<form action="docFormList" name="form2">
	<input type="hidden" name="page" value="1"></input>
</form>
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
									<th>설명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${docFormList}" var="docForm">
									<tr>
										<td class="text-center">${docForm.rowNum}</td>
										<td><a id="btnSelect" href="${pageContext.request.contextPath}/showDocForm/${docForm.formId}">${docForm.formName}</a></td>
										<td>${docForm.description}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!-- paging -->
						<div>
							<my:paging paging="${paging}" jsFunc="goList" />
						</div>
					</div>
				</div>
				<button class="btn btn-default btn btn-primary" onclick="location='${pageContext.request.contextPath}/docFormInsertForm'"> 결재폼 등록 </button>
			</div>
		</div>
	</div>
</body>
</html>