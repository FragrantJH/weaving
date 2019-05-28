<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body, html {
	height: 100%;
	margin: 0;
}

.bg {
	/* The image used */
	background-image:
		url("${pageContext.request.contextPath}/images/bg_1.jpg");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.centered {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgb(0, 0, 0); /* Fallback color */
	background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
	color: #f1f1f1; /* Grey text */
	width: 100%; /* Full width */
	padding: 20px; /* Some padding */
	height: 300px;
}
</style>
</head>
<body>
	<div class="bg">
	<br>
	<br>
	<br>
		<div align="center">
			<h1 class="display-3">WEAVING</h1>
		</div>
		<div class="centered">
				<form action="${pageContext.request.contextPath}/login" method="post">
					<div class="form-group">
						<label for="empNo">ID</label> 
						<input type="text" class="form-control" id="empNo" name="empNo" value="${EmpVO.empNo}">
					</div>
					<div class="form-group">
						<label for="pwd">Password</label> 
						<input type="password" class="form-control" id="pwd" name="password" value="${EmpVO.password}">
					</div>
					<div class="form-group form-check">
						<label class="form-check-label"> <input
							class="form-check-input" type="checkbox"> Remember
						</label>
					</div>
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
		</div>
	</div>
</body>
</html>