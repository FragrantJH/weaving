<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">게시글 수정</h4>
						</div>
					</div>
					<br> <br>
					<div class="card-body">
						<form name="boardUpdate" method="post">
							<input type="hidden" name="boardId" value="${board.boardId}" />
							<div class="form-group">
								<label for="usr">제목</label> <input type="text"
									class="form-control" id="title" name="title"
									value="${board.title}">
							</div>
							<br>
							<textarea name="boardContents" id="editor" rows="100" cols="80">${board.boardContents}</textarea>
							<script>
								CKEDITOR.replace('editor');
							</script>
							<br> <br>
							<button class="btn btn-primary btn-sm"
								formaction="${pageContext.request.contextPath}/boardUpdate"
								formmethod="post">저장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>