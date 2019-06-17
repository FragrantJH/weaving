<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>

<style type="text/css">

.align_cover{
    text-align: left;
    right: 20px;
}
</style>

</head>
<!-- 	메일보기  -->
	<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">보낸 메일
					</h4>
				</div>
			</div>
			<div class="form-group">
						<div class="align_cover" style="float:right" >
								<label for="usr">보낸시간</label>
								<input type="text" class="form-control" name="checkTime" readonly
							value=" ${rEmailRe.checkTime}">
						</div>
					</div>
			<div class="card-body">
				<form action="mailSend" method="post" >
					
					<div class="form-group">
						<label for="usr">제목 </label>
						<input type="text" class="form-control" name="subject" readonly
							value="${rEmailRe.subject}"><br>
					</div>
					<div class="form-group">
						<label for="usr">보낸사람</label>
						<input type="text" class="form-control" name="fromEmail" readonly
							value="${rEmailRe.fromEmail}">
					</div>
					<br>
					<div class="form-group">
							${rEmailRe.emailContents}
					</div>
					<br> <br> <br> <br> <br> <br> <br> <br> <br>
				
				<div class="send-button" style="float:right;">
		
						<button type="button" class="btn btn-primary btn-sm"
								onclick="location='${pageContext.request.contextPath}/meilDeleteRe?emailId=${rEmailRe.emailId}'">삭제</button>
					</div>	
			</form>
		</div>
	</div>
	</div>


</body>
</html>