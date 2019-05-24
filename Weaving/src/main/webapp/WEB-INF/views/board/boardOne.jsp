<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<h4 class="card-title">사내게시판</h4>
				</div>
			</div>
			<br> <br>
			<div class="card-body">
				<form name="board" method="post">
					<input type='hidden' name="boardId" value="${board.boardId}">
					<div class="form-group">
						<label for="usr">제목</label> <input type="text"
							class="form-control" id="title" name="title" readonly
							value="${board.title}">
					</div>
					<div class="form-group">
						<label for="usr">작성자</label> <input type="text"
							class="form-control" id="empName" name="empName" readonly
							value="${board.empName}">
					</div>
					<br>
					<div>${board.boardContents}</div>
					<br><br><br><br><br><br><br><br>
					<div>
					Comment : <input type="text" class="form-control" id="reply" name="reply" 
					value="${reply.replyContents}">
					<button type="submit" class="btn btn-primary btn-sm">등록</button>
					</div>
					<br><br><br><br>
					<div>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/boardList?boardType=${boardType}'">목록</button>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/boardUpdate/${board.boardId}'">수정</button>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location='${pageContext.request.contextPath}/boardDelete?boardId=${board.boardId}'">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>