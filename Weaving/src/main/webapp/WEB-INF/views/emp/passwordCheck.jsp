<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
</script>
</head>
<body>
	 <div class="col-md-12">
	    <div class="card">
	      <div class="card-header">
	        <h4 class="card-title">사용자 정보 수정</h4>
	        <p class="category">사용자 계정을 입력해주세요.</p>
	      </div>
	      <div class="card-body">
	        <form action="${pageContext.request.contextPath}/checkPw">
				<div class="form-group">
					<label for="email"><b>이메일</b></label>
					<input class="form-control" type="text" name="email" id="email">
				</div>
				<div class="form-group">
					<label for="password"><b>비밀번호</b></label>
					<input type="password" class="form-control" name="password" id="password">
				</div>
				<div style="float: right">		
				<button type ="submit"  class="btn btn-primary btn-sm">수정하기</button>
				<button type ="button" class="btn btn-default btn-sm" onclick="location='${pageContext.request.contextPath}/home'" class="cancelbtn">돌아가기</button>
				</div>
			</form>
	      </div>
	    </div>
	  </div>
</body>
</html>