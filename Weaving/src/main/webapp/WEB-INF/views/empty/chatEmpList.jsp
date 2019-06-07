<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
  <link href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
	$(function() {
		
		empList();
		
		chat();
	});
	
	//사용자 목록 조회 요청
	function empList() {
		$.ajax({
			url : 'emplist1',
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : empListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function empListResult(data) {
		$("tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>')
			.append($('<td>').html(item.empNo))
			.append($('<td>').html(item.empName))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html(item.position))
			.append($('<td>').html('<button id="chatButton" type="button" class="btn btn-default btn-sm">chat</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_empNo\'>').val(item.empNo))
			.appendTo('tbody');
		});
	}
	
	function chat() {
		$('body').on('click', '#chatButton', function() {
			
		});
	}
	
	

</script>

</head>

<body>
	<div id="empList">
		직원 목록
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">사번</th>
					<th class="text-center">이름</th>
					<th class="text-center">부서</th>
					<th class="text-center">직책</th>
					<th class="text-center">채팅</th>
				</tr>
			</thead>
			<tbody id="user"></tbody>
		</table>
	</div>
	
	<div id="chatView" style="display: none;">
	
	</div>
</body>
</html>