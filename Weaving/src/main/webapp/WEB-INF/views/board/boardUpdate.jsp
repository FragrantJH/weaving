<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<form action="boardUpdate" method="post">
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	제목 <input name="title" value="${board.title}"><br>
	내용
	
	<button>수정</button>
</form>
</body>



<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">게시글 수정</h4>
				</div>
			</div>
			<br>
			<br>
			<div class="card-body">
				<form action="boardInsert" method="get">
					<input type="hidden" name="board_id" value="${board.board_id}"/>
					<div class="form-group">
						<label for="usr">제목</label> 
						<input type="text" class="form-control" id="title" name="title" value="${board.title}">
					</div>
					<br>
					<textarea name="boardContents" id="editor" rows="100" cols="80" value="${board.boardContents}">
        			</textarea>
					<script>
						CKEDITOR.replace('editor');
					</script>
					<br>
					<br>
					<button type="submit">수정</button>
				</form>
			</div>
		</div>
	</div>
</body>


</html>