<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<script>
	$(document).ready(function() {
		$('#docPreview').on('show.bs.modal', function (e) {
			var data = CKEDITOR.instances.editor.getData();
			$('.modal-body').html(data);
			console.log(data);
		})
	});
	
	function saveDocForm() {
		
		if(!$("#title").val()) {
			alert("결재폼 제목을 등록해주세요.");
			return;
		}
		
		if(!CKEDITOR.instances.editor.getData()) {
			alert("결재폼 내용을 등록해주세요.");
			return;
		}
		
		document.docForm.submit();
	}
	
	</script>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">
						<c:if test="${docForm.formId == -1}">	
							결재폼 등록
						</c:if>
						<c:if test="${docForm.formId > 0}">	
							결재폼 수정
						</c:if>
					</h4>
				</div>
			</div>
			<br>
			<br>
			<div class="card-body">
				<form name="docForm" action="${pageContext.request.contextPath}/docFormInsert" method="post">
					<!-- 결재폼 ID -->
					<input type='hidden' name="formId" value="${docForm.formId}">	
					<!-- 결재폼 이름/설명 -->
					<div class="form-group">
						<label for="usr">제목</label> 
						<input type="text" class="form-control" id="title" name="formName" value="${docForm.formName}">
					</div>
					<div class="form-group">
						<label for="usr">설명</label> 
						<input type="text" class="form-control" id="description" name="description" value="${docForm.description}">
					</div>
					<br>
					<!-- 결재폼 내용 -->
					<textarea name="formContents" id="editor" rows="100" cols="80">
						${docForm.formContents}
        			</textarea>
					<script>
						CKEDITOR.replace('editor');
					</script>
					<br>
					<br>
					<div style="float: right;">
					
						<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#docPreview">
							미리보기
						</button>

						<div id="docPreview" class="modal" tabindex="-1" role="dialog">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content ">
						      <div class="modal-header">
						        <h5 class="modal-title">결재폼 미리보기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      </div>
						    </div>
						  </div>
						</div>
						<button type="button" class="btn btn-primary  btn-sm" onclick="saveDocForm()">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>