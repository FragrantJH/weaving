<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
</head>

<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">
							결재폼 내용
					</h4>
				</div>
			</div>
			<br>
			<br>
			<div class="card-body">
				<form name="docForm" method="post">
					<!-- 결재폼 ID -->
					<input type='hidden' name="formId" value="${docForm.formId}">	
					<!-- 결재폼 이름/설명 -->
					<div class="form-group">
						<label for="usr">제목</label> 
						<input type="text" class="form-control" id="title" name="formName" readonly value="${docForm.formName}">
					</div>
					<div class="form-group">
						<label for="usr">설명</label> 
						<input type="text" class="form-control" id="description" name="description" readonly value="${docForm.description}">
					</div>
					<br>
					<!-- 결재폼 내용 -->
					<div>
						${docForm.formContents}
					</div>
					<br>
					<br>
					
					<div style="align-content: right">
						<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath}/docFormUpdate/${docForm.formId}">
							수정
						</button>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#delModel">삭제</button>
						
						<!-- 삭제 model -->
						<div id="delModel" class="modal" tabindex="-1" role="dialog">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">Information</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <p>${docForm.formName}을 삭제하시겠습니까?</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary"  
						        		onclick="location='${pageContext.request.contextPath}/docFormDelete?formId=${docForm.formId}'" >삭제</button>
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>