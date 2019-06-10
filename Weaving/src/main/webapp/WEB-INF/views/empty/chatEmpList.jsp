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
		startChat();
	});
	
	//사용자 목록 조회 요청
	function empList() {
		$.ajax({
			url : 'getOnlineEmp',
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
			.append($('<input type=\'hidden\' id=\'hidden_empName\'>').val(item.empName))
			.appendTo('tbody');
		});
	}
	
	function startChat() {
		$('body').on('click', '#chatButton', function() {
			
			// 상대방 정보
			toEmpNo = $(this).closest('tr').find('#hidden_empNo').val();
			toEmpName = $(this).closest('tr').find('#hidden_empName').val();
			
			// 사용자 목록을 닫고,
			// 채팅 창을 띄운다
			var empNo = ${emp.empNo};
			var empName = '${emp.empName}';
			var msg = {
				cmd : 'start',
				msg : '새로운 채팅이 시작되었습니다',
				empNo : empNo,
				empName : empName,
				toEmpNo : toEmpNo,
				toEmpName : toEmpName
			};

			window.opener.webSocket.send(JSON.stringify(msg));
			
			// 채팅 창을 연다
			location = '${pageContext.request.contextPath}/startChat?toEmpNo=' + toEmpNo + '&toEmpName=' + toEmpName;
			// 현재 창을 닫고
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
			<tbody id="empList"></tbody>
		</table>
	</div>
</body>
</html>